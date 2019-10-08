


CREATE TABLE Membre (
  nom VARCHAR(40) NOT NULL,
  prenom VARCHAR(40) NOT NULL,
  noMembre CHAR(6) NOT NULL,
  motDePasse VARCHAR(64) NOT NULL,
  admin BOOLEAN NOT NULL,
  CONSTRAINT Membre_pk0 PRIMARY KEY (noMembre)
);

CREATE TABLE Lot (
  nomLot VARCHAR(40) NOT NULL,
  nbMaxMembre INTEGER NOT NULL,
  CONSTRAINT Lot_pk0 PRIMARY KEY (nomLot)
);

CREATE TABLE MembreLot (
  noMembre CHAR(6) NOT NULL,
  nomLot VARCHAR(40) NOT NULL,
  CONSTRAINT MembreLot_pk0 PRIMARY KEY (noMembre, nomLot),
  CONSTRAINT MembreLot_fk0 FOREIGN KEY (noMembre) REFERENCES Membre,
  CONSTRAINT MembreLot_fk1 FOREIGN KEY (nomLot) REFERENCES Lot
);

CREATE TABLE Plante (
  nomPlante VARCHAR(40) NOT NULL,
  tempsDeCulture INTEGER NOT NULL,
  CONSTRAINT Plante_pk0 PRIMARY KEY (nomPlante)
);

CREATE TABLE Culture (
  nomPlante VARCHAR(40) NOT NULL,
  nomLot VARCHAR(40) NOT NULL,
  noMembre VARCHAR(40) NOT NULL,
  nbExemplaires INTEGER NOT NULL,
  datePlantation DATE NOT NULL,
  CONSTRAINT Culture_pk0 PRIMARY KEY (nomPlante,nomLot,noMembre,datePlantation),
  CONSTRAINT Culture_fk0 FOREIGN KEY (nomPlante) REFERENCES Plante,
  CONSTRAINT Culture_fk1 FOREIGN KEY (nomLot) REFERENCES Lot,
  CONSTRAINT Culture_fk2 FOREIGN KEY (noMembre) REFERENCES Membre
);


