/*arb_bin(1, arb_bin(2, arb_bin(6, vide, vide), vide), arb_bin(3, arb_bin(4, vide, vide), arb_bin(5, vide, vide))).*/
/*arb_bin(8, arb_bin(4, arb_bin(2, vide, vide), arb_bin(6, vide, vide)), arb_bin(12, arb_bin(10, vide, vide), vide)).*/

/**
 * Question 1
 */
arbre_binaire(vide).
arbre_binaire(arb_bin(R, G, D)):-
	integer(R),
	arbre_binaire(G),
	arbre_binaire(D).

/**
 * Question 2
 */
infixe(vide, []).
infixe(arb_bin(R, G, D), L):-
	infixe(D, LD),
	infixe(G, LG),
	append(LG, [R|LD], L).

/**
 * Question 3
 */
insertion_ordonne(X, vide, arb_bin(X, vide, vide)):-!.
insertion_ordonne(X, arb_bin(X, G, D), arb_bin(X, G, D)):-!.
insertion_ordonne(X, arb_bin(R, G, D), arb_bin(R, G, NewD)):-
	X > R,
	insertion_ordonne(X, D, NewD).
insertion_ordonne(X, arb_bin(R, G, D), arb_bin(R, NewG, D)):-
	X < R,
	insertion_ordonne(X, G, NewG).

/**
 * Question 4
 */
insertion_ordonne1(X, G, arb_bin(X, G1, D1)):-
	free(G),
	free(D1),
	free(G1),
	!.
insertion_ordonne1(X, arb_bin(X, G, D), arb_bin(X, G, D)):-!.
insertion_ordonne1(X, arb_bin(R, G, D), arb_bin(R, G, NewD)):-
	X > R,
	insertion_ordonne1(X, D, NewD).
insertion_ordonne1(X, arb_bin(R, G, D), arb_bin(R, NewG, D)):-
	X < R,
	insertion_ordonne1(X, G, NewG).
