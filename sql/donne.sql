USE projetbiblio;

INSERT INTO typeAdherant (libelle) VALUES
('Etudiant'),
('Professeur'),
('Professionnel'),
('Anonyme');
INSERT INTO bibliothecaire (nom, prenom, email, password) VALUES
('Rakoto', 'Nomena', 'biblio@gmail.com', 'admin');
INSERT INTO adherant (nom, prenom, contact, email, password, idTypeAdherant) VALUES
('RANDRIA', 'Hasina', '0326107953', 'hasina@gmail.com','hasina',1);

desc adherant;