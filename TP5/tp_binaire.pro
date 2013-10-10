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

/**
 * Question 5
 * add(?, ?, ?)
 */
add([], [], [0]).
add([], [Bit2|R2], [Res|Result]):-
	add([], R2, [CarryIn|Result]),
	add_bit(0, Bit2, CarryIn, Res, 0).
add([], [Bit2|R2], [1,Res|Result]):-
	add([], R2, [CarryIn|Result]),
	add_bit(0, Bit2, CarryIn, Res, 1).

add([Bit1|R1], [], [Res|Result]):-
	add(R1, [], [CarryIn|Result]),
	add_bit(Bit1, 0, CarryIn, Res, 0).
add([Bit1|R1], [], [1,Res|Result]):-
	add(R1, [], [CarryIn|Result]),
	add_bit(Bit1, 0, CarryIn, Res, 1).

add([Bit1|R1], [Bit2|R2], [Res|Result]):-
	add(R1, R2, [CarryIn|Result]),
	add_bit(Bit1, Bit2, CarryIn, Res, 0).
add([Bit1|R1], [Bit2|R2], [1,Res|Result]):-
	add(R1, R2, [CarryIn|Result]),
	add_bit(Bit1, Bit2, CarryIn, Res, 1).

/**
 * Question 6
 * sub(?, ?, ?)
 */


/**
 * Question 7
 * prod(+, +, -)
 */


/**
 * Question 8
 * factorial(+, -)
 */


/**
 * Question 9
 * factorial(+, -)
 */


/**
 * Tests
 */
add([1], [0, 0, 1, 1], Sum). % Sum = [1,0,1,1]
add([], [0, 0, 1, 1], Sum). % Sum = [1,0] NOT GOOD !!
add([], [0, 0, 1, 1], [1, 0, 1, 1]). % Yes