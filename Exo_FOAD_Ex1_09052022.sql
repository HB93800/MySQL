CREATE TABLE employes(  
    eno int(2) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    e_nom VARCHAR(15),
    Date_emb DATE,
    sal INT,
    comm INT,
    Dno int(1)
);
ALTER TABLE employes ADD prof VARCHAR(10);

CREATE TABLE departements(  
    Dno int(1) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    d_nom VARCHAR(10),
    Dir INT(2),
    ville VARCHAR(10));
ALTER TABLE employes ADD
CONSTRAINT fk_Dno FOREIGN KEY (Dno) REFERENCES departements(Dno);

/*Saisir les Datas*/
INSERT INTO Departements (d_nom,Dir, VILLE) VALUES
("Commercial",30, "New York"),
("Production",20, "Houston"),
("Developpement",40,"Boston");

   INSERT INTO Employes (eno,e_nom,PROF,DATE_EMB,SAL,COMM,DNO) VALUES
(10,'Joe','Ingénieur','1993-10-01',4000,3000,3),
(20,'Jack','Technicien','1988-05-01',3000,2000,2),
(30,'Jim','Vendeur','1980-03-01',5000,5000,1),
(40,'Lucy','Ingénieur','1980-03-01',5000,5000,3);

INSERT INTO Departements (d_nom,Dir, VILLE) VALUES
("Commercial",30, "Whashington");

   INSERT INTO Employes (eno,e_nom,PROF,DATE_EMB,SAL,COMM,DNO) VALUES
(50,'Moussa','Dev','1988-05-01',4500,5000,1);

   INSERT INTO Employes (eno,e_nom,PROF,DATE_EMB,SAL,COMM,DNO) VALUES
(50,'Jean-Marie','Manager','1988-05-01',6000,5000,3);

   INSERT INTO Employes (eno,e_nom,PROF,DATE_EMB,SAL,COMM,DNO) VALUES
(60,'Slimane','Vendeur','1988-05-01',6000,5000,1);

/*Réponses aux questions*/

-- 1 Requête 1: Faire le produit cartésien en Employés et Départements 
SELECT eno From employes
CROSS JOIN departements;

 -- 2 Requête 2: Donnez les noms des employés et les noms de leur département
SELECT e_nom, D_nom  From employes E,departements D WHERE E.Dno = D.Dno; 

--3 Requête 3: Donnez les numéros des employés travaillant à Boston 

SELECT eno, E_nom From employes E INNER JOIN departements D
ON E.Dno= D.Dno
AND VILLE LIKE 'BOSTON';


-- 4 Donnez les noms des directeurs de département 1 et 3.
SELECT E_nom FROM employes E INNER JOIN departements D
--ON E.Dno = D.Dno
--AND D.Dir=E.Eno AND D.Dno !=2;
ON eno = Dir AND D.Dno IN (1,3); 

-- 5 Donnez les noms des employés travaillant dans un département avec au moins un ingénieur 
SELECT e_nom FROM employes E WHERE PROF LIKE 'Ingénieur' OR Dno=3;/*FAUX*/
SELECT e_nom from employes E INNER JOIN departements D
On E.Dno=D.Dno
AND D.D_nom LIKE'Développem'; /*2e Syntaxe Fausse aussi*/

                    /*Bonne version 5*/
SELECT e_nom FROM employes WHERE Dno IN (SELECT Dno FROM employes WHERE prof LIKE 'Ingénieur');
                   /* Avec INNER JOIN */ 
SELECT e_nom FROM employes E INNER JOIN departements D
ON E.Dno=D.Dno
AND e.Dno IN
(SELECT Dno FROM employes WHERE prof LIKE 'Ingénieur');

/*Amelie*/
SELECT DISTINCT e.E_nom FROM employes e INNER JOIN employes e2 ON e.DNO=e2.DNO WHERE e2.PROF LIKE 'ingénieur';

