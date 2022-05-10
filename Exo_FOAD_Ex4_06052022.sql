/* ///////////////////  EXERCICE IV   //////////////////  */ 

/*Un organisme de gestion de spectacles, de salles de concert et de vente de billets de spectacles
gère une base de données dont le schéma relationnel est le suivant :

Spectacle (Spectacle_ID, Titre, DateDéb, Durée, Salle_ID, Chanteur)
Concert (Concert_ID, Date, Heure, Spectacle_ID)
Salle (Salle_ID, Nom, Adresse, Capacité)
Billet (Billet_ID, Concert_ID, Num_Place, Catégorie, Prix)
Vente (Vente_ID, Date_Vente, Billet_ID, MoyenPaiement)

Les attributs soulignés sont les attributs appartenant à la clé primaire. Ils sont de type entier.
L’attribut Salle_ID de la relation Spectacle est une clé étrangère qui fait référence à l’attribut
de même nom de la relation Salle. L’attribut Spectacle_ID de la relation Concert est une clé
étrangère qui fait référence à l’attribut de même nom de la relation Spectacle. L’attribut
Concert_ID de la relation Billet est une clé étrangère qui fait référence à l’attribut de même
nom de la relation Concert.*/

/* Creation des tables clients, produits, Vendeurs, commandes*/
CREATE TABLE Spectacle 
(Spectacle_ID INT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
Titre VARCHAR(10), 
DateDéb DATE, 
Durée TIME, 
Salle_ID int(5) NOT NULL, 
Chanteur VARCHAR(10));

/*Ajout de la Foreign Key Salle_ID de Salle dans Spectacle*/
ALTER TABLE spectacle ADD
CONSTRAINT fk_Salle_ID FOREIGN KEY (Salle_ID) REFERENCES Salle(Salle_ID);

CREATE TABLE Concert 
(Concert_ID INT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY, 
Date_Concert DATE, 
Heure_concert TIME, 
Spectacle_ID_concert int(5) NOT NULL,
CONSTRAINT fk_Spectacle_ID FOREIGN KEY (Spectacle_ID_concert) REFERENCES Spectacle (Spectacle_ID));

CREATE TABLE Salle 
(Salle_ID INT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY, 
Nom VARCHAR(10), 
Adresse VARCHAR(100), 
Capacité INT(4) NOT NULL);
CREATE TABLE Billet 
(Billet_ID INT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY, 
Concert_ID_bt INT(5) NOT NULL , 
Num_Place INT(4) NOT NULL, 
Catégorie VARCHAR(10), 
Prix INT(3) NOT NULL,
CONSTRAINT fk_Concert_ID_bt FOREIGN KEY (Concert_ID_bt) REFERENCES Concert (Concert_ID));

CREATE TABLE Vente 
(Vente_ID INT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY, 
Date_Vente DATE, 
Billet_ID_vente INT(5) NOT NULL , 
MoyenPaiement VARCHAR(10),
CONSTRAINT fk_Billet_ID FOREIGN KEY (Billet_ID_vente) REFERENCES Billet(Billet_ID)
);

/* //////////////////////////  REPONSES AUX QUESTIONS  //////////////////////////  */ 

-- 1 Quelles sont les dates du concert de Corneille au Zenith ?
--
SELECT chanteur, DateDéb FROM spectacle, salle WHERE Spectacle.Salle_ID=Salle.Salle_ID AND Salle.Salle_ID LIKE 'Zenith';  

-- 2 Quels sont les noms des salles ayant la plus grande capacité ?
 --
SELECT Nom FROM Salle WHERE Capacité IN (SELECT Capacité HAVING AVG(Capacité) < Capacité);

-- 3 Quels sont les chanteurs n’ayant jamais réalisé de concert à la Cygale ? --
SELECT chanteur FROM spectacle, salle WHERE Spectacle.Salle_ID NOT IN (SELECT Salle_ID FROM  Salle WHERE NOM LIKE 'Cygale'); 

-- 4 Quels sont les chanteurs ayant réalisé au moins un concert dans toutes les salles ? --
SELECT chanteur FROM Spectacle, salle HAVING COUNT(Spectacle.Salle_ID) IN 
(SELECT COUNT(Salle_ID) FROM Salle);

-- version Moussa --
SELECT Spectacle.Chanteur
    FROM Spectacle,Salle 
    WHERE Spectacle.Salle_ID=Salle.Salle_ID 
    AND COUNT(Salle.Salle_ID)=(SELECT COUNT(Salle_ID) FROM Spectacle GROUP BY Salle_ID);

-- 5 Quels sont les dates et les identificateurs des concerts pour lesquels il ne reste aucun billet invendu ? --
SELECT Date_Concert,Concert_ID FROM Concert,vente, billet, salle 
HAVING Count(Billet_ID_vente)=COUNT(Billet_ID) /*AND COUNT(Billet_ID)=Salle.capacité*/;

SELECT Date_Concert,Concert_ID FROM Concert,vente, billet HAVING Count(Billet_ID_vente)=COUNT(Billet_ID);
