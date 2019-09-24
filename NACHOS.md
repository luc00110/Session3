# HOW TO NACHOS
<br>
#### IFT320, *Michael Fortin*
#### 8h30 @ 10h20, Mardi 24 septembre 2019

**Fonctionnement du TP2, NACHOS, selon les notes de cours prises par *Lucien B. Regout.***

---
<br>

#####READ(int Pos_depart, Byte* DATA, int Size, int deplacement):

1. Utiliser la clé pour retrouver l'entrée de la table des fichiers ouverts.
2. Obtenir l'emplacement physique du fichier dans l'entrée de table des fichiers ouverts.
3.  `[Emplacement physique + deplacement] -> DATA -> Size x`

<br>

##### int OPEN(String Nom_Fichier, Bool is_it_in_write_mode)
1. Lire le répertoire
2. Chercher le nom dans le répertoire
   - Si trouvé
        1. Obtenir l'emplacement physique
        2. Creer une entrée de table de fichier ouverts
        3. Retourner une clé pour retrouver l'entrée

<br>

##### Prog1 
    CHAR DATA[100];
    
    int POS = OPEN("mah_file"; FALSE);

    for (int i = 0; i < 100; i++){
        READ("mah_file", DATA, 1, i);
    }
    
    CLOSE(clé);

<br>

##### Prog2
    CHAR DATA[100];
    for(int i = 0; i < 100; i++){
        WRITE("mah_file", DATA, 1, i);
    }
    
    CLOSE(cle);

<br>

##### Table des fichiers ouverts
|Processus ID |Nom |List car |Empl. Phys. |
|-------------|-------------|-------------|-------------|
| Prog1 | mah_file | `FALSE` | 1233 |
| Prog2 | mah_file | `FALSE` | 1233 |

---
<br>
### Comportement du programme
> Ceci est un exemple de nachos mais un peu plus complexe, sans struct, algo complexe, ni accès croisés... ~~(w/e it means)~~

Les lettres représentes l'ordre des executions pour parvenir à faire le tout optimalement.
<br>
##### Repertoire
|Noms:|R| |mah_file| | Sylvestor | | FHLX | | MTM |
|--|--|--|--|--|--|--|--|--|--|
|Empl.:|0||1233||2152||5639||8000|

<br>

##### Prog1
    int F1 = OPEN(mah_file, FALSE); // A)
        ... //return 0
    int F2 = OPEN(Sylvestor, TRUE); // D)
        ...
    int F3 = OPEN(MTM, FALSE); // H)
        ...
    
    CLOSE(F1); // I)
    CLOSE(F2); // I)
    CLOSE(F3); // I)

<br>

##### Prog2
    int F1 = OPEN(Sylvester, FALSE); // B)
        ... // return 0
    int F2 = OPEN(FHLX, TRUE); // G)
        ...
    int F3 = OPEN(mah_file, TRUE);
        ...
    
    CLOSE(F1); // J)
    CLOSE(F2); // J)
    CLOSE(F3); // J)

<br>

##### Prog3
    int F1 = OPEN(FHLX, FALSE); // C)
        ... // return 0
    int F2 = OPEN(mah_file, FALSE); // E)
        ...
    
    CLOSE(F1); // F)
    CLOSE(F2); // K)

<br>

#### SYSTEM
Est moifier par chaque appel `WRITE()`/`OPEN()`/`CLOSE()`.
Ici, `Use` est un compteur du nombre total d'acces. 
|Pos/ Clé|Use| Empl. Phys.|WRITE?|
|--|--|--|--|
|0|2|1233|`FALSE`|
|1|1|2152|`FALSE`|
|2|1|5637|`TRUE`|
|...|0|?|?|
|...|0|?|?|
|...|0|?|?|