-- 6 Donnez le salaire et le nom des employés gagnant plus qu'un (au moins un)ingénieur 
SELECT e_nom, sal FROM employes WHERE sal > (SELECT min(sal) AS sal_ing from employes WHERE prof LIKE 'Ingénieur');
/*Ici création d'Alias "sal_ing" inutile */


-- 7 Donnez les salaires et le nom des employés gagnant plus que tous les ingénieurs 

SELECT SAL+COMM, e_nom FROM employes WHERE sal+comm >= (SELECT max(SAL + comm) FROM employes WHERE prof like 'Ingénieur') AND prof NOT LIKE 'Ingénieur' ;

-- 8 Donnez les noms des employés et les noms de leur directeur. 
 /*A refaire !!!*/
SELECT e_nom, D.Dir FROM employes E INNER JOIN departements D
On E.Dno = D.Dno
-- and D.Dir = 30
;
-- AND (Select E_nom FROM employes E,departements D WHERE E.eno = D.Dir);

/*Geoffrey*/
SELECT E_NOM,DIRNOM FROM Employes INNER JOIN(SELECT DNO,E_NOM AS DIRNOM FROM Employes 
WHERE ENO = ANY (SELECT DIR FROM Departements INNER JOIN Employes USING(DNO))) bob USING (DNO) ;

/*MOUSSA*/
SELECT e.enom, e2.enom FROM employes e /*e2 table fictive créée après */
inner join departements d
inner join employes e2 /* Création de la tbale fictive "e2" */
on e.DNO=d.DNO  /*condition : on prend les colonnes communes e.Dno ( de employes) & D.Dno (de departements) */
AND e2.eno =d.dir /* AND entre e2.eno (de la table virtuelle) et D.Dir (Directeur de Dpt) */
AND e.eno != e2.eno; /* AND e.eno (n°employés) différent de e2.eno (n°employés de ma table virtuelle)*/

/* GUILLAUME.L */
SELECT E_NOM, NOM FROM employes /*NOM est un alias créé dans le select il représente E_nom*/
INNER JOIN 
(SELECT DNO as num , E_nom as NOM FROM employes /*Ald d'une table un select mais qui sera mis en alias p pour leurer INNER JOIN*/
INNER JOIN departements 
USING(DNO) WHERE dir = ENO) as p /*nécessaire à INNER JOIN, qui a besoin d'une table (virtuelle) !*/
ON num = DNO ; /* Ma condition num = Dno avec num alias créé ald Dno & */



-- 9 Trouvez les noms des employés ayant le même directeur que JIM
SELECT e_nom FROM employes E INNER JOIN departements D
ON D.Dno=E.Dno
AND D.Dir = 30;
/* Version MOUSSA*/
SELECT e_nom FROM employes WHERE Dno in(
SELECT e.Dno FROM employes e, departements d
WHERE e.Dno = D.Dno
AND e_nom LIKE 'Jim'
);

/* OUM SANS LE DIRECTEUR Lui_même qui est Jim */
SELECT e_nom FROM employes WHERE 
e_nom <> "Jim"
AND Dno in(
SELECT Dno FROM employes
WHERE e_nom LIKE 'Jim'
);

/* AMELIE avec INNER JOIN */
SELECT e_nom FROM employes e INNER JOIN departements d 
ON e.dno=d.dno 
and e.eno!=d.dir 
WHERE d.DIR=(
    SELECT d.DIR FROM employes e INNER JOIN departements d ON e.dno=d.dno WHERE e.e_nom LIKE "jim"

);

INNER JOIN departements d
SELECT e.Dno FROM employes e, departements d
WHERE e.Dno = D.Dno
AND e_nom LIKE 'Jim'
);

-- 10 Donnez le nom et la date d'embauche des employés embauchés avant leur directeur ; donnez également le nom et la date d'embauche du dit directeur 
SELECT e_nom,Dir, Date_emb FROM employes E INNER JOIN departements D
on D.Dno = E.Dno
AND Date_emb < (SELECT Date_emb FROM Employes E, departements D WHERE E.Eno = Dir);


/* Version MOUSSA*/

