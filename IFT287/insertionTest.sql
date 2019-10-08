

INSERT INTO Membre(nom, prenom, noMembre, motDePasse, admin) VALUES
  ('Blouin','Benoit','000001','123456789','0'),
  ('Charest','Charles','000002','Charles123','0'),
  ('Drouin','Derick','000003','Password','0');

INSERT INTO Lot(nomLot, nbMaxMembre) VALUES
  ('Lot2','12'),
  ('Lot3','13'),
  ('Lot4','14') ,
  ('Lot5','15');

INSERT INTO MembreLot(noMembre, nomLot) VALUES
  ('000001', 'Lot2'),
  ('000002', 'Lot5'),
  ('000003', 'Lot2');


INSERT INTO Plante(nomPlante, tempsDeCulture) VALUES
  ('Tomate',60),
  ('Carrote',80),
  ('Concombre',40),
  ('Piment',50);

INSERT INTO Culture(nomPlante, nomLot, noMembre, nbExemplaires, datePlantation) VALUES
  ('Tomate','Lot2','000001',40,'2019-07-24'),
  ('Tomate','Lot2','000001',35,'2019-07-25'),
  ('Tomate','Lot3','000002',30,'2019-07-23'),
  ('Carrote','Lot2','000003',25,'2019-07-22'),
  ('Piment','Lot2','000001',20,'2019-07-26'),
  ('Piment','Lot2','000002',15,'2019-07-20');
