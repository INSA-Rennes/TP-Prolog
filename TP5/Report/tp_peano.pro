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