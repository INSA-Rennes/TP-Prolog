music(paul, 17, violon).
music(jean, 15, harpe).
music(lucie, 20, hautbois).
music(pierre, 15, clavecin).
music(lea, 22, harpe).
music(marc, 54, clavecin).
music(edouard, 38, clarinette).
music(marie, 14, violon).
music(igor, 19, hautbois).
music(eva, 53, harpe).
music(laure, 32, violon).


/**
 * Question 1
 */
un_qui([First|Rest]):-
	music(First, _, _);
	un_qui(Rest).

/**
 * Question 2
 */
verif_aucun([]).
verif_aucun([First|Rest]):-
	music(First, _, _),
	!,
	fail.
verif_aucun([First|Rest]):-
	verif_aucun(Rest).

/**
 * Question 3 
 */
/*un_qui_pass([]):-*/
un_qui_pas([]):-
	!,
	fail.
un_qui_pas([First|Rest]):-
	music(First, _, _),
	!,
	un_qui_pas(Rest).
un_qui_pas(_).

pas(A):-
	A,
	!,
	fail.
pas(A).