
/* //////////////////////////  EXERCICE III  //////////////////////////  */ 
/*La représentation textuelle suivante est une description simplifiée d’une base de
données de gestion de facturation d’une entreprise commerciale.
• Client (Numcli, Nomcli, Prenomcli, adressecli, mailcli)
• Produit (Numprod, désignation, prix , qte_stock)
• Vendeur (Idvendeur, Nomvendeur, adresse_vend)
• Commande (Numcom, #Numcli, #Idvendeur, #Numprod, date_com,
qte_com)
On suppose que Numcli, Numprod, Idvendeur et Numcom sont de type numérique.
Le nom, le prénom et l’adresse des clients ainsi que les vendeurs sont des
informations obligatoires, le mail doit être unique.
La valeur par défaut de la quantité en stock des produits (qte_stock) est égale à 0*/

/* Creation des tables clients, produits, Vendeurs, commandes*/

-- 1 Créer les tables : Client, Produit, Vendeur et Commande. --
CREATE TABLE  Clients 
(Numcli INT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
 Nomcli VARCHAR(10), 
 Prenomcli VARCHAR(10), 
 adressecli VARCHAR (50), 
 mailcli VARCHAR(10));

 CREATE TABLE Produits 
 (Numprod INT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY, 
 designation VARCHAR(20), 
 prix INT, 
 qte_stock INT NULL);

 CREATE Table vendeurs
 (id_vend INT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
 Nom_vend VARCHAR(10),
 adresse_vend VARCHAR(50));

CREATE Table commandes
 (Numcom INT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
 Numcli_cmd INT(5) NOT NULL,
 id_vend_cmd INT(5) NOT NULL,
 Numprod_cmd INT(5) NOT NULL,
 date_cmd DATE,
 Qte_cmd INT,
 CONSTRAINT fk_Numcli FOREIGN KEY (Numcli_cmd) REFERENCES clients(Numcli),
 CONSTRAINT fk_Numprod FOREIGN KEY (Numprod_cmd) REFERENCES Produits(Numprod),
 CONSTRAINT fk_id_vend FOREIGN KEY (id_vend_cmd) REFERENCES vendeurs(id_vend));

 /* //////////////////////////  REPONSES AUX QUESTIONS  //////////////////////////  */ 

-- 2 la liste des clients de Paris. --
SELECT Nomcli,Numcli FROM Clients WHERE adressecli LIKE '%Paris%';

-- 3 la liste des produits (Numprod, désignation, prix) classés de plus cher au moins cher. --
SELECT Numprod,designation,prix FROM Produits ORDER BY prix DESC;

-- 4 noms et adresses des vendeurs dont le nom commence par la lettre ‘M’. --
SELECT Nom_vend,adresse_vend FROM vendeurs WHERE Nom_vend LIKE 'M%';

-- 5 la liste des commandes effectuées par le vendeur "Moussa" entre le 1er et 28 février. --
SELECT Numcom FROM commandes, vendeurs WHERE id_vend_cmd=id_vend AND Nom_vend like 'Moussa';

-- 6 le nombre des commandes contenant le produit n° 365. --
SELECT COUNT(Numcom) FROM commandes WHERE Numprod_cmd = 365; /* 1ere version */
SELECT COUNT(Numcom) FROM commandes,produits WHERE Numprod_cmd = Numprod and Numprod = 365; /*Attention à la perfo, ici 2 tables donc tmps rep plus long*/