-- lgn 73 équivaut à :
SELECT e_nom, date_emb 
FROM employes; /* On affiche tout*/

-- Ici 2e partie Lgn 178, on regarde les dates des directeurs en départements
SELECT date_emb
        FROM  departements D, employes E
        WHERE E.DNO = D.DNO
        --AND DNO = DNO
        AND eno = dir;

SELECT e1.e_nom, e1.date_emb, e2.e_nom, e2.date_emb -- Création de d'infos et de tables fictives e1 pour les empl. e2 pour les directeurs
FROM employes e1, employes e2 -- on pointe sur les tbls fictives
WHERE (e1.date_emb) < -- Ici on compare les dates embauches des employés (tbl.employes) aux dates d'embauches des Directeur (tbl.departements)
    (
        SELECT e2.date_emb -- on selectionne les dates d'ambauches des directeurs
        FROM  departements d -- pointe sur table departements
        WHERE d.DNO = e2.DNO -- conditions: Dno (N°de dpt) de la table empDir et de departements égaux
        AND e1.DNO = e2.DNO -- & Dno (N°de dpt) employés et directeurs égaux
        AND e2.eno = d.dir  -- & eno (n°des employés) et dir (n°de Directeur) égaux !

);

/* GUILLAUME.L */
SELECT ENOM, DATEEMB, NOM, DATE_E FROM employés 
INNER JOIN (
    SELECT DNO as num,ENOM as NOM, DATEEMB as DATE_E FROM employés INNER JOIN départements USING(DNO) WHERE dir = ENO
) as p 
ON num = DNO WHERE DATEEMB<=DATE_E;


-- 11 Donnez les départements qui n'ont pas d'employés 
SELECT Dno FROM departements where Dno NOT IN (SELECT Dno FROM employes);

/*VERSION MOUSSA*/

SELECT * FROM departements d
LEFT JOIN employes e
ON d.Dno = e.Dno
WHERE e.Dno is NULL;



-- 12 Donnez les noms des employés du département commercial embauchés le même jour qu'un employé du département Production
SELECT e_nom, Date_emb from employes E -- On selectionne les nom et dates d'embauche des employés de la tbl.employes
INNER JOIN departements D -- jointe à la tbl.departements.
ON E.Dno = D.Dno -- Condition : Dno de employes et departements égaux
AND D.D_nom like'Commercial'  -- & nom de dpt (D_nom) = commercial
AND Date_emb IN (  -- Avec condition sur la date d'embauche (Date_emb)
    -- Select Date_emb FROM employes WHERE Dno=2 Dans ma version on force le résultat !!! 
    SELECT Date_emb FROM employes e -- On selectionne Date_emb de employes
    INNER JOIN departements d -- joint à la tbl.departements
    ON  e.Dno = d.Dno -- où Dno de employes & departements sont égaux
    AND D_nom like 'Production' -- & nom de dpt (D_nom) = production


/*****  **** *** ** ** *  *  * AVEC CORRECTION MOUSSA *   *   *  **    *** ****  *****/

);

-- 13 Donnez les noms des employés embauchés avant tous les employés du département 1. 
/* VERSION GEOFFREY */
SELECT E_NOM,DATE_EMB FROM Employes 
INNER JOIN Departements 
USING(DNO)
WHERE DATE_EMB <
ALL(
    SELECT (DATE_EMB) FROM Employes 
    WHERE DNO=1
    ); /* ANY compare à au moins un */


-- 14 Donnez les noms des employés ayant le même emploi et le même directeur que JOE.
/* VERSION OUM */
SELECT e_nom FROM employes 
WHERE e_nom <> "Joe"
AND dno In (SELECT dno FROM employes WHERE e_nom like "Joe");

SELECT E_NOM FROM Employes 
INNER JOIN Departements USING(DNO)
WHERE (DIR,PROF)=ANY(SELECT DIR,PROF FROM Employes INNER JOIN Departements USING(DNO) WHERE E_NOM LIKE "Joe");