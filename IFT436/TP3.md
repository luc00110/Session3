## TP3, IFT436

### \#1 f)
**Entrees:** Manège **G** tel que  **G** = (**V**,**E**) et sommet initiale **u** tel que **u** appartien à **V**.
**Resultat:** Une sequence **S** de bassins de temps maximal dans le manège.

**Algo:**

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



### \#1 g)
**Entrees:** Manège **G** tel que  **G** = (**V**,**E**) et sommet initiale u tel que u appartien à **V** et le sommet **v** tel que **v** appartiens a **V** et que **v** est le bassin final.
**Resultat:** Une sequence **S** de bassins, de temps maximal dans le manège, considérant que l'utilisateur peut remonter au bassin initial un maximum de 5 fois.

**Algo:**

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

### \#3 a)

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

### \# 3 b)
