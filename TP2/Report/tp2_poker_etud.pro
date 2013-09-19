/**
 * TP Manipulation de termes construits
 * @author Clement GAUTRAIS
 * @author Paul CHAIGNON
 * @version Annee scolaire 2013/2014
 */

/**
 * QUESTION 1 : est_carte(carte(Hauteur,Couleur))
 */
est_carte(carte(Hauteur,Couleur)):-
	hauteur(Hauteur),
	couleur(Couleur).


/** 
 * QUESTION 2 : est_main(main(C1,C2,C3,C4,C5))
 */ 
est_main(main(C1,C2,C3,C4,C5)):-
	est_carte(C1), est_carte(C2), est_carte(C3), est_carte(C4), est_carte(C5),
	C1 \= C2, C1 \= C3, C1 \= C4, C1 \= C5,
	C2 \= C3, C2 \= C4, C2 \= C5,
	C3 \= C4, C3 \= C5,
	C4 \= C5.


/**
 * QUESTION 3 : inf_carte(C1, C2) première version
 */
inf_hauteur(H1, H2):-
	succ_hauteur(H1, H2).
inf_hauteur(H1, H2):-
	succ_hauteur(H1, H),
	inf_hauteur(H, H2).

inf_couleur(C1, C2):-
	succ_couleur(C1, C2).
inf_couleur(C1, C2):-
	succ_couleur(C1, C),
	inf_couleur(C, C2).

inf_carte(carte(H1, C1), carte(H2, C2)):-
	inf_hauteur(H1, H2).
inf_carte(carte(H1, C1), carte(H1, C2)):-
	inf_couleur(C1, C2).


/**
 * QUESTION 3 : inf_carte_b(C1,C2) deuxième version
 */
inf_carte_b(carte(H1, C1), carte(H2, C2)):-
	est_carte(carte(H1, C1)),
	est_carte(carte(H2, C2)),
	inf_carte_bis(carte(H1, C1), carte(H2, C2)).
inf_carte_bis(carte(H1, C1), carte(H2, C2)):-
	inf_hauteur(H1, H2).
inf_carte_bis(carte(H1, C1), carte(H1, C2)):-
	inf_couleur(C1, C2).


/**
 * QUESTION 4 : est_main_triee(main(C1,C2,C3,C4,C5))
 */
est_main_triee(main(C1,C2,C3,C4,C5)):-
	est_carte(C1), est_carte(C2), est_carte(C3), est_carte(C4), est_carte(C5),
	inf_carte_b(C1, C2),
	inf_carte_b(C2, C3),
	inf_carte_b(C3, C4),
	inf_carte_b(C4, C5).


/**
 * QUESTION 5 : une_paire(main(C1,C2,C3,C4,C5))
 */
get_hauteur(carte(H, _), H).
get_couleur(carte(_, C), C).

une_paire(main(C1, C2, C3, C4, C5)):-
	est_main_triee(main(C1, C2, C3, C4, C5)),
	get_hauteur(C1, H1), get_hauteur(C2, H2), get_hauteur(C3, H3),
	get_hauteur(C4, H4), get_hauteur(C5, H5),
	deux_meme_hauteur(H1, H2, H3, H4, H5).
deux_meme_hauteur(H1, H2, H3, H4, H5):-
	H1 == H2;
	H2 == H3;
	H3 == H4;
	H4 == H5.


/**
 * QUESTION 6 : deux_paires(main(C1,C2,C3,C4,C5))
 */
deux_paires(main(C1, C2, C3, C4, C5)):-
	est_main_triee(main(C1, C2, C3, C4, C5)),
	get_hauteur(C1, H1), get_hauteur(C2, H2), get_hauteur(C3, H3),
	get_hauteur(C4, H4), get_hauteur(C5, H5),
	deux_meme_hauteur_r(H1, H2, H3, H4, H5, HR1),
	deux_meme_hauteur_r(H1, H2, H3, H4, H5, HR2),
	HR1 \= HR2.

deux_meme_hauteur_r(H1, H2, H3, H4, H5, HR):-
	H1 == H2, HR = H1;
	H2 == H3, HR = H2;
	H3 == H4, HR = H3;
	H4 == H5, HR = H4.


/**
 * QUESTION 7 : brelan(main(C1,C2,C3,C4,C5))
 */
brelan(main(C1, C2, C3, C4, C5)):-
	est_main_triee(main(C1, C2, C3, C4, C5)),
	get_hauteur(C1, H1), get_hauteur(C2, H2), get_hauteur(C3, H3),
	get_hauteur(C4, H4), get_hauteur(C5, H5),
	trois_meme_hauteur(H1, H2, H3, H4, H5).
trois_meme_hauteur(H1, H2, H3, H4, H5):-
	H1 == H2, H2 == H3;
	H2 == H3, H3 == H4;
	H3 == H4, H4 == H5.


/**
 * QUESTION 8 : suite(main(C1,C2,C3,C4,C5))
 */
suite(main(C1,C2,C3,C4,C5)):-
	est_main_triee(main(C1, C2, C3, C4, C5)),
	get_hauteur(C1, H1), get_hauteur(C2, H2), get_hauteur(C3, H3),
	get_hauteur(C4, H4), get_hauteur(C5, H5),
	succ_hauteur(H1, H2), succ_hauteur(H2, H3), succ_hauteur(H3, H4),
	succ_hauteur(H4, H5).


/**
 * QUESTION 9 : full(main(C1,C2,C3,C4,C5))
 */
full(main(C1,C2,C3,C4,C5)):-
	est_main_triee(main(C1, C2, C3, C4, C5)),
	get_hauteur(C1, H1), get_hauteur(C2, H2), get_hauteur(C3, H3),
	get_hauteur(C4, H4), get_hauteur(C5, H5),
	trois_meme_hauteur_r(H1, H2, H3, H4, H5, HR1),
	deux_meme_hauteur_r(H1, H2, H3, H4, H5, HR2),
	HR1 \= HR2.
trois_meme_hauteur_r(H1, H2, H3, H4, H5, HR):-
	H1 == H2, H2 == H3, HR = H1;
	H2 == H3, H3 == H4, HR = H2;
	H3 == H4, H4 == H5, HR = H3.