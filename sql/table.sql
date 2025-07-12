CREATE DATABASE projetbiblio;
use projetbiblio;
CREATE TABLE bibliothecaire(
    idBibliothecaire INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(50),
    email VARCHAR(100),
    password VARCHAR(100)
);
CREATE TABLE typeAdherant(
    idTypeAdherant INT,
    libelle VARCHAR(30)
);
CREATE TABLE adherant (
    idAdherant INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(50),
    contact VARCHAR(15),
    email VARCHAR(100),
    password VARCHAR(100),
    idTypeAdherant INT,
    FOREIGN KEY (idTypeAdherant) REFERENCES typeAdherant(idTypeAdherant)
);

CREATE TABLE abonnement(
    idAbonnement INT AUTO_INCREMENT PRIMARY KEY,
    idAdherant INT,
    dateDebut DATE,
    dateFin DATE,
    Foreign Key (idAdherant) REFERENCES adherant(idAdherant)
);

CREATE TABLE jourFerier(
    idJourFerier INT AUTO_INCREMENT PRIMARY KEY,
    date DATE,
    description VARCHAR(50)
);

CREATE TABLE typeLivre(
    idTypeLivre INT AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR(20)
);
CREATE TABLE livre(
    idLivre INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(100),
    auteur VARCHAR(50),
    anneePublication DATE,
    idTypeLivre INT,
    langue VARCHAR(50),
    accessibilite INT,
    Foreign Key (idTypeLivre) REFERENCES typeLivre(idTypeLivre)
);

CREATE TABLE exemplaire(
    idExemplaire INT AUTO_INCREMENT PRIMARY KEY,
    idLivre INT,
    numExemplaire VARCHAR(20),
    etat VARCHAR(15),
    status VARCHAR(15) DEFAULT "Libre",
    Foreign Key (idLivre) REFERENCES livre(idLivre)
);
CREATE TABLE reservation(
    idReservation INT AUTO_INCREMENT PRIMARY KEY,
    idAdherant INT,
    idExemplaire INT,
    dateReservation DATE,
    status VARCHAR(15) DEFAULT "En cour"
);

----
CREATE TABLE typePret (
    idTypePret INT AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR(20) -- 'Domicile' ou 'SurPlace'
);
CREATE TABLE quotaPret (
    idQuotaPret INT AUTO_INCREMENT,
    idTypePret INT,
    idTypeAdherant INT,
    quota INT,              -- nombre maximum de livres pour ce type de prêt
    delaiPret INT,          -- durée autorisée en jours (par exemple : 4 jours)
    PRIMARY KEY (idQuotaPret, idTypePret, idTypeAdherant),
    FOREIGN KEY (idTypePret) REFERENCES typePret(idTypePret),
    FOREIGN KEY (idTypeAdherant) REFERENCES typeAdherant(idTypeAdherant)
);

CREATE TABLE pret (
    idPret INT AUTO_INCREMENT PRIMARY KEY,
    idExemplaire INT NOT NULL,
    idAdherant INT NOT NULL,
    datePret DATE NOT NULL,
    dateRetourPrevue DATE,     -- Utilisé pour les prêts à domicile
    dateRetourReelle DATE,     -- Quand le livre est rendu
    typePret VARCHAR(20) NOT NULL CHECK (typePret IN ('Domicile', 'SurPlace')),
    heurePret TIME,            -- Utilisé pour les prêts sur place
    heureRetourPrevue TIME,    -- Heure de fin du prêt sur place
    statut VARCHAR(20) DEFAULT 'En cours' CHECK (statut IN ('En cours', 'Rendu')),
    FOREIGN KEY (idExemplaire) REFERENCES exemplaire(idExemplaire),
    FOREIGN KEY (idAdherant) REFERENCES adherant(idAdherant)
);
