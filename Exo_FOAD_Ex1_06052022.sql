/* //////////////////////////  EXERCICE I   //////////////////////////  */ 


/*Creation table representation*/
CREATE TABLE Representation 
(num_rep INT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
titre_rep VARCHAR(6),
lieu_rep VARCHAR(50),
Musicien_lk INT(5));

/*Erreur dans la création de ma colonne Musicien_lk, je la droppe*/
ALTER TABLE representation DROP Musicien_lk;
/*Du coup je crée une nvlle colonne Musicien_lk pour ma FK*/

ALTER TABLE representation ADD Musicien_lk INT(5) NOT NULL;


/*Creation table musicien*/
CREATE TABLE Musicien 
(Num_mus INT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(10),
num_rep INT(5) NOT NULL);

/*Creation table programmer*/
CREATE TABLE Programmer 
(id_prog INT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_prg DATE,
num_rep_prg INT(5),
tarif INT(4) NOT NULL
);

-- DROPer une table 1/ droper la foreign key puis la table--

--1 voir les KEYS--
SHOW KEYS FROM representation;
SHOW KEYS FROM Musicien;
SHOW KEYS FROM programmer;

--2 DROPer les Foreign KEY
ALTER TABLE representation DROP CONSTRAINT fk_num_mus;
ALTER TABLE musicien DROP CONSTRAINT fk_num_rep;
ALTER TABLE programmer DROP CONSTRAINT fk_num_rep2;
ALTER TABLE musicien DROP num_rep;
ALTER TABLE musicien ADD num_rep INT(5);


--3 DROPer les Tables
DROP TABLE representation;
DROP TABLE musicien;
DROP TABLE programmer;


/*Je crée mes FK Musicien dans mes tables */
ALTER TABLE representation ADD 
CONSTRAINT fk_num_mus FOREIGN KEY (Musicien_lk) REFERENCES Musicien (Num_mus);
ALTER TABLE musicien ADD 
CONSTRAINT fk_num_rep FOREIGN KEY(num_rep) REFERENCES representation(num_rep);
ALTER TABLE programmer ADD
CONSTRAINT fk_num_rep2 FOREIGN KEY (num_rep_prg) REFERENCES representation(num_rep);

-- JE METS MES DATAS DANS MES COLONNES DE CHAQUE TABLE --


INSERT INTO Musicien (num_rep) VALUES 
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20);

INSERT INTO Musicien (nom,num_rep) VALUES 
("Corneille",00001),
("GrandCorpsMalade",00002),
("Soprano",00003),
("NTM",00004),
("IAM",00005),
("ThisIsLaPeste",00006),
("Diams",00007),
("Gims",00008),
("Sniper",00009),
("Doc",00010);

INSERT INTO Programmer(date_prg, tarif, num_rep_prg) VALUES
("2021-02-28",20,1),
("2021-01-25",25,2),
("2021-03-25",30,3),
("2021-04-25",29,4),
("2021-05-25",35,5),
("2021-06-25",29,6),
("2021-07-25",325,7),
("2021-08-25",40,8),
("2021-02-28",32,9),
("2021-09-25",29,10);

INSERT INTO Representation (titre_rep,lieu_rep,Musicien_lk) VALUES
("Vas la-bas" , "Théâtre JCC" , 1),
("Vas par là", "MJC 93", 2),
("Vas au dela" , "Opéra Paris" , 3),
("Vas plus bas" , "Théâtre Mogador" , 4),
("Vas pas là" , "La Cygalle" , 5),
("Viens ici" , "Zenith", 6),
("N\'y va pas" , "Olympia" , 7),
("Venez là" , "Bercy" , 8),
("ten va pas" , "Stade de France" , 9),
("vas t\'en" , "République" , 10);

/* //////////////////////////  REPONSES AUX QUESTIONS  //////////////////////////  */ 

--1 La liste des titres des représentations. --
SELECT titre_rep FROM representation;

--2 La liste des titres des représentations ayant lieu au « théâtre JCC ». --
SELECT titre_rep,lieu_rep FROM representation WHERE lieu_rep like 'Théâtre JCC';

--3 La liste des noms des musiciens et des titres et les titres des représentations auxquelles ils participent. --
SELECT nom, titre_rep, date_prg FROM musicien, representation, programmer WHERE musicien.num_rep = representation.num_rep AND musicien.num_rep = programmer.num_rep_prg;

--4 La liste des titres des représentations, les lieux et les tarifs du 28/02/2021. --
SELECT titre_rep, lieu_rep, tarif FROM representation, programmer WHERE representation.num_rep = programmer.num_rep_prg AND date_prg = "2021-02-28";

--5 Le nombre des musiciens qui participent à la représentations n°15. --
SELECT count(Num_mus),nom,lieu_rep  FROM musicien,representation WHERE musicien.num_rep = representation.num_rep AND representation.num_rep= 5;

--6 Les représentations et leurs dates dont le tarif ne dépasse pas 30Euros. --
SELECT titre_rep, date_prg, tarif FROM representation, programmer WHERE programmer.num_rep_prg = representation.num_rep AND tarif < 30;
