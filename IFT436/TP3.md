## TP3, IFT436


---

**Questions:**
 - [ ] [Placement du "For All"](#1-d)
 - [ ] [Marqueurs soudjacants](#1-f)
 - [ ] [Est-ce qu'on peu passer plus d'une fois dans le bassin final?](#1-g)
 - [ ] [Justification](#3-b)


---

### \#1

<!-- 
Mettre des balises avec des ##### fait en sorte que les anchorpoints, les references, utilisent que le nom comme destination.

Pour faire en sorte que le texte et le nom reconnu n'est pas le meme, faire comme suit.
 -->
<h4 name="1-a">a)</h4>

***V*** = Les bassins du manège aquatique (Sommets/Vertice).
***E*** = Les corridors entre les bassins, potentiellement des glissades(Arêtes/Edges).
***G***, manège aquatique, est dirigé, du à l'élevation. Élévation dénoté de l'énoncé suivant: 
>Puisque les bassins sont situés de plus en plus bas le long d'une colline, si on peut atteindre un bassin *j* à partir d'un bassin *i*, alors on ne peut *pas* atteindre le bassin *i* à partir du bassin *j*.

<br>

<h4 name="1-b">b)</h4>

***G*** ne peut pas être un cycle dû contraintes fournis ci-dessous. Grâce à cette première contraites plus bas, il est impossible qu'un cycle soit établi avec un seul bassin considérant qu'il y a aucun corridor qui part d'un dit bassin en arrivant dans ce même bassin. 
Finalement, la seconde contrainte  implique que dû à l'inclinaison, l'un ne peut pas revenir au bassin précédent. Cela implique qu'il y a aucun cycle possible et que de ce fait, le manège aquatique ***G*** est acyclique et dirigé.
>Il n'y a *pas* de corridor passant d'un bassin vers lui-même;

>Puisque les bassins sont situés de plus en plus bas le long d'une colline, si on peut atteindre un bassin *j* à partir d'un bassin *i*, alors on ne peut *pas* atteindre le bassin *i* à partir du bassin *j*.

<br>

<h4 name="1-c">c)</h4>

Si le graphe ***G*** est considéré non dirigé, il y a plusieurs arrangements d'arêtes qui rendrait ***G*** cyclique. Toutefois, il y a toujours la possibilité qu'aucun cycle, simple ou non, ne soit présent et que le nombre d'arête soit équivalent au nombre de sommet - 1. De sorte que les propriétés suivantes soit respectées.

 - ***G*** est *connexe*
 - ***G*** est *Acyclique*
 - |***E***| = |***V***| - 1 
/// N'EST PAS BON, FAUT RAFINER ET CHOISIR QU'UNE VERSION, PAS LES TROIS


<br>

<h4 name="1-d">d)</h4>

![For All](https://raw.githubusercontent.com/luc00110/Session3/master/IFT436/forall.png)

![Min](https://raw.githubusercontent.com/luc00110/Session3/master/IFT436/min.png)

![Max](https://raw.githubusercontent.com/luc00110/Session3/master/IFT436/max.png)


<br>

<h4 name="1-e">e)</h4>

**Bassin départ :** de toutes les paires de sommets composants les arêtes, le sommet qui se retrouvera uniquement en index 0 de la paire, à la gauche, qui est donc toujours le sommet de départ, sera donc considéré comme sommet de départ.

**Bassin d'arrivée :** Suivre le même résonnement, mais pour le sommet qui se retrouve toujours en index 1 de la paire et qui est donc toujours le bassin d'arrivée dans toutes les paires, sera donc considéré comme sommet d'arrivée.

<br>

<h4 name="1-f">f)</h4>

**Entrees:** Manège **G** tel que  **G** = (**V**,**E**) et sommet initiale **u** tel que **u** appartien à **V**. <br>
**Resultat:** Une sequence **S** de bassins de temps maximal dans le manège. <br>


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
                Parent ← x
                parcours(y)
                /// retirer les marqueurs soudjacants
    parcours(u)
    retourner S


<br>

<h4 name="1-g">g)</h4>

