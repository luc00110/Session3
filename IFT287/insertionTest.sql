INSERT INTO Membre(nom, prenom, noMembre, motDePasse) VALUES
  ('Blouin','Benoit','000001','123456789'),
  ('Charest','Charles','000002','Charles123'),
  ('Drouin','Derick','000003','Password');

INSERT INTO Lot(nomLot, nbMaxMembre) VALUES
  ('Lot2','12'),
  ('Lot3','13'),
  ('Lot4','14'),
  ('Lot1','15');

INSERT INTO LotMembre(nomLot, noMembre) VALUES
  ('Lot1', '000001'),
  ('Lot2', '000002'),
  ('Lot3', '000003');

INSERT INTO DemandeMembreLot(nomLot, noMembre) VALUES
  ('Lot3', '000001'),
  ('Lot2', '000001'),
  ('Lot2', '000003');

INSERT INTO Plante(nomPlante, tempsCulture) VALUES
  ('Tomate',60),
  ('Carotte',80),
  ('Concombre',40),
  ('Piment',50);

INSERT INTO Culture(nomPlante, nomLot, noMembre, nbExemplaires, datePlantation) VALUES
  ('Tomate','Lot2','000001',40,'2019-07-24'),
  ('Tomate','Lot2','000001',35,'2019-07-25'),
  ('Tomate','Lot3','000002',30,'2019-07-23'),
  ('Carotte','Lot2','000003',25,'2019-07-22'),
  ('Piment','Lot2','000001',20,'2019-07-26'),
  ('Piment','Lot2','000002',15,'2019-07-20');