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
    Foreign Key (idLivre) REFERENCES livre(idLivre)
);

