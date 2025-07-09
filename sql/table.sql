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
CREATE TABLE adherant(
    idAderant INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(50),
    contact VARCHAR(15),
    email VARCHAR(100),
    password VARCHAR(100),
    typeAdherant INT,
    FOREIGN KEY typeAdherant REFERENCES typeAdherant(idTypeAdherant)
);