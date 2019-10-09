-- R01.
-- inscrireMembre <prenom> <nom> <motDePasse> <noMembre>
-- Cette méthode crée un compte pour un membre.
INSERT INTO Membre(nom, prenom, noMembre, motDePasse, admin) VALUES
  ('Allard','Alain','000000','qwerty','0');

-- R02.
-- supprimerMembre <noMembre>
-- Cette méthode supprime le compte du membre, seulement s’il ne possède aucun lot à lui seul.
DELETE FROM Membre
  WHERE noMembre = '000000';

-- R03.
-- promouvoirAdministrateur <noMembre>
-- Cette méthode promeut un membre au rang d’administrateur.
UPDATE Membre
SET admin = '1'
WHERE noMembre = '000000';

-- R04.
-- ajouterLot <nomLot> <nbMaxMembre>
-- Permet à un administrateur du jardin collectif de créer un nouveau+
INSERT INTO Lot(nomLot, nbMaxMembre) VALUES
  ('Lot1','10');

-- R05.
-- supprimerLot <nomLot>
-- Supprime le lot, ainsi que toutes les assignations de membres.
DELETE FROM Lot
  WHERE nomLot = 'Lot1';
DELETE FROM MembreLot
  WHERE nomLot = 'Lot1';
DELETE FROM DemandeMembreLot
  WHERE nomLot = 'Lot1';

-- R06.
-- rejoindreLot <nomLot> <noMembre>
-- Permet à un membre de demander à rejoindre un lot.

SELECT admin FROM Membre WHERE noMembre = '000001';
--Si vrai alors
INSERT INTO MembreLot (noMembre, nomLot) VALUEs
  ('000001','Lot4');
--Sinon
INSERT INTO DemandeMembreLot (nomLot, noMembre) VALUES
('Lot4','000001');

-- R07.
-- accepterDemande <nomLot> <noMembre>
-- Permet à un administrateur d’accepter la demande d’un membre pour
-- joindre un lot.
INSERT INTO MembreLot (noMembre, nomLot) VALUES
('000001','Lot4');
DELETE FROM DemandeMembreLot
  WHERE nomLot = 'Lot4'
  AND noMembre = '000001';

-- R08.
-- refuserDemande <nomLot> <noMembre>
-- Permet à un administrateur de refuser la demande d’un membre pour
-- joindre un lot.
DELETE FROM DemandeMembreLot
  WHERE nomLot = 'Lot3'
  AND noMembre = '000001';

-- R09.
-- ajouterPlante <nomPlante> <tempsDeCulture>
-- Permet à un administrateur de rendre une plante disponible. Le temps
-- de culture est un nombre de jours.
INSERT INTO Plante(nomPlante, tempsDeCulture) VALUES
  ('TomateCerise','10');

-- R10.
-- retirerPlante <nomPlante>
-- Permet à un administrateur de rendre une plante indisponible, seulement si elle n’est en culture dans aucun lot.
UPDATE Plante
  SET estDisponible = '0'
  WHERE nomPlante = 'CeriseTomate';

-- R11.
-- planterPlante <nomPlante> <nomLot> <noMembre> <nbExemplaires>
-- <datePlantation>
-- Permet à un membre de planter un certain nombre d’exemplaires
-- d’une plante dans un lot qui lui est assigné.

SELECT
  CASE
    WHEN COUNT(Culture.nomPlante)>0 THEN TRUE
    ELSE FALSE
  END AS droitDePlanter
  FROM Culture
  INNER JOIN MembreLot
    ON Culture.nomLot = MembreLot.nomLot
    AND Culture.noMembre = MembreLot.noMembre
  INNER JOIN Plante
    ON Culture.nomPlante = Plante.nomPlante
  WHERE Plante.estDisponible = '1';

--Si vrai alors
INSERT INTO Culture(nomPlante, nomLot, noMembre, nbExemplaires, datePlantation) VALUES
  ('Carotte','Lot2','000001',40,'2019-07-28');

--Sinon
--Message erreur

-- R12.                                                       ****************
-- recolterPlante <nomPlante> <nomLot> <noMembre>
-- Permet à un membre de recolter une plante prête à la récolte dans un
-- lot qui lui est assigné.
UPDATE Culture
  SET estRecoltable = TRUE
  FROM Culture
  INNER JOIN Plante
    ON Culture.nomPlante = Plante.nomPlante
  WHERE (Culture.datePlantation + Plante.tempsDeCulture) >= TODAY();

DELETE FROM Culture
  WHERE nomPlante = 'Carotte'
  AND nomLot = 'Lot1'
  AND estRecoltable = TRUE;

-- R13.
-- afficherMembres
-- Affiche l’ensemble des membres et des administrateurs.
SELECT nom, prenom, noMembre, admin
  FROM Membre;

-- R14.
-- afficherPlantes
-- Affiche l’ensemble des plantes et le nombre de plants de chacune en
-- culture.
SELECT Plante.nomPlante, SUM(CultureTable.nbExemplaires) AS Qty
  FROM Plante
  INNER JOIN
    (SELECT nomPlante, nbexemplaires
        FROM Culture
    ) AS CultureTable
    ON Plante.nomPlante = CultureTable.nomPlante
  WHERE Plante.estDisponible = '1'
  GROUP BY Plante.nomPlante;

-- R15.
-- afficherLots
-- Affiche l’ensemble des lots et des membres qui y sont assignés.
SELECT nomLot, noMembre
  FROM MembreLot
  ORDER BY nomLot;

-- R16.
-- afficherPlantesLot <lot>
-- Affiche l’ensemble des plantes en culture dans un lot, avec la date de
-- plantation et la date de récolte prévue
SELECT Culture.nomPlante, datePlantation, (datePlantation + tempsDeCulture) AS dateRecoltePrevue
  FROM Culture
  INNER JOIN Plante
  ON Culture.nomPlante = Plante.nomPlante
