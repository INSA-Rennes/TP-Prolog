:- lib(ic).

/**
 * chapie(-Chats, -Pies, -Pattes, -Tetes)
 */
chapie(Chats, Pies, Pattes, Tetes):-
	Chats #>= 0,
	Pies #>= 0,
	Pattes #>= 0,
	Tetes #>= 0,
	Pattes #= Chats * 4 + Pies * 2,
	Tetes #= Chats + Pies.

/**
 * Question 1.9
 */
% chapie(2, Pies, Pattes, 5).
/*
	Pies = 3
	Pattes = 14
	Yes (0.00s cpu)
*/

/**
 * Question 1.10
 */
% chapie(Chats, Pies, Pattes, Tetes), Pattes #= 3 * Tetes, labeling([Chats, Pies, Pattes, Tetes]).