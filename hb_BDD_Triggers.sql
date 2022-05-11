CREATE TABLE categories (  
    id int(11) ZEROFILL NOT NULL PRIMARY KEY AUTO_INCREMENT ,
    titre VARCHAR(255)
);

CREATE TABLE produits (  
    id_pdt int(11) ZEROFILL NOT NULL PRIMARY KEY AUTO_INCREMENT ,
   titre VARCHAR(255) COMMENT 'content',
   id_pdt_cat int(11) ZEROFILL NOT NULL ,
   prix DOUBLE
);

CREATE TABLE details (  
    id_det int(11) ZEROFILL NOT NULL PRIMARY KEY AUTO_INCREMENT ,
   id_cmd_det int(11) ZEROFILL NOT NULL,
   id_pdt_det int(11) ZEROFILL NOT NULL,
   prix_u DOUBLE,
   qte_det int(11) ZEROFILL NOT NULL 
);

CREATE TABLE commandes (  
    id_cmd int(11) ZEROFILL NOT NULL PRIMARY KEY AUTO_INCREMENT ,
    id_clt_cmd int(11) ZEROFILL NOT NULL ,
    total DOUBLE,
   Datec DATE
);

CREATE TABLE clients (  
    id_clt int(11) ZEROFILL NOT NULL PRIMARY KEY AUTO_INCREMENT ,
    nom VARCHAR(255),
    ville VARCHAR(255),
    age int(11) ZEROFILL NOT NULL
);

/*Pour supprimer ou faire un DROP
ALTER TABLE commandes DROP CONSTRAINT fk_id_clt_cmd;
ALTER TABLE details DROP CONSTRAINT fk_cmd;
DROP TABLE commandes;
*/

 /*LES FOREIGN KEY
ALTER TABLE commandes ADD
CONSTRAINT fk_id_clt_cmd FOREIGN KEY (id_clt_cmd) REFERENCES clients(id_clt);

ALTER TABLE details ADD
CONSTRAINT fk_cmd FOREIGN KEY (id_cmd_det) REFERENCES commandes(id_cmd);

ALTER TABLE details ADD
CONSTRAINT fk_pdt FOREIGN KEY (id_pdt_det) REFERENCES produits(id_pdt);

ALTER TABLE produits ADD
CONSTRAINT fk_cat_pdt FOREIGN KEY (id_pdt_cat) REFERENCES categories(id);
*/


/* ***** **** *** ** * MES DATAS * ** *** **** ***** ****** */ 
/* Datas CATEGORIES
INSERT INTO categories (titre) VALUES 
("informatique"),
("TV"),
("Electroménager"),
("Jeux-vidéo"),
("Mangas"),
("Lingerie"),
("Maquillage"),
("consommable");
*/

/*Datas Produits

INSERT INTO produits (titre, prix,id_pdt_cat) VALUES 
("PC Portable HP1520",1200,00000000001),
("PC Portable HP1521",1000,00000000001),
("PC Portable HP1522",990,00000000001),
("PC Portable HP1523",1320,00000000001),
("PC Portable HP1524",1250,00000000001),
("PC Portable HP1525",1520,00000000001),
("PC Portable HP1526",1430,00000000001),
("PC Portable HP1527",1100,00000000001),
("PC Portable HP1528",870,00000000001),
("TV_Samsung rentreChezToi",2790,00000000002),
("TV_Samsung resteLà",2800,00000000002),
("TV_Samsung laCarrotte",1990,00000000002),
("TV_Samsung BonneAffaire",4500,00000000002),
("TV_Samsung Voldumois",3500,00000000002),
("TV_Samsung Arnaquedujour",2500,00000000002),
("TV_Samsung prendPhilipps",2550,00000000002),
("TV_Samsung pasSony",3290,00000000002),
("TV_Samsung PasGrundig",1490,00000000002),
("Lave-linge",345,00000000003),
("Lave-linge1",355,00000000003),
("Lave-linge2",365,00000000003),
("Lave-linge3",375,00000000003),
("Lave-vaisselles1",245,00000000003),
("Lave-vaisselles2",345,00000000003),
("Lave-vaisselles3",485,00000000003),
("Lave-vaisselles4",510,00000000003),
("Lave-vaisselles5",649,00000000003),
("PLaystation5",599,00000000004),
("Playstation4 Pro",399,00000000004),
("Xbox S",599,00000000004),
("Switch Nintendo",399,00000000004),
("PSP Vita",199,00000000004),
("Game Boy",99,00000000004),
("Game Gear",99,00000000004),
("DS Nintendo",59,00000000004),
("Attari 1040ste",999,00000000004),
("OnePiece1",7,00000000005),
("OnePiece2",7,00000000005),
("OnePiece3",7,00000000005),
("OnePiece5",7,00000000005),
("OnePiece5",7,00000000005),
("OnePiece6",7,00000000005),
("OnePiece7",7,00000000005),
("OnePunchMan1",7,00000000005),
("OnePunchMan2",7,00000000005),
("OnePunchMan3",7,00000000005),
("OnePunchMan5",7,00000000005),
("OnePunchMan5",7,00000000005),
("OnePunchMan6",7,00000000005),
("OnePunchMan7",7,00000000005),
("OnePunchMan8",7,00000000005),
("OnePunchMan9",7,00000000005),
("OnePunchMan10",7,00000000005),
("OnePunchMan11",7,00000000005),
("haut",100,00000000006),
("haut",100,00000000006),
("bas",100,00000000006),
("bas",100,00000000006),
("bas",100,00000000006),
("Darj",100,00000000006),
("darj",100,00000000006),
("123L",100,00000000006),
("123L",100,00000000006),
("rouge",20,00000000007),
("bleu",20,00000000007),
("vert",20,00000000007),
("violet",20,00000000007),
("DVD",15,00000000008),
("Enceintes",15,00000000008),
("Micros",15,00000000008),
("Caches",15,00000000008),
("batteries",15,00000000008),
("souris",15,00000000008),
("clavier",15,00000000008),
("kleenex",15,00000000008),
("plaquettes",15,00000000008),
("huile",15,00000000008);
*/

