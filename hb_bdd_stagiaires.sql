
/* Je crée ma table stagiaires*/
CREATE TABLE stagiaires ( id INT NOT null AUTO_INCREMENT PRIMARY KEY, 
nom varchar(100), 
prenom varchar(100) );

/* Je crée ma table centre*/
CREATE TABLE centre (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
nom VARCHAR (100), 
lieu TEXT, 
spécialité VARCHAR(100)); 

/*Ajouter dans la table stagiaires les noms & prénoms ..... ....*/
INSERT	INTO stagiaires (nom,prenom) VALUES 
("BENAMAR", "Hassan"), 
("DUPONT", "Jean"),
("ZAK", "Henri"),
("CAMARA", "Moussa");

/*Insérer les informations liées à la table centre*/
INSERT	INTO centre (nom,Lieu,spécialité) VALUES 
("AFPA", "Paris","CDA"), 
("AFPA", "Marseille","Dev Mobile"),
("AFPA", "Lyon","Marketing");

/* Modifier le nom ZAK par Kassimi*/
UPDATE stagiaires SET nom="KASSIMI" WHERE nom="ZAK";

/*Ajouter une colonne email à la table stagiaires*/
ALTER TABLE stagiaires ADD email VARCHAR(100);

SELECT id,nom,prenom,email FROM stagiaires;

/* Supprimer dans la table stagiaires CAMARA Moussa*/
DELETE FROM stagiaires WHERE nom="CAMARA";

/* Insérer dans Stagiaires Vanessa SULTAN vanessa@afpa.fr*/
INSERT INTO stagiaires (nom, prenom, email) VALUES ("SULTAN","Vanessa","vanessa@afpa.fr");
INSERT INTO stagiaires (nom, prenom, email) VALUES ("BENAMAR","Najoua","Bnajoua@afpa.fr");

/* Grouper par nom ayant la synthaxe BENAMAR */
SELECT * FROM stagiaires GROUP BY nom HAVING nom LIKE "BENAMAR";

/* Tout afficher*/
SELECT * FROM stagiaires;

/* On filtre sur le nom BENAMAR (2 lignes)*/
SELECT * FROM stagiaires HAVING nom LIKE "BENAMAR";

/* Affichage par UNION de 2 tables différentes mais attention il faut tjs le même nbre de colonne*/
SELECT nom,prenom FROM stagiaires
UNION
SELECT nom,lieu FROM centre;

/* classer le tableau par ordre alphabétique de la colonne sélectionnée, ici prénom */
SELECT * FROM stagiaires ORDER BY prenom;

/* classer le tableau par ordre décroissant */
SELECT * FROM stagiaires ORDER BY id DESC;

/* classer le tableau par ordre croissant */
SELECT * FROM stagiaires ORDER BY id ASC;

/* classer le tableau par ordre décroissant resultat limité à 2 avec un offset de 1 (com-
-mence après le 1er)*/
SELECT * FROM stagiaires ORDER BY id DESC LIMIT 2 OFFSET 1;
SELECT * FROM stagiaires;