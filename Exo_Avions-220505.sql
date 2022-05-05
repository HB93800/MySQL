SELECT id,nom,prenom,email FROM stagiaires;

SELECT pk_id_etudiant,matricule_etudiant,nom_etudiant,prenom_etudiant,birthdate_etudiant,niveau_etudiant FROM etudiants;

SELECT pk_id_etudiant,matricule_etudiant,nom_etudiant,prenom_etudiant,birthdate_etudiant,niveau_etudiant FROM etudiants;


INSERT INTO etudiants (matricule_etudiant, nom_etudiant,prenom_etudiant, birthdate_etudiant, niveau_etudiant) VALUES (1,"BENAMAR","Hassan","1978-06-16","15");

CREATE TABLE avion 
(id_avion INT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
nom_avion VARCHAR(10),
capa_avion INT(3) ZEROFILL,
Localisation_avion VARCHAR(50));

CREATE TABLE vols 
(id_vol INT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
num_vol VARCHAR(6),
num_av INT(6) NOT NULL,
num_pil INT(2) NOT NULL,
ville_dep_vol VARCHAR(50),
ville_arr_vol VARCHAR(50),
heure_dep_vol TIME,
heure_arr_vol TIME,
CONSTRAINT fk_num_pil FOREIGN KEY (num_pil) REFERENCES pilotes (id_pil)
);


/*SHOW KEYS from vols;*/

/*ALTER TABLE vols ADD
CONSTRAINT fk_num_pil FOREIGN KEY (num_pil) REFERENCES pilotes (num_pil);*/

DROP TABLE vols;

CREATE TABLE pilotes 
(id_pil int(2) NOT NULL AUTO_INCREMENT PRIMARY KEY, 
num_pil INT(5) not NULL,
nom_pil VARCHAR(20),
add_pil VARCHAR(100),
salaire_pil  INT(6));

DROP TABLE pilotes;

INSERT INTO avion (nom_avion, capa_avion, localisation_avion) VALUES
("Alpha",300,"Paris"),
("Delta",400,"Milan"),
("Delta",350,"Rome");

INSERT INTO vols (num_vol, num_av, num_pil, ville_dep_vol,ville_arr_vol,heure_dep_vol,heure_arr_vol ) VALUES
("AF351","152010",01,"Paris","New-York","09:00:00","17:00:00"),
("RU154","458950",02,"Canada","Londres","13:00:00","22:00:00"),
("LH1792","538710",03,"Paris","Tunis","11:00:00","21:00:00");

INSERT INTO pilotes (num_pil,nom_pil, add_pil, salaire_pil) VALUES
(00001,"Moussa","Paris",650000),
(00003,"Afpa","Marseille",900000),
(00002,"Zack","Cergy",750901),
(00002,"Zack","Cergy",350000);

INSERT INTO pilotes (num_pil,nom_pil, add_pil, salaire_pil) VALUES
(00004,"Hassan","Meknès",450000);

/*Question 1*/
SELECT DISTINCT nom_pil, add_pil,salaire_pil FROM pilotes;

/*Question 2*/
SELECT num_pil,ville_dep_vol FROM vols;

/*Question 3*/
SELECT nom_avion FROM avion WHERE capa_avion > 350;

/*Question 4*/
SELECT nom_avion FROM avion WHERE Localisation_avion="Paris";

/*Question 5*/
SELECT COUNT(Localisation_avion) FROM avion;

/*Question 6*/
SELECT nom_pil FROM pilotes WHERE add_pil="Cergy" AND salaire_pil > 500000;

/*Question 7*/
SELECT nom_avion, id_avion FROM avion WHERE Localisation_avion="Paris" AND capa_avion < 350;

/*Question 8*/
SELECT num_vol FROM vols WHERE ville_dep_vol="Paris" AND ville_arr_vol="New-York" AND heure_dep_vol > "18:00:00";

/*Question 9*/
SELECT * FROM pilotes WHERE num_pil NOT IN (SELECT num_pil FROM vols );


/*Question 10*/
SELECT num_vol,ville_dep_vol,num_pil FROM vols WHERE num_pil="1" OR num_pil="2";

/*Question 11*/
SELECT nom_pil FROM pilotes WHERE nom_pil LIKE "Z%"; 

/*Question 12*/
SELECT nom_pil FROM pilotes WHERE nom_pil LIKE "__u%"; 

/*----------------------------------------------------------*/