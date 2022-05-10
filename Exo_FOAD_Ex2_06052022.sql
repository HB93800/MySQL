
/* //////////////////////////  EXERCICE II   //////////////////////////  */ 

CREATE TABLE departements 
(d_no INT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
d_nom VARCHAR(10),
dir VARCHAR(10),
ville VARCHAR(50));

CREATE TABLE employes 
(e_no INT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
e_nom VARCHAR(10),
prof VARCHAR(10),
Date_emb DATE,
sal int(5) NOT NULL,
comm INT(5),
d_no_e  INT(5) NOT NULL,
CONSTRAINT  fk_d_no FOREIGN KEY (d_no_e) REFERENCES departements(d_no));

/*    //////////////////////////     SAISI DE DATAS    //////////////////////////    */

INSERT INTO departements (d_nom,dir,ville) VALUES
("Production","PROD0001",Paris),
("Developpement","DEV0001",Lyon),
("Ingénieurie","ING0001",Marseille),
("Comptabilité","COMPT01",Auxerre),
("Informatique","INF0001",New Delhi);

INSERT INTO employes (e_nom,prof,Date_emb,sal,comm,d_no_e) VALUES
("Alain","Evaluateur",1981-01-05,20000,0,1),
("Alain","Evaluateur",1981-01-05,20000,0,1),
("Alain","Evaluateur",1981-01-05,20000,0,1),
("Alain","Evaluateur",1981-01-05,20000,0,1),
("Alain","Evaluateur",1981-01-05,20000,0,1),
("Alain","Evaluateur",1981-01-05,20000,0,1),
("Alain","Evaluateur",1981-01-05,20000,0,1),
("Alain","Evaluateur",1981-01-05,20000,0,1),
("Alain","Evaluateur",1981-01-05,20000,0,1),
("Alain","Evaluateur",1981-01-05,20000,0,1);






/* //////////////////////////  REPONSES AUX QUESTIONS  //////////////////////////  */ 

-- 1 Donnez la liste des employés ayant une commission --
SELECT e_nom FROM employes WHERE comm != 0;

-- 2 Donnez les noms, emplois et salaires des employés par emploi croissant, et pour chaque emploi, par salaire décroissant --
SELECT e_nom, prof, sal FROM employes GROUP BY prof ASC
UNION 
SELECT e_nom, prof, sal FROM employes GROUP BY sal DESC;

-- 3 Donnez le salaire moyen des employés --
SELECT AVG(sal) FROM employes;

-- 4 Donnez le salaire moyen du département Production --
SELECT AVG(sal) FROM employes where d_no_e HAVING d_no_e LIKE 'production';

-- 5 Donnez les numéros de département et leur salaire maximum --
SELECT d_no_e, MIN(sal) FROM employes,departements WHERE employes.d_no_e = departements.d_no;

-- 6 Donnez les différentes professions et leur salaire moyen --
SELECT prof,AVG(sal) FROM employes;

-- 7 Donnez le salaire moyen par profession le plus bas --
SELECT AVG(sal),prof FROM employes GROUP BY AVG(sal) ASC LIMIT 1;/*1ere syntaxe*/

SELECT MIN(AVG(sal)) FROM employes; /*ne fonctionne pas !!*/
-- 8 Donnez le ou les emplois ayant le salaire moyen le plus bas, ainsi que ce salaire moyen
Exercice --
SELECT AVG(sal) AS moy_sal FROM employes HAVING AVG(sal) >= MIN(moy_sal) LIMIT 3;

