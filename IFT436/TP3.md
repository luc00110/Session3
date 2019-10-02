## TP3, IFT436

### \#1

#### a)
#### b)
#### c)
#### d)
#### e)

#### f)
**Entrees:** Manège **G** tel que  **G** = (**V**,**E**) et sommet initiale **u** tel que **u** appartien à **V**.
**Resultat:** Une sequence **S** de bassins de temps maximal dans le manège.


    S ← []
    Ttot ← 0
    Parent ← u
    parcours(x):   
        SPrime ← S
        Temps ← Ttot
        si x n'est pas marqué alors
            Temps ← Temps + c[Parent, x]
            marquer x
            ajouter x à SPrime
            si Temps > Ttot alors
                Ttot = Temps
                S ← SPrime
            pour u appartiens a V: x → y
                parcours(y)
                retirer les marqueurs soudjacants
    parcours(u)
    retourner S


<br>

#### g)
**Entrees:** Manège **G** tel que  **G** = (**V**,**E**) et sommet initiale u tel que u appartien à **V** et le sommet **v** tel que **v** appartiens a **V** et que **v** est le bassin final.
**Resultat:** Une sequence **S** de bassins, de temps maximal dans le manège, considérant que l'utilisateur peut remonter au bassin initial un maximum de 5 fois.

    S ← []
    Ascensions ← 5 
    Ttot ← 0
    Parent ← u
    parcours(x):   
        SPrime ← S
        Temps ← Ttot
        si x n'est pas marqué alors
            Temps ← Temps + c[Parent, x]
            marquer x
            ajouter x à SPrime
            si Temps > Ttot alors
                Ttot = Temps
                S ← SPrime
            si x DOIT se rendre à v ET que Ascension != 0 alors
                Ascensions ← Ascension - 1
                retirer les marqueurs
                parcours(S[0]) // neoud
            Sinon 
                pour u appartiens a V: x → y
                    parcours(y)
                    retirer les marqueurs soudjacants
    parcours(u)
    retourner S


Ici, il fera exactement comme l'algorithme précédent, à l'exception que lorsqu'il se rendra au plus long parcours précédent le bassin final, et se 5 fois. La 5<sup>e</sup> fois, le sera possiblement différent mais restera cependant couvers par l'algorithme.


<br>

---

### \# 2
#### a)
**Entrees:** Une séquence **S** non vide d'éléments combarables.
**Resultat:** La/les valeurs modales m trouvées dans la séquence **S**.

    pivot, mode ← [], modeQuant ← 0
    trouverMode(s)
        Si |S| == 0 alors
            retourner mode
        Sinon
            pivot ← mediane(S) /// n'est pas une fonction

            gauche ← [x dans S: x < picot]
            centre ← [x dans S: x = pivot]
            droite ← [s dans S: x > pivot]

            si |centre| == modeValue /// D'ou ca sort
                mode ← S[centre] /// qu'est-ce que ca veut dire, ce n'Est pas du pseudo code.
            si |centre| > modeQty ///  Je vois ce que tu voulais faire mais jamais n'est-il incrémenté.
                modeValue ← |centre|
                mode ← []
                mode S[centre]
        retourner trouverMode(gauche) + milieu + trouverMode(droite)
    retourner trouverMode(???) /// La recursion devrait être applée ici
    



<br>

---

### \#3 
#### a)
**Donnez un algorithme qui détermine si un graphe non dirigé est un arbre.**

<br>

**Matrices d'adjacence:**
<table>
<tr><th>
a&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b<br>&nbsp; 
<img src="https://raw.githubusercontent.com/luc00110/Session3/master/IFT436/Gites_Orange.png">
<br>c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d
</th><th>
a&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b<br>&nbsp;     
<img src="https://raw.githubusercontent.com/luc00110/Session3/master/IFT436/Gites_Rose.png">
<br>c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d
</th></tr>
<tr><td>

||a|b|c|d|
|-|-|-|-|-|
|**a**|0|1|1|1|
|**b**|1|0|0|0|
|**c**|1|0|0|0|
|**d**|1|0|0|0|

</td><td>

||a|b|c|d|
|-|-|-|-|-|
|**a**|0|0|1|0|
|**b**|0|0|1|1|
|**c**|1|1|0|0|
|**d**|0|1|0|0|

</td></tr>
</table>

**Entrées:** Un graph **G** tel que  **G** = (**V**,**E**) qui est non dirigé.
**Résultat:** Si le graph est un arbre ou non.

**Algo:**

    u ← Sommet alléatoir dans V
    Visites ← 0
    visiter(x):
        Si x est marqué alors
            retourner Non_Arbre 
        marquer x
        Visites ← Visites + 1
        Pour chacun des autres voisins immédiats y qui appartiennent a V: x → y
            visiter(y)
    visiter(u)
    Si Visites != |V|
        retourner Non_Arbre
    Sinon
        retourner Est_Arbre

Cet algorithme parcours le graph au complet. Si un sommet est visité plus d'une fois, c'est cyclique. Cela est uniquement véridicte lorsqu'on empêche de visiter le noeud précédents en visitant tous les voisins immédiats.

Deplus, tous les sommets peuvent être visiter moins de deux fois et tout de même il pourrait y manquer certains sommets, d'ou la vérification si le nombre de visites est bien égale a la somme des sommets dans le graphes!
<br>

#### b)

**Démontrez que le graphe complet *G<sub>n</sub>* possède au moins 2<sup>*n*</sup> arbres couvrants, pour tout *n* entier plus grand que 3.**

Une facons compréhensive de le démontrer est de représenter chacun des sommets comme une valeurs binaire. Lors d'un compte binaire (*ie*: l'évaluation de 101<sub>2</sub> qui donne 5) on réalise qu'il y a jusqu'a 8 manières différentes d'agencer 3 valeurs, trois sommets. Maintenant, si nous retrouvons 4 somets, il y a alors 4 valeurs qui peuvent être agencer jusqu'a 16 façons uniques. Ceci, qui suit cette même relation binaire, gradue en fonction du nombre d'objet à relier par le l'arbre couvrant *H* du graphe complet, acyclique et non dirigé *G*.

Ainsi, avec *n* sommets, il y a 2<sup>*n*</sup> manières de les agencer afin de couvrir tout les sommets et d'accomplir la tâche requise! 

#### c)
**Donnez un exemple de points ou un arbre couvrant minimal entre ces points est plus long qu'un arbre couvrant minimal avec un nouveau point ajouté (une halte).**
<table>
<tr><th>
<img src="https://raw.githubusercontent.com/luc00110/Session3/master/IFT436/Gites_Bleu.png">
</th><th>
<img src="https://raw.githubusercontent.com/luc00110/Session3/master/IFT436/Gites_Vert.png">
</th></tr>
<tr><td>

Dans cette image, on retrouve un arbre couvrant minimal qui couvre 4 sommets d'un graph G à 4 sommets. 

Assumant qu'il y a 1 unité de distance entre les coins, du carré formé, adjacants, le graph aurait une longueur de:<br><br> **3 * 1 = 3 unités**

</td><td>

Dans celui-ci, le vert, le 'X' rouge représente un coté à oublié puis le point rouge, une interesection à ajouter. Maintenant, les gites sont équidistant de cette halte et la distance est de <br><br>**4(1/2)(1<sup>2</sup> + 1<sup>2</sup>)<sup>1/2</sup> = 2<sup>1/2</sup> = 2.8284... unités**

</td></tr>
</table>