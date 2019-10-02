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
