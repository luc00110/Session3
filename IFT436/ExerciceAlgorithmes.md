**Probleme:**
n Personnes dont une est intrus: 
 - L'intru connait tout le monde
 - Personne ne connait l'intru
 - Ne peux pas avoir 2 intrus, par logique. (car les deux premier ennonce sont mutuellement exclusifs)


(Est un graph, presenter sous matrice d'adjacence)

        A[i,j] = {1 si i connait j, 0 sinon}
Un 1 represente un liens de connaissance (arete)


Comment indentifier l'intrus, en O(n)?

|0,n|1,n|...|n,n|
|-|-|-|-|
|0,n-1|1,n-1|...|n,n-1|
...|...|...|...|
0,0|1,1|...|n,0|

---

Debute a la case [i,j] i=0 et j=n (premiere case en haut a gauche). Si c'est 1, ce n'est pas intru. donc i++. 
Si la case observer a pour valeur 0, descendre, donc faire j--.
Ainsi on se deplace diagonalement.