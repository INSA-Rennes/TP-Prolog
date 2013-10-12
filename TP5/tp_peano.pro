/**
 * TP5 - Arithmetique
 * @author Paul CHAIGNON
 * @author Clement GAUTRAIS
 * @version Annee scolaire 2013/2014
 */

/**
 * Question 1
 * add(?, ?, ?)
 */
add(zero, X, X).
add(s(X), Y, s(Sum)):-
	add(X, Y, Sum).

/**
 * Question 2
 * sub(?, ?, ?)
 */
sub(X, zero, X).
sub(s(X), s(Y), Sub):-
	sub(X, Y, Sub).

/**
 * Question 3
 * prod(+, +, -)
 */
prod(zero, Y, zero).
prod(s(X), Y, Prod):-
	prod(X, Y, Prod1),
	add(Y, Prod1, Prod).

/**
 * Question 4
 * factorial(+, -)
 */
factorial(zero, s(zero)).
factorial(s(X), Y):-
	factorial(X, Y1),
	prod(s(X), Y1, Y).


/**
 * Tests
 */
add(s(zero), s(s(zero)), Sum).
% Sum = s(s(s(zero)))
add(X, Y, s(s(zero))).
% X = zero
% Y = s(s(zero)) ?
% X = s(zero)
% Y = s(zero) ?
% X = s(s(zero))
% Y = zero ? 

sub(s(s(zero)), s(zero), Sub).
% Sub = s(zero)
sub(s(s(zero)), s(s(zero)), Sub).
% Sub = zero
sub(s(s(zero)), s(s(s(zero))), Sub).
% No

prod(s(s(zero)), s(s(s(zero))), Prod).
% Prod = s(s(s(s(s(s(zero))))))

factorial(s(s(s(zero))), F).
% F = s(s(s(s(s(s(zero))))))