
CREATE TABLE Representation 
(num_rep INT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
titre_rep VARCHAR(6),
lieu_rep VARCHAR(50)
);

CREATE TABLE Musicien 
(Num_mus INT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(10),
num_rep INT(5) NOT NULL,
CONSTRAINT fk_num_rep FOREIGN KEY (num_rep) REFERENCES Representation (num_rep)
);

CREATE TABLE Programmer 
(id_prog INT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_prg DATE,
num_rep_prg INT(5) NOT NULL,
tarif INT(4) NOT NULL,
CONSTRAINT fk_num_rep2 FOREIGN KEY (num_rep_prg) REFERENCES Representation (num_rep)
);

INSERT INTO representation (titre_rep,lieu_rep) VALUES
("Scandale", "Théâtre JCC"),
("A fond le dev","Paris Bercy"),
("Chante joyeusement","Fion");


INSERT INTO representation (titre_rep,lieu_rep) VALUES
("Manfo", "Théâtre AFPA"),
("Dev1","Paris 15e"),
("Dev2","Tions");

INSERT INTO musicien (nom,num_rep) VALUES
("Miguel", 00001),
("Santana",00002),
("Gaylord",00003);

INSERT INTO musicien (nom) VALUES
("Georges"),
("Harry"),
("JCVD");

INSERT INTO programmer (date_prg,num_rep_prg, tarif) VALUES
(1995-12-24, 00001,1500),
(2015-10-21,00002,2000),
(2022-05-22,00003,);
 
 /* Question 1*/
 SELECT titre_rep FROM representation;

 /* Question 2*/
 SELECT titre_rep FROM representation WHERE lieu_rep="Théâtre JCC";

/*Question 3*/ 
SELECT nom, titre_rep, date_prg FROM representation, musicien, programmer WHERE 
(Musicien.num_rep  = representation.num_rep); 

/*Question 4*/
SELECT titre_rep, lieu_rep, tarif, date_prg FROM programmer, representation, musicien WHERE 
(Musicien.num_rep  = representation.num_rep AND Programmer.date_prg="2021-02-28"); 
 


