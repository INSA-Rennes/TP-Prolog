:- lib(ic).

/**
 * Question 1.11
 * vabs(?Val, ?AbsVal)
 */
vabs(Val, AbsVal):-
	AbsVal #> 0,
	(
		Val #= AbsVal
	;
		Val #= -AbsVal
	),
	labeling([Val, AbsVal]).

/**
 * vabsIC(?Val, ?AbsVal)
 */
vabsIC(Val, AbsVal):-
	AbsVal #> 0,
	Val #= AbsVal or Val #= -AbsVal,
	labeling([Val, AbsVal]).

/**
 * Question 1.12
 */
% X #:: -10..10, vabs(X, Y).
% X #:: -10..10, vabsIC(X, Y).

/**
 * Question 1.13
 * faitListeBug(?ListVar, ?Taille, +Min, +Max)
 * faitListeBug(ListVar, 2, 1, 3) tourne dans le vide a partir de la seconde solution.
 * Avec un cut c'est faitListeBug(ListVar, _, 1, 3) qui retourne une seule solution.
 */
faitListeBug([], 0, _, _).
faitListeBug([First|Rest], Taille, Min, Max):-
	First #:: Min..Max,
	Taille1 #= Taille - 1,
	faitListeBug(Rest, Taille1, Min, Max).

/**
 * faitListe(?ListVar, ?Taille, +Min, +Max)
 */
faitListe(ListVar, Taille, Min, Max):-
	length(ListVar, Taille),
	ListVar #:: Min..Max.

/**
 * Question 1.14
 * suite(?ListVar)
 */
suite([Xi, Xi1, Xi2]):-
	checkRelation(Xi, Xi1, Xi2).
suite([Xi, Xi1, Xi2|Rest]):-
	checkRelation(Xi, Xi1, Xi2),
	suite([Xi1, Xi2|Rest]).

/**
 * checkRelation(?Xi, ?Xi1, ?Xi2)
 */
checkRelation(Xi, Xi1, Xi2):-
	vabs(Xi1, VabsXi1),
	Xi2 #= VabsXi1 - Xi.

/**
 * Question 1.15
 * checkPeriode(+ListVar).
 */
% faitListe(ListVar, 18, -9, 9), suite(ListVar), ListVar = [X1, X2, X3, X4, X5, X6, X7, X8, X9, X10, X11|Rest], X1 #\= X10 or X2 #\= X11, labeling(ListVar).


/**
 * Tests
 */
/*
vabs(5, 5). => Yes
vabs(5, -5). => No
vabs(-5, 5). => Yes
vabs(X, 5).
vabs(X, AbsX). 
vabsIC(5, 5). => Yes
vabsIC(5, -5). => No
vabsIC(-5, 5). => Yes
vabsIC(X, 5).
vabsIC(X, AbsX).

faitListe(ListVar, 5, 1, 3). => 243 solutions
faitListe(ListVar, _, 1, 3). !!!!!!!!!!!!
faitListe([_, _, _, _, _], Taille, 1, 3). => Taille = 5

faitListe(ListVar, 18, -9, 9), suite(ListVar). => 99 solutions
*/