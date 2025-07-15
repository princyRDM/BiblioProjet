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

INSERT INTO jourFerier (date, description) VALUES 
('2025-01-01', 'Jour de l An'),
('2025-03-08', 'Journee internationale de la Femme'),
('2025-03-29', 'Commemoration des Martyrs de 1947'),
('2025-04-20', 'Paques'),
('2025-04-21', 'Lundi de Paques'),
('2025-05-01', 'Fete du Travail'),
('2025-05-29', 'Ascension'),
('2025-06-08', 'Pentecote'),
('2025-06-09', 'Lundi de Pentecote'),
('2025-06-26', 'Fete de l Independance'),
('2025-08-15', 'Assomption'),
('2025-11-01', 'Toussaint'),
('2025-12-25', 'Noel');

INSERT INTO typeLivre (libelle) VALUES
('Roman'),
('Nouvelle'),
('Essai'),
('Biographie'),
('Livre documentaire'),
('Poesie'),
('Theâtre'),
('Bande dessinee'),
('Manga'),
('Livre jeunesse'),
('Livre scolaire'),
('Livre religieux'),
('Science-fiction'),
('Fantasy'),
('Roman historique'),
('Roman policier'),
('Roman sentimental');

INSERT INTO livre (titre, auteur, anneePublication, idTypeLivre, langue, accessibilite) VALUES
('1984', 'George Orwell', '1949-06-08', 13, 'Anglais', 1),
('L\'etranger', 'Albert Camus', '1942-05-01', 1, 'Français', 1),
('Madame Bovary', 'Gustave Flaubert', '1857-12-01', 1, 'Français', 2),
('Les Miserables', 'Victor Hugo', '1862-01-01', 1, 'Français', 2),
('Le Petit Prince', 'Antoine de Saint-Exupery', '1943-04-06', 10, 'Français', 2),
('Orgueil et Prejuges', 'Jane Austen', '1813-01-28', 16, 'Anglais', 2),
('Crime et Châtiment', 'Fiodor Dostoïevski', '1866-01-01', 16, 'Russe', 2),
('Cent ans de solitude', 'Gabriel García Márquez', '1967-05-30', 1, 'Espagnol', 2),
('Le Vieil Homme et la Mer', 'Ernest Hemingway', '1952-09-01', 1, 'Anglais', 2),
('Les Hauts de Hurlevent', 'Emily Brontë', '1847-12-01', 1, 'Anglais', 2),
('Don Quichotte', 'Miguel de Cervantes', '1605-01-16', 1, 'Espagnol', 2),
('Moby Dick', 'Herman Melville', '1851-10-18', 1, 'Anglais', 2),
('Anna Karenine', 'Leon Tolstoï', '1877-01-01', 1, 'Russe', 2),
('a la recherche du temps perdu', 'Marcel Proust', '1913-11-01', 1, 'Français', 2),
('Le Proces', 'Franz Kafka', '1925-04-26', 1, 'Allemand', 2),
('Hamlet', 'William Shakespeare', '1603-01-01', 7, 'Anglais', 2),
('La Divine Comedie', 'Dante Alighieri', '1320-01-01', 6, 'Italien', 2),
('Le Rouge et le Noir', 'Stendhal', '1830-01-01', 15, 'Français', 2),
('Beloved', 'Toni Morrison', '1987-09-02', 1, 'Anglais', 2),
('Mrs Dalloway', 'Virginia Woolf', '1925-05-14', 1, 'Anglais', 2);
-- Ajout de 2 exemplaires par livre
INSERT INTO exemplaire (idLivre, numExemplaire, etat) VALUES
(1, 'EX001-1', 'Neuf'), (1, 'EX001-2', 'Bon'),
(2, 'EX002-1', 'Neuf'), (2, 'EX002-2', 'Bon'),
(3, 'EX003-1', 'Bon'),  (3, 'EX003-2', 'Bon'),
(4, 'EX004-1', 'Bon'),  (4, 'EX004-2', 'Bon'),
(5, 'EX005-1', 'Neuf'), (5, 'EX005-2', 'Bon'),
(6, 'EX006-1', 'Bon'),  (6, 'EX006-2', 'Bon'),
(7, 'EX007-1', 'Bon'),  (7, 'EX007-2', 'Bon'),
(8, 'EX008-1', 'Bon'),  (8, 'EX008-2', 'Bon'),
(9, 'EX009-1', 'Bon'),  (9, 'EX009-2', 'Bon'),
(10, 'EX010-1', 'Bon'), (10, 'EX010-2', 'Bon'),
(11, 'EX011-1', 'Bon'), (11, 'EX011-2', 'Bon'),
(12, 'EX012-1', 'Bon'), (12, 'EX012-2', 'Bon'),
(13, 'EX013-1', 'Bon'), (13, 'EX013-2', 'Bon'),
(14, 'EX014-1', 'Bon'), (14, 'EX014-2', 'Bon'),
(15, 'EX015-1', 'Bon'), (15, 'EX015-2', 'Bon'),
(16, 'EX016-1', 'Bon'), (16, 'EX016-2', 'Bon'),
(17, 'EX017-1', 'Bon'), (17, 'EX017-2', 'Bon'),
(18, 'EX018-1', 'Bon'), (18, 'EX018-2', 'Bon'),
(19, 'EX019-1', 'Bon'), (19, 'EX019-2', 'Bon'),
(20, 'EX020-1', 'Bon'), (20, 'EX020-2', 'Bon');

-----
INSERT INTO typePret (libelle) VALUES 
('Domicile'), 
('SurPlace');

INSERT INTO quotaPret (idTypePret, idTypeAdherant, quota, delaiPret) VALUES
(1, 1, 3, 5),   -- etudiant, pret a domicile : max 3 livres, 4 jours
(1, 2, 7, 7),   -- Professeur, pret a domicile : max 5 livres, 7 jours
(1, 3, 4, 5),  
(1, 4, 0, 0),     -- Anonyme, pret a domicile : interdit

(2, 1, 10, NULL), -- etudiant, sur place : pas de limite
(2, 2, 10, NULL), -- Professeur, sur place : pas de limit(1, 3, 2, 5),     
(2, 3, 10, NULL), -- Professionnel, pret sur place : illimite
(2, 4, 10, NULL); -- Anonyme, pret sur place : autorise sans limite

SELECT COUNT(*) AS nb_prets_en_cours
FROM pret
WHERE idAdherant = 1
  AND statut = 'En cours';
