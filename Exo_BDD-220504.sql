CREATE TABLE etudiant(  
    pk_id_etudiant int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    matricule_etudiant INT(6),
    nom_etudiant VARCHAR(100),
    prenom_etudiant VARCHAR(100),
    birthdate_etudiant DATE,
    niveau_etudiant INT(2));


CREATE TABLE cours(  
    pk_id_cours int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    code_cours INT(10),
    nom_cours VARCHAR(100),
    enseignant_cours VARCHAR(100));

CREATE TABLE examen(  
    pk_id_exam int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    code_exam INT(10),
    matricule_exam INT,
    notes_exam INT(2),
    enseignant_cours VARCHAR(100));

/*Afiicher les étudiants triés par date de naissance ordre croissant*/
SELECT * FROM etudiant ORDER BY birthdate_etudiant ASC;

/*Afiicher les étudiants inscrits en M1 & M2*/
SELECT * FROM etudiant WHERE niveau_etudiant="M1" OR niveau_etudiant="M2";

/*On ajoute une colonne à la table examen*/
ALTER TABLE examen ADD etudiant INT NOT NULL;

/*Renommer une table*/
ALTER TABLE etudiant RENAME AS Etudiants;

/*Affecter la clé id_étudiant comme clé secondaire de la table examen*/
/* Important modification de strucutre : je demande que ma colonne étudiant dans examen devienne le réceptacle de mes clés secondaires*/
ALTER TABLE examen ADD
CONSTRAINT fk_id_cours FOREIGN KEY (etudiant) REFERENCES Etudiants (pk_id_etudiant);

/*Pareille pour créer une liaison cours dans examen*/
ALTER TABLE examen ADD num_cours INT NOT NULL;

ALTER TABLE examen ADD
CONSTRAINT fk_id_cours FOREIGN KEY (num_cours) REFERENCES cours (pk_id_cours);

/*J'affiche les étudiants qui ont fait l'examen sur le cours 002*/
SELECT etudiant FROM examen WHERE num_cours="002";

/* partie 4 exo*/
SELECT etudiant FROM examen WHERE num_cours="001" OR num_cours="002";

/* partie 5 exo (ici on fait un x2 et donne un alias à notes_exam qui est Notes sur 40) */
SELECT code_exam,notes_exam, notes_exam*2 as'Notes sur 40'   FROM examen GROUP BY matricule_exam,code_exam ASC;

/* partie 6 exo*/
SELECT AVG(notes_exam)  from examen WHERE num_cours="002"; 

/* partie 7 exo*/
SELECT COUNT(code_exam) FROM examen WHERE etudiant=1;

/* partie 8 exo*/
SELECT COUNT(etudiant) FROM examen WHERE num_cours="002";

/* partie 9 exo*/
SELECT AVG(notes_exam) FROM examen WHERE etudiant=1;

/* partie 10 exo (avec l'afichage des étudiants)*/
SELECT etudiant,COUNT(code_exam) FROM examen GROUP BY etudiant;

/* partie 11 exo*/
SELECT Etudiant,AVG(notes_exam) FROM examen GROUP BY etudiant;

/* partie 12 exo*/
SELECT etudiant,AVG(notes_exam) FROM examen GROUP BY etudiant HAVING AVG(notes_exam) >= 15;

/* partie 13 exo*/
SELECT code_exam,AVG(notes_exam) FROM examen GROUP BY code_exam; 














