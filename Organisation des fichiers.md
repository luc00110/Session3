# Organisation des fichiers
### IFT320 - Système d'exploitation, *Michael Fortin*
### Mardi 1<sup>er</sup> octobre 2019

**Notes de cours prises par *Lucien B. Regout.* À completer.**

---
<br>

### Tableau résumé
|Type|Représentation emplacement physyque| Nombre d'accès direct|Fragmentation|Gestion espace libre|Changement de taille|Notes|
|:-|:-|:-|:-|:-|:-|:-|
|Contigu|Pos. début<br>Taille <br> O(1)|Début + Déplacement O(1)|Externe|Liste des espaces libres [pos, taille] triée par grandeur|Si pas d'espace libre contigu: Recopie du fichier O(N) au pire Squeeze O(Taille disque)|Voir [Fragmentation](#Fragmentation)|


---
### Arbres cycliques et acycliques. (À completer)
<br>

#### Un répertoire typique
**F** = Fichier, **R** = Répertoire, **S** = lien Symbolique

|Nom|Empl. Phys.|Type (F/R/S)|
|:-:|:-:|:-:|
|R1|F7|F|
||||
|...|...|...|

<br>

#### Liens symboliques
 - Il est possible d'empêcher les cycles en bloquant les liens physiques sur les répertoires.
 - Une **table de montage** est un petit fichier, chargé au démarage qui sert à déterminer les partition d'un même disque dur.
 - C'est non optimale pour établire des liens physiques avec des disques amovibles (tels clefs USB) ou disques réseaux, car ceux-ci peuvent être déconnecté en tout temps.

---

### Exemple d'un répertoire

##### Magnetic Tape File System ( *MTFS* )

|Répertoire: ||F1|Libre|F3|F4|Libre|F5|Libre|F6|F7|Libre|
|:-|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|Emplacement: |0|1024|5020|6044|14206|14334|14846|16894|19966|20666|22714|
|Taille: |1ko|4ko|1ko|8ko|128o|512o|2ko|3ko|700o|8ko|182o|

<br>

##### Fichiers sur un répertoire donné 
|Nom|Empl. Phys.|Taille|
|:-:|:-:|:-:|
|F1|1024|4ko|
|Libre|5020|1ko|
|F3|6044|8ko|
|F4|14206|128o|
|Libre|14334|512o|
|F5|14846|2ko|
|Libre|16894|3ko|
|F6|19966|700o|
|F7|20666|8ko|
|Libre|22714|182o|

<br>

##### Liste d'espace libre
|Début|Taille|
|:-:|:-:|
|5020|1k|
|14334|512o|
|16894|3k|
|22714|1862o|
|||

<br>

##### Remarque
 - Il est super complexe d'agrandir la taille d'un fichier dans se système.

<br>

---
### Algorithmes de gestions des espaces libres
<br>

#### BEST-FIT
> Connait la taille du répertoire et la taille est **statique**. Ceci maximise mes courbes ;)
> 
#### WORST-FIT
> Taille appeller à **augmenter**. Comme choisir du linge pour de jeunes enfants. Pour que ca dure le plus longtemps.
> 
#### FIRST-FIT
> Pas d'information sur les changements de tailes. Ce veut être très **rapide**.

<br>

#### Fragmentation
 - Externe
   - Ralentir
     - Algo First-Fit, Best-Fit, Worst-Fit
   - Eliminer
     - Squeeze
 - Interne
   - Ralentir
     - (À completer)
   - Eliminer
     - (À completer)