/*Datas COMMANDES
INSERT INTO commandes (id_clt_cmd, Total,id_pdt_cat) VALUES 
(00000000001,2000,00000000001),
(00000000002,2200,00000000002),
(00000000003,2400,00000000003),
(00000000004,2600,00000000011),
(00000000005,2800,00000000021),
(00000000006,3000,0000000004),
(00000000007,3200,00000000005),
(00000000008,3400,00000000006),
(00000000009,3600,00000000007),
(00000000009,3800,00000000008),
(00000000010,4000,00000000009),
(00000000011,4200,00000000010),
(00000000012,4400,00000000013),
(00000000013,4600,00000000014);
*/

/*Datas CLIENTS
INSERT INTO clients (nom,ville,age) VALUES 
("Moussa","Cergy",00000000001),
("Christophe","Paris14",00000000002),
("Slimane","Virzon",00000000003),
("Geoffrey","Paris11",00000000011),
("Oum","Paris8",00000000021),
("Soumya","Paris6",0000000004),
("Ewan","Ivry",00000000005),
("Guillaume.L","Saint-Quentin",00000000006),
("Amélie","Versailles",00000000007),
("Raphael","Busan",00000000008),
("Yanni","Fontenay les Roses",00000000009),
("Kenza","Clichy",00000000010),
("Guillaume.A","Marseille",00000000013),
("Serge","Plaine Saint Denis",00000000014);

*/

/*Datas DETAILS
INSERT INTO details (id_cmd_det, prix_u,id_pdt_det,qte_det) VALUES 
(00000000001,2000,00000000001,1),
(00000000002,2200,00000000002,2),
(00000000003,2400,00000000003,3),
(00000000004,2600,00000000011,4),
(00000000005,2800,00000000021,5),
(00000000006,3000,0000000004,6),
(00000000007,3200,00000000005,7),
(00000000008,3400,00000000006,8),
(00000000009,3600,00000000007,9),
(00000000009,3800,00000000008,10),
(00000000010,4000,00000000009,20),
(00000000011,4200,00000000010,30),
(00000000012,4400,00000000013,40),
(00000000013,4600,00000000014,5);
*/

/* ***** **** *** ** * LES TRIGGERS * ** *** **** ***** ****** */ 

-- Q1 - creer un trigger qui s’exécute lors de l’insertion d’une nouvelle commande, Si le total est null , donc le trigger va remplacer le total par 0
DELIMITER //
CREATE TRIGGER Moussa AFTER INSERT 
ON commandes
for each row
BEGIN
    if NEW.total is NULL
    THEN  
    UPDATE commandes SET NEW.total  = 0; --ici UPDATE commandes pas nécessaire on est déjà dans commandes du coup juste SET... ... ...; Mais bon!
    END IF;
END // 
DELIMITER ;

--Q2 - Créer un trigger qui vérifie lors de la modification d’un détail, Si la quantité est inférieure ou égale à 0 il empêche la modification et affiche un message d’erreur ('Quantité <= 0 ‘)

DELIMITER //
CREATE TRIGGER Moussa2 BEFORE UPDATE 
ON details
FOR EACH ROW
BEGIN
    IF NEW.qte <= 0 -- La quantité que l'on veut saisir pas l'ancienne donc NEW !! 
    THEN SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Quantité <= 0';
    END IF;
END // 

DELIMITER ;

-- Q3 – Créer un trigger qui met a jour automatiquement le total d’une commande lors de l’ajout d’un détail
DELIMITER //
CREATE TRIGGER TriggCmd AFTER INSERT 
ON details
FOR EACH ROW
BEGIN
    UPDATE commandes SET total=total+1;
END// 

DELIMITER ;

/*VERSION MOUSSA */
DELIMITER //
CREATE TRIGGER Maj_Total2 AFTER INSERT
ON details
FOR EACH ROW
BEGIN
    UPDATE commandes SET total=total+ (NEW.qte_det * NEW.prix_u) WHERE 
    commandes.id_cmd = NEW.id_cmd_det;
END // 

DELIMITER ;

-- Q4 - Modifier le trigger de la question 3, Cette fois si le prix unitaire est null , il va récupérer automatiquement le prix dans la table produit.
DELIMITER //
CREATE TRIGGER Trig AFTER INSERT 
ON details
FOR EACH ROW
BEGIN
    IF NEW.prix_u IS NULL
    THEN
    UPDATE commandes SET total=
    (
        SELECT prix*qte FROM produits p, details d 
        WHERE p.id_pdt_det=d.id_pdt
    );
    END IF;
END// 

DELIMITER ;


-- Q5 – Créer un trigger qui diminue automatiquement le total d’une commande lors de la suppression d’un détail.
DELIMITER //
CREATE TRIGGER suppression AFTER DELETE 
ON commandes
FOR EACH ROW
BEGIN   
    UPDATE commandes SET total=(
        SELECT prix_u*qte FROM Details
    );   
END// 

/*VERSION MOUSSA*/
CREATE TRIGGER suppression BEFORE DELETE 
ON details
FOR EACH ROW
BEGIN   
    UPDATE commandes SET total= total -(OLD.prix_u*OLD.qte_det) WHERE
    id = OLD.id_cmd;
END// 

DELIMITER ;

DROP TRIGGER suppression;
DROP TRIGGER Trig;
DROP TRIGGER TriggCmd;
DROP TRIGGER Moussa;