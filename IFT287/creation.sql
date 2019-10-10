


CREATE TABLE Membre (
  nom VARCHAR(255) NOT NULL,
  prenom VARCHAR(255) NOT NULL,
  noMembre VARCHAR(255) NOT NULL,
  motDePasse VARCHAR(255) NOT NULL,
  admin BOOLEAN NOT NULL DEFAULT FALSE,
  CONSTRAINT Membre_pk0 PRIMARY KEY (noMembre)
);

CREATE TABLE Lot (
  nomLot VARCHAR(255) NOT NULL,
  nbMaxMembre INTEGER NOT NULL,
  CONSTRAINT Lot_pk0 PRIMARY KEY (nomLot)
);

CREATE TABLE LotMembre (
  nomLot VARCHAR(255) NOT NULL,
  noMembre VARCHAR(255) NOT NULL,
  CONSTRAINT LotMembre_pk0 PRIMARY KEY (nomLot, noMembre),
  CONSTRAINT LotMembre_fk0 FOREIGN KEY (nomLot) REFERENCES Lot,
  CONSTRAINT LotMembre_fk1 FOREIGN KEY (noMembre) REFERENCES Membre
);
CREATE TABLE DemandeMembreLot (
  nomLot VARCHAR(255) NOT NULL,
  noMembre VARCHAR(255) NOT NULL,
  CONSTRAINT DemandeMembreLot_pk0 PRIMARY KEY (nomLot, noMembre),
  CONSTRAINT DemandeMembreLot_fk0 FOREIGN KEY (nomLot) REFERENCES Lot,
  CONSTRAINT DemandeMembreLot_fk1 FOREIGN KEY (noMembre) REFERENCES Membre
);

CREATE TABLE Plante (
  nomPlante VARCHAR(255) NOT NULL,
  tempsCulture INTEGER NOT NULL,
  estDisponible BOOLEAN NOT NULL DEFAULT TRUE,
  CONSTRAINT Plante_pk0 PRIMARY KEY (nomPlante)
);

CREATE TABLE Culture (
  nomPlante VARCHAR(255) NOT NULL,
  nomLot VARCHAR(255) NOT NULL,
  noMembre VARCHAR(255) NOT NULL,
  nbExemplaires INTEGER NOT NULL,
  datePlantation DATE NOT NULL,
  estRecoltable BOOLEAN NOT N ULL DEFAULT FALSE,
  CONSTRAINT Culture_pk0 PRIMARY KEY (nomPlante,nomLot,noMembre,datePlantation),
  CONSTRAINT Culture_fk0 FOREIGN KEY (nomPlante) REFERENCES Plante,
  CONSTRAINT Culture_fk1 FOREIGN KEY (nomLot) REFERENCES Lot,
  CONSTRAINT Culture_fk2 FOREIGN KEY (noMembre) REFERENCES Membre
);


