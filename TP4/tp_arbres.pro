/**
 * TP Arbres Prolog
 * @author Paul CHAIGNON
 * @author Clement GAUTRAIS
 * @version Annee scolaire 2013/2014
 */

arbre_binaire(arb_bin(R, G, D)):-
	integer(R),
	arbre_binaire(G),
	arbre_binaire(D).

arbre_binaire(arb_bin(R, vide, D)):-
	integer(R),
	arbre_binaire(D).

arbre_binaire(arb_bin(R, G, vide)):-
	integer(R),
	arbre_binaire(G).

arbre_binaire(arb_bin(R, vide, vide)):-
	integer(R).

% arbre_binaire(arb_bin(1, arb_bin(2,arb_bin(6, vide, vide), vide), arb_bin(3, arb_bin(4, vide, vide),arb_bin(5,vide, vide)))).

dans_arbre_binaire(E, arb_bin(E, G, D)).

dans_arbre_binaire(E, arb_bin(R, G, D)):-
	R \== E,
	dans_arbre_binaire(E, G);
	dans_arbre_binaire(E, D).

% dans_arbre_binaire(1, arb_bin(1, arb_bin(2,arb_bin(6, vide, vide), vide), arb_bin(3, arb_bin(4, vide, vide),arb_bin(5,vide, vide)))).
% dans_arbre_binaire(7, arb_bin(1, arb_bin(2,arb_bin(6, vide, vide), vide), arb_bin(3, arb_bin(4, vide, vide),arb_bin(5,vide, vide)))).

sous_arbre_binaire(S, S).
sous_arbre_binaire(S, arb_bin(E, G, D)):-
	S \== E,
	sous_arbre_binaire(S, G);
	sous_arbre_binaire(S, D).

% sous_arbre_binaire(arb_bin(3, arb_bin(4, vide, vide),arb_bin(5,vide, vide)), arb_bin(1, arb_bin(2,arb_bin(6, vide, vide), vide), arb_bin(3, arb_bin(4, vide, vide),arb_bin(5,vide, vide)))).
% sous_arbre_binaire(arb_bin(2, arb_bin(4, vide, vide),arb_bin(5,vide, vide)), arb_bin(1, arb_bin(2,arb_bin(6, vide, vide), vide), arb_bin(3, arb_bin(4, vide, vide),arb_bin(5,vide, vide)))).

remplacer(SA1, SA2, SA1, SA2).
remplacer(SA1, SA2, vide, vide).

remplacer(SA1, SA2, arb_bin(R, G, D), arb_bin(R, G2, D2)):-
	remplacer(SA1, SA2, G, G2),
	remplacer(SA1, SA2, D, D2).

% remplacer(arb_bin(3, arb_bin(4, vide, vide),arb_bin(5,vide, vide)), arb_bin(7, vide, vide), arb_bin(1, arb_bin(2,arb_bin(6, vide, vide), vide), arb_bin(3, arb_bin(4, vide, vide),arb_bin(5,vide, vide))), A).
% remplacer(arb_bin(7, arb_bin(4, vide, vide),arb_bin(5,vide, vide)), arb_bin(7, vide, vide), arb_bin(1, arb_bin(2,arb_bin(6, vide, vide), vide), arb_bin(3, arb_bin(4, vide, vide),arb_bin(5,vide, vide))), A).

isomorphes(A,A).
isomorphes(arb_bin(R, G1, D1), arb_bin(R, G2, D2)):-
	arb_bin(R, G1, D1) \== arb_bin(R, G2, D2),
	isomorphes(G1, D2),
	isomorphes(D1, G2).

isomorphes(arb_bin(R, G1, D1), arb_bin(R, G2, D2)):-
	arb_bin(R, G1, D1) \== arb_bin(R, G2, D2),
	isomorphes(G1, G2),
	isomorphes(D1, D2).

% isomorphes(arb_bin(3, arb_bin(4, vide, vide), arb_bin(5, arb_bin(6, vide, vide), arb_bin(7, vide, vide))), arb_bin(3, arb_bin(5, arb_bin(6, vide, vide), arb_bin(7, vide, vide)), arb_bin(4, vide, vide))).
% isomorphes(arb_bin(3, arb_bin(4, vide, vide), arb_bin(5, arb_bin(6, vide, vide), arb_bin(7, vide, vide))), arb_bin(3, arb_bin(5, arb_bin(7, vide, vide), arb_bin(6, vide, vide)), arb_bin(4, vide, vide))).
% isomorphes(arb_bin(3, arb_bin(4, vide, vide), arb_bin(5, arb_bin(6, vide, vide), arb_bin(7, vide, vide))), arb_bin(3, arb_bin(5, arb_bin(4, vide, vide), arb_bin(7, vide, vide)), arb_bin(4, vide, vide))).

/**
 * concat(+X, +Y, ?T)
 */
concat([], Y, Y).
concat([P|R], Y, [P|T]):-
	concat(R, Y, T).

infixe(vide, []).
infixe(arb_bin(R, G, D), L):-
	infixe(G, L1),
	infixe(D, L2),
	concat(L1, [R|L2], L).

% infixe(arb_bin(1, arb_bin(2,arb_bin(6, vide, vide), vide), arb_bin(3, arb_bin(4, vide, vide), arb_bin(5, vide, vide))), L).

compter_etiq(vide, 0).
compter_etiq(arb_bin(R, G, D), N):-
	compter_etiq(G, N1),
	compter_etiq(D, N2),
	N is N1 + N2 + 1.


nb_etiq_sup(E, vide, 0).
nb_etiq_sup(E, arb_bin(R, G, D), N):-
	E == R,
	compter_etiq(D, N).

nb_etiq_sup(E, arb_bin(R, G, D), N):-
	E > R,
	nb_etiq_sup(E, D, N).

nb_etiq_sup(E, arb_bin(R, G, D), N):-
	E < R,
	nb_etiq_sup(E, G, N2),
	compter_etiq(D, N1),
	N is N1 + N2 + 1.

% nb_etiq_sup(11, arb_bin(8, arb_bin(4, arb_bin(2, vide, vide), arb_bin(6, vide, vide)), arb_bin(12, arb_bin(10, vide, vide), vide)), N).

insertion_arbre_ordonne(E, vide, arb_bin(E, vide, vide)).
insertion_arbre_ordonne(E, arb_bin(E, G, D), arb_bin(E, G, D)).
insertion_arbre_ordonne(E, arb_bin(R, G, D), arb_bin(R, G2, D)):-
	E < R,
	insertion_arbre_ordonne(E, G, G2).
insertion_arbre_ordonne(E, arb_bin(R, G, D), arb_bin(R, G, D2)):-
	E > R,
	insertion_arbre_ordonne(E, D, D2).

% insertion_arbre_ordonne(7, arb_bin(8, arb_bin(4, arb_bin(2, vide, vide), arb_bin(6, vide, vide)), arb_bin(12, arb_bin(10, vide, vide), vide)), B2).

insertion_arbre_ordonne1(E, X):-
	free(X),
	X = arb_bin(E, _, _).
insertion_arbre_ordonne1(E, arb_bin(E, G, D)).
insertion_arbre_ordonne1(E, arb_bin(R, G, D)):-
	E < R,
	insertion_arbre_ordonne1(E, G).
insertion_arbre_ordonne1(E, arb_bin(R, G, D)):-
	E > R,
	insertion_arbre_ordonne1(E, D).

% insertion_arbre_ordonne1(7, arb_bin(8, arb_bin(4, arb_bin(2, _, _), arb_bin(6, _, _)), arb_bin(12, arb_bin(10, _, _), _))).