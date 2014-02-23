/*
===============================================================================
===============================================================================
 Tests
===============================================================================
*/

/*
Q2.1

fromcity(lyon, R).

R = piece(p1, tole, lyon)
Yes (0.00s cpu, solution 1, maybe more) ? ;

R = piece(p2, jante, lyon)
Yes (0.00s cpu, solution 2)
*/

/*
Q2.2
infospieces(N, L).

N = tole
L = lyon
Yes (0.00s cpu, solution 1, maybe more) ? ;

N = jante
L = lyon
Yes (0.00s cpu, solution 2, maybe more) ? ;

N = jante
L = marseille
Yes (0.00s cpu, solution 3, maybe more) ? ;

N = pneu
L = clermontFerrand
Yes (0.00s cpu, solution 4, maybe more) ?
...
*/

/*
Q2.3
inter(N, L).

N = dupont
L = lyon
Yes (0.00s cpu, solution 1, maybe more) ? ;

N = michel
L = clermontFerrand
Yes (0.00s cpu, solution 2, maybe more) ? ;

N = durand
L = lille
Yes (0.00s cpu, solution 3, maybe more) ? ;

N = martin
L = rennes
Yes (0.00s cpu, solution 4, maybe more) ? ;

N = smith
L = paris
Yes (0.00s cpu, solution 5, maybe more) ? ;

N = brown
L = marseille
Yes (0.00s cpu, solution 6)



union(N, L).

N = dupont
L = lyon
Yes (0.00s cpu, solution 1, maybe more) ? ;

N = michel
L = clermontFerrand
Yes (0.00s cpu, solution 2, maybe more) ? ;

N = durand
L = lille
Yes (0.00s cpu, solution 3, maybe more) ? ;

N = dupond
L = lille
Yes (0.00s cpu, solution 4, maybe more) ? ;

N = martin
L = rennes
Yes (0.00s cpu, solution 5, maybe more) ? ;

N = smith
L = paris
Yes (0.00s cpu, solution 6, maybe more) ? ;

N = brown
L = marseille
Yes (0.00s cpu, solution 7, maybe more) ? ;

No (0.00s cpu)


diff(N, L).

N = dupond
L = lille
Yes (0.00s cpu, solution 1, maybe more) ? ;

No (0.00s cpu)
*/

/*
Q2.4

prodcart(R).

R = uplet(f1, dupont, lyon, f1, p1, 300)
Yes (0.00s cpu, solution 1, maybe more) ? ;

R = uplet(f1, dupont, lyon, f2, p2, 200)
Yes (0.01s cpu, solution 2, maybe more) ? ;

R = uplet(f1, dupont, lyon, f3, p3, 200)
Yes (0.01s cpu, solution 3, maybe more) ? ;

R = uplet(f1, dupont, lyon, f4, p4, 400)
Yes (0.01s cpu, solution 4, maybe more) ? ;

R = uplet(f1, dupont, lyon, f6, p5, 500)
Yes (0.01s cpu, solution 5, maybe more) ? ;

R = uplet(f1, dupont, lyon, f6, p6, 1000)
Yes (0.01s cpu, solution 6, maybe more) ? ;

R = uplet(f1, dupont, lyon, f6, p7, 300)
Yes (0.01s cpu, solution 7, maybe more) ? ;
... (60 solutions)

*/

/*
Q2.5
jointure(R).

R = uplet(f1, dupont, lyon, p1, 300)
Yes (0.00s cpu, solution 1, maybe more) ? ;

R = uplet(f1, dupont, lyon, p2, 300)
Yes (0.00s cpu, solution 2, maybe more) ? ;

R = uplet(f2, durand, lille, p2, 200)
Yes (0.00s cpu, solution 3, maybe more) ? ;

R = uplet(f3, martin, rennes, p3, 200)
Yes (0.01s cpu, solution 4, maybe more) ? ;

R = uplet(f4, michel, clermontFerrand, p4, 400)
Yes (0.01s cpu, solution 5, maybe more) ? ;

R = uplet(f4, michel, clermontFerrand, p2, 300)
Yes (0.01s cpu, solution 6, maybe more) ? ;

R = uplet(f4, michel, clermontFerrand, p1, 300)
Yes (0.01s cpu, solution 7, maybe more) ? ;

R = uplet(f6, brown, marseille, p5, 500)
Yes (0.01s cpu, solution 8, maybe more) ? ;

R = uplet(f6, brown, marseille, p6, 1000)
Yes (0.01s cpu, solution 9, maybe more) ? ;

R = uplet(f6, brown, marseille, p7, 300)
Yes (0.01s cpu, solution 10)



jointureSelect(R).

R = uplet(f4, michel, clermontFerrand, p4, 400)
Yes (0.00s cpu, solution 1, maybe more) ? ;

R = uplet(f6, brown, marseille, p5, 500)
Yes (0.00s cpu, solution 2, maybe more) ? ;

R = uplet(f6, brown, marseille, p6, 1000)
Yes (0.00s cpu, solution 3, maybe more) ? ;

No (0.00s cpu)
*/

/*
Q2.6
div(F).

F = f1
Yes (0.00s cpu, solution 1, maybe more) ? ;

F = f4
Yes (0.00s cpu, solution 2, maybe more) ? ;

No (0.00s cpu)
*/

/*
Q2.7
totalPieces(R).

R = uplet(f1, 600)
Yes (0.00s cpu, solution 1, maybe more) ? ;

R = uplet(f2, 200)
Yes (0.00s cpu, solution 2, maybe more) ? ;

R = uplet(f3, 200)
Yes (0.00s cpu, solution 3, maybe more) ? ;

R = uplet(f4, 1000)
Yes (0.00s cpu, solution 4, maybe more) ? ;

R = uplet(f5, 0)
Yes (0.00s cpu, solution 5, maybe more) ? ;

R = uplet(f6, 1800)
Yes (0.00s cpu, solution 6)
*/

/*
Q3.1
composant(voiture, R).

R = porte
Yes (0.00s cpu, solution 1, maybe more) ? ;

R = roue
Yes (0.00s cpu, solution 2, maybe more) ? ;

R = moteur
Yes (0.00s cpu, solution 3, maybe more) ? ;

R = tole
Yes (0.00s cpu, solution 4, maybe more) ? ;

R = vitre
Yes (0.00s cpu, solution 5, maybe more) ? ;

R = jante
Yes (0.00s cpu, solution 6, maybe more) ? ;

R = pneu
Yes (0.00s cpu, solution 7, maybe more) ? ;

R = piston
Yes (0.00s cpu, solution 8, maybe more) ? ;

R = soupape
Yes (0.00s cpu, solution 9, maybe more) ? ;

No (0.00s cpu)
*/

/*
Q3.2
piecesTotal(voiture, R).

R = composant(tole, 4)
Yes (0.00s cpu, solution 1, maybe more) ? ;

R = composant(vitre, 4)
Yes (0.00s cpu, solution 2, maybe more) ? ;

R = composant(jante, 4)
Yes (0.00s cpu, solution 3, maybe more) ? ;

R = composant(pneu, 4)
Yes (0.00s cpu, solution 4, maybe more) ? ;

R = composant(piston, 4)
Yes (0.00s cpu, solution 5, maybe more) ? ;

R = composant(soupape, 16)
Yes (0.00s cpu, solution 6, maybe more) ? ;

No (0.00s cpu)
*/

/*
Q3.3
nbVoit(NB).

NB = 62.0
Yes (0.00s cpu)
*/