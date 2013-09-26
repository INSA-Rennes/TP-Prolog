/**
TP Listes Prolog

@author Paul CHAIGNON
@author Clement GAUTRAIS
@version Annee scolaire 2013/2014
*/

/** 
Question 1
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

renverser([],[])