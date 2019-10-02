# Organisation des fichiers
### IFT320 - Système d'exploitation, *Michael Fortin*
### Mardi 1<sup>er</sup> et mercredi 2<sup>e</sup> d'octobre, 2019

**Notes de cours prises par *Lucien B. Regout.***

---
<br>

### Tableau résumé
|Type|Représentation emplacement physyque| Nombre d'accès direct|Fragmentation|[Gestion espace libre](#Algorithmes-de-gestion-d'espaces-libres)|Changement de taille|Protection de dommanges|
|:-|:-|:-|:-|:-|:-|:-|:-|
|[Contigu](#Contigu)|Pos. début<br>Taille <br> **O(1)**|Début + Déplacement **O(1)**|[Externe](#Externe)|Liste espaces libres [Position,Taille] triée par grandeur|<ul><li>**O(1)** Si espace libre contigu<li>**O(n)** Si un trou libre assez grand existe<li>**O(Taille Disque)** Si fragment</ul>|Copies de sûretées|
|[Liste chainée](#Liste-chainée)|<ul><li>Numéro bloc départ <li> Taille (n) <li> Un numéro bloc suivant par bloc (n/taille bloc) <li> position dernier bloc <li> **O(n)**</ul>| <ul><li>Nb de blocs <li>**O(n/2)** <li>Si fin fichier, **O(1)**</ul>|[Interne](#Interne)|<ol><li>Liste chaînée<li>Liste chaînée d'index<li>Bitmap</ol>|**O(1)** Ajuster un bloc a la fin de la chaîne|<ul><li>Chainage vulnerable<ul><li>Chainage double </ul></ul>|
|[Index](#Index)|||||||

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

### Contigu

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

<br>

##### Remarque
 - Il est super complexe d'agrandir la taille d'un fichier dans se système.

Retour au [Tableau résumé](#Tableau-Résumé)
<br>

---
### Algorithmes de gestion d'espaces libres
<br>

##### Best-Fit
> Connait la taille du répertoire et la taille est **statique**. Ceci maximise mes courbes. <br>- Louis 2019.
> 
##### Worst-Fit
> Taille appeller à **augmenter**. Comme choisir du linge pour de jeunes enfants. Pour que ca dure le plus longtemps.
> 
##### Firs-Fit
> Pas d'information sur les changements de tailes. Ce veut être très **rapide**.

<br>

#### Fragmentation
 - ###### Externe
   - Retarder
     - Algo First-Fit, Best-Fit, Worst-Fit
   - Eliminer
     - Squeeze : Consolider l'espace libre. 
 - ###### Interne
   - Retarder
     - 2 différentes tialles de bloc et on alloue les petits blocs aux petits fichiers.
   - Eliminer
     - Tail-packing (difficile)
     - Stocker des données (compactes) dasn l'en-tête ou, pire encore, dans l'entré de répertoire.

Retour au [Tableau résumé](#Tableau-Résumé)

##### Fragmentation Externe
>Assez de capacité pour l'utilisation. Cependant, il est séparé en petits morceaux.

##### Fragmentation Interne
>Taille Disque = 2<sup>40</sup>
>Taille Bloc = 8ko = 2<sup>13</sup>
>Si, en moyenne, la taille d'un fichier est de 1ko, et qu'on en réserve 75ko, on perds énormément d'espace.


##### Système à 2 tailles de blocs
>Minimise la perte d'espace dû a la fragmentation interne.
>Plus simple d'implémenter 2, voir 3, tailles de blocs pour minimiser la perte d'espace avec la fragmentation interne. Plus simple que la technique Tail-Packing.

Si la taille est moins d'un petit bloc, assigne un petit bloc.
Si la taille est plus grande qu'un petit bloc, assigner un gros bloc.


### Liste chaînée
|7|⇄|11|⇄|13|⇄|3|⇄|14|⇄|25|⇄|12|⇄|20|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|


    TB == Taille de bloc
    TI == Taille Index
    N == Nombre de blocs
    TF == Taille Fichier

    N = N/TB
    TI = 4
    N/TI = Bloc d'Index

    Complexité = O((N/TB)/TI)

Exemple, avec un fichier de 1Go, puis des blocs de 1ko:

    TF = 2^30
    N = 2^10
    TI = 2^8

    (2^30)/(2^12) = 2^18
    -> 2^18 / 2^10 = 2^8

Retour au [Tableau résumé](#Tableau-Résumé)