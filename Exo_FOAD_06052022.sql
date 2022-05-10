
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

/* //////////////////////////  REPONSES AUX QUESTIONS  //////////////////////////  */ 

-- 1 --
SELECT e_nom FROM employes WHERE comm != 0;

-- 2 --
SELECT e_nom, prof, sal FROM employes GROUP BY prof ASC
UNION 
SELECT e_nom, prof, sal FROM employes GROUP BY sal DESC;

-- 3 --