**Entrees:** Manège **G** tel que  **G** = (**V**,**E**) et sommet initiale u tel que u appartien à **V** et le sommet **v** tel que **v** appartiens a **V** et que **v** est le bassin final. <br>
**Resultat:** Une sequence **S** de bassins, de temps maximal dans le manège, considérant que l'utilisateur peut remonter au bassin initial un maximum de 5 fois. <br>

    <i>S</i> ← []
    <i>Ascensions</i> ← 5 
    <i>Ttot</i> ← 0
    <i>Parent</i> ← <i>u</i>
    parcours(<i>x</i>):   
        <i>SPrime</i> ← <i>S</i>
        <i>Temps</i> ← <i>Ttot</i>
        <b>Si</b> <i>x</i> non marqué <b>alors</b>
            <i>Temps</i> ← <i>Temps</i> + c[<i>Parent</i>, <i>x</i>]
            <b>marquer</b> <i>x</i>
            <b>Ajouter</b> <i>x</i> à <i>SPrime</i>
            <b>Si</b> <i>Temps</i> > <i>Ttot</i> <b>alors</b>
                <i>Ttot</i> = <i>Temps</i>
                <i>S</i> ← <i>SPrime</i>
            <b>Si</b> <i>x</i> DOIT se rendre à <i>v</i> ET que <i>Ascension</i> != 0 <b>alors</b>
                <i>Ascensions</i> ← <i>Ascensions</i> - 1
                <b>retirer</b> marqueurs // Reverifier...
                <i>Parent</i> ← <i>S</i>[0]
                parcours(<i>S</i>[0]) // neoud
            <b>Sinon</b> 
                <b>Pour</b> <i>u</i> ∈ <i>V</i>: <i>x</i> → <i>y</i>
                    <i>Parent</i> ← <i>x</i>
                    parcours(<i>y</i>)
    parcours(<i>u</i>)
    <b>Retourner</b> <i>S</i>


Ici, il fera exactement comme l'algorithme précédent, à l'exception que lorsqu'il se rendra au plus long parcours précédent le bassin final, et se 5 fois. La 5<sup>e</sup> fois, le sera possiblement différent mais restera cependant couvers par l'algorithme.


<br>

---

### \# 2

<h4 name="2-a">a)</h4>

**Entrees:** Une séquence **S** non vide d'éléments comparables. <br>
**Resultat:** La/les valeurs modales m trouvées dans la séquence **S**. <br>

<pre><code>
    mode ← [], modeQty ← 0
    trouverMode(x)
        <b>Si</b> |x| = 0 **alors</b> retourner mode
        **Sinon</b>
            pivot ← mediane(x)

            gauche ← [x ∈ S: x < picot]
            centre ← [x ∈ S: x = pivot]
            droite ← [x ∈ S: x > pivot]

            <b>Si</b> |centre| = modeQty <b>lors</b>
                <b>Ajouter</b> pivot à mode
            <b>Si</b> |centre| > modeQty <b>alors</b>
                modeQty ← |centre|
                mode ← pivot
                /// Juste la ligne 'mode ← pivot' fait exactement ca, ca le réassigne
            <b>Sinon</b>
                trouverMode(gauche)
                trouverMode(droite)
    retourner trouverMode(S)
</code></pre>
    
<br>

<h4 name="2-b">b)</h4>

/// On fera le b) quand le a) sera fixed...

<br>

---

### \#3

<h4 name="3-a">a)</h4>

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

**Entrées:** Un graph **G** tel que  **G** = (**V**,**E**) qui est non dirigé. <br>
**Résultat:** Si le graph est un arbre ou non. <br>

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

<h4 name="3-b">b)</h4>

**Démontrez que le graphe complet *G<sub>n</sub>* possède au moins 2<sup>*n*</sup> arbres couvrants, pour tout *n* entier plus grand que 3.**

Une facons compréhensive de le démontrer est de représenter chacun des sommets comme une valeurs binaire. Lors d'un compte binaire (*ie*: l'évaluation de 101<sub>2</sub> qui donne 5) on réalise qu'il y a jusqu'a 8 manières différentes d'agencer 3 valeurs, trois sommets. Maintenant, si nous retrouvons 4 somets, il y a alors 4 valeurs qui peuvent être agencer jusqu'a 16 façons uniques. Ceci, qui suit cette même relation binaire, gradue en fonction du nombre d'objet à relier par le l'arbre couvrant *H* du graphe complet, acyclique et non dirigé *G*.

Ainsi, avec *n* sommets, il y a 2<sup>*n*</sup> manières de les agencer afin de couvrir tout les sommets et d'accomplir la tâche requise! 

<br>

<h4 name="3-c">c)</h4>

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