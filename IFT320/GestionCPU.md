# Chapitre 5
# Gestion du temps de l'Unité Centrale de Traitement
### IFT320 - Système d'exploitation, *Michael Fortin*
### Mardi 29 octobre, 2019

**Notes de cours prises par *Lucien B. Regout.***

---
<br>

### Gestion de l'UCT
 - Le but est d'augmenter l'utilisation et le rendement de l'UCT
 - Rendement → nb travaux / unité de temps.
 - Opérations...

Dépendament des cas, éviter d'être a 100% car s'il y a des surcharges, on est mal pris.


Ex.:

|A|B|A|B|...|
|:-:|:-:|:-:|:-:|:-:|

<ol>
    <li>Temps de changement dans le contexte (transfere entre la tache A et B)
    <li>Unité d'entrées/sorties n'aura pas nécéssairement toujours le même temps d'attente.
</ol>

*cool dessin avec les etats Exe, Bloque, Pret et Fin (puis NON!)*

<br>

##### Bloc Controle Processus (PCB)

 - État
 - ID
 - USer Propriétaire
 - Processus Parent
 - Liste des processus
 - Priorité sur l'UCT
 - nom
 - Statistique comportementales (...)
 - Espace d'adresses
 - Zone de sauvegarde
 - Table des Fichiers Ouverts
 - Rep courant (..?)
 - Unité d'entrées sorties ou ressources associées
 - Affinité avec UCT (Cache)