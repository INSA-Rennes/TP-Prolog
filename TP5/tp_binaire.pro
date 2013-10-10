/**
 * TP5 - Arithmetique
 * @author Paul CHAIGNON
 * @author Clement GAUTRAIS
 * @version Annee scolaire 2013/2014
 */

add_bit(0, 0, 0, 0, 0).
add_bit(0, 0, 1, 1, 0).
add_bit(0, 1, 0, 1, 0).
add_bit(0, 1, 1, 0, 1).
add_bit(1, 0, 0, 1, 0).
add_bit(1, 0, 1, 0, 1).
add_bit(1, 1, 0, 0, 1).
add_bit(1, 1, 1, 1, 1).

sub_bit(0, 0, 0, 0, 0).
sub_bit(0, 0, 1, 1, 1).
sub_bit(0, 1, 0, 1, 1).
sub_bit(0, 1, 1, 0, 1).
sub_bit(1, 0, 0, 1, 0).
sub_bit(1, 0, 1, 0, 0).
sub_bit(1, 1, 0, 0, 0).
sub_bit(1, 1, 1, 1, 1).

/**
 * Question 5
 * add(?, ?, ?)
 */
add_bis([], [], [], 0).
add_bis([], [], [1], 1).
add_bis([], [Bit2|R2], [Res | Result], CarryIn):-
	add_bit(0, Bit2, CarryIn, Res, CarryOut),
	add_bis([], R2, Result, CarryOut).
add_bis([Bit1|R1], [], [Res | Result], CarryIn):-
	add_bit(Bit1, 0, CarryIn, Res, CarryOut),
	add_bis(R1, [], Result, CarryOut).
add_bis([Bit1|R1], [Bit2|R2], [Res | Result], CarryIn):-
	add_bit(Bit1, Bit2, CarryIn, Res, CarryOut),
	add_bis(R1, R2, Result, CarryOut).
add(R1, R2, Res):-
	add_bis(R1, R2, Res, 0).

/**
 * Question 6
 * sub(?, ?, ?)
 */
/*complem2([], []).
complem2([0|L], [1|LR]):-
	complem2(L, LR).
complem2([1|L], [0|LR]):-
	complem2(L, LR).
sub(X, Y, Res):-
	complem2(Y, Y1),
	add(Y1, [1], RY),
	add(X, RY, Res).*/

sub_bis([], [], [], 0).
%sub_bis([], [], [1], 1).
sub_bis([], [Bit2|R2], [Res | Result], CarryIn):-
	sub_bit(0, Bit2, CarryIn, Res, CarryOut),
	sub_bis([], R2, Result, CarryOut).
sub_bis([Bit1|R1], [], [Res | Result], CarryIn):-
	sub_bit(Bit1, 0, CarryIn, Res, CarryOut),
	sub_bis(R1, [], Result, CarryOut).
sub_bis([Bit1|R1], [Bit2|R2], [Res | Result], CarryIn):-
	sub_bit(Bit1, Bit2, CarryIn, Res, CarryOut),
	sub_bis(R1, R2, Result, CarryOut).
sub(R1, R2, Res):-
	sub_bis(R1, R2, Res, 0).


/**
 * Question 7
 * prod(+, +, -)
 */
prod_bis([], _, [], _).
prod_bis([1|X], Y, Res, Offset):-
	prod_bis(X, Y, ResSuite, [0|Offset]),
	add(ResSuite, Offset, Res).
prod_bis([0|X], Y, Res, Offset):-
	prod_bis(X, Y, Res, [0|Offset]).
prod(X, Y, Res):-
	prod_bis(X, Y, Res, Y).

/**
 * Question 8
 * factorial(+, -)
 */
egal([], []).
egal([0|R1], []):-
	egal(R1, []).
egal([X|R1], [X|R2]):-
	egal(R1, R2).

factorial(X, [1]):-
	egal(X, []).
factorial(X, Y):-
	sub(X, [1], X1),
	factorial(X1, Y1),
	prod(X, Y1, Y).

/**
 * Question 9
 * factorial(+, -)
 */
factorial_is(0, 1).
factorial_is(X, Res):-
	X1 is X - 1,
	factorial_is(X1, Res1),
	Res is X * Res1,
	!.

/**
 * Tests
 */
/*

add([1], [0, 0, 1, 1], Sum). % Sum = [0,0,1,1]
add([1, 0, 0, 0], [0, 0, 1, 1], [1, 0, 1, 1]). % Yes
add([1, 0, 0, 0], [0, 0, 1, 1], Sum). % Sum = [1, 0, 1, 1]

*/
