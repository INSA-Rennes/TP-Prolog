/**
 * TP Listes Prolog
 * @author Paul CHAIGNON
 * @author Clement GAUTRAIS
 * @version Annee scolaire 2013/2014
 */

/** 
 * Question 1
 */
membre(A,[A|R]).
membre(A,[X|R]):-
	membre(A,R).

compte(A,[],0).
compte(A,[A|R],N):-
	compte(A,R,M),
	N is M+1.
compte(A,[X|R],N):-
	A \== X,
	compte(A,R,N).

renverser(X, Y):-
	renv(X, [], Y).
renv([X|R],A,Y):-
	renv(R,[X|A],Y).
renv([],Y,Y).

palind(X):-
	renverser(X, X).

/**
 * + + -
 */
nieme(0, [X|R], X).
nieme(N, [Y|R], X):-
	N \== 0,
	M is N-1,
	nieme(M, R, X).

/**
 * - + +
 */
nieme2(0, [X|R], X).
nieme2(N, [Y|R], X):-
	X \== Y,
	nieme2(M, R, X),
	N is M+1.

/** Pas possible d'avoir un algo commun car ils ne font pas la même chose.
 * De plus, il y aurait des problèmes si une liste contient 2 valeurs identique.

 */

hors_de(A,X):-
	compte(A, X, 0).

tous_diff([]).
tous_diff([X|R]):-
	hors_de(X, R),
	tous_diff(R).

conc3([], [], Z, Z).
conc3([], [P|R], Z, [P|T]):-
	conc3([], R, Z, T).
conc3([P|R], Y, Z, [P|T]):-
	conc3(R, Y, Z, T).

debute_par(X,[]).
debute_par([X|R], [X|Q]):-
	debute_par(R, Q).

sous_liste(X, Y):-
	debute_par(X, Y).
sous_liste([X|R], Y):-
	sous_liste(R, Y).

elim(X, Y):-
	elimin(X, Y, []).
elimin([], Z, Z).
elimin([X|R], Y, Z):-
	compte(X, Z, 1),
	elimin(R, Y, Z).
elimin([X|R], Y, Z):-
	compte(X, Z, 0),
	elimin(R, Y, [X|Z]).

inserer(E, [], [E]).
inserer(E, [P|R], [E,P|R]):-
	E =< P.
inserer(E, [P|R], [P|Z]):-
	E > P,
	inserer(E, R, Z).
