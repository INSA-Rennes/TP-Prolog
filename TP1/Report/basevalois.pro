/**
 * TP Base Valois - Famille de France
 * @author Clement GAUTRAIS
 * @author Paul CHAIGNON
 * @version Annee scolaire 2013/2014
 */


% Question 2.1
% enfant(?, ?)
enfant(E, P):-
	pere(P, E);
	mere(P, E).

% parent(?, ?)
parent(P, E):-
	enfant(E, P).

% grand_pere(+, -)
grand_pere(G, E):-
	pere(G, P),
	parent(P, E).

% frere(+, -)
frere(F, E):-
	pere(P, F),
	pere(P, E),
	mere(M, E),
	mere(M, F),
	homme(F),
	E \= F.

% soeur(+, -)
soeur(S, E):-
	parent(P, S),
	parent(P, E),
	femme(S),
	E \= S.

% frere_ou_soeur(+, -)
frere_ou_soeur(FS, E):-
	soeur(FS, E);
	frere(FS, E).

% oncle(?, ?)
oncle(O, N):-
	parent(P, N),
	frere(P, O).

% cousin(?, ?)
cousin(C, E):-
	parent(P, E),
	frere_ou_soeur(P, FS),
	enfant(C, FS).

% le_roi_est_mort_vive_le_roi(+, +, -)
le_roi_est_mort_vive_le_roi(R1, D, R2):-
	roi(R1, _, _, D),
	roi(R2, _, D, _).


% Question 2.2
% ancetre(+, -)
ancetre(X,Y):-
	parent(X,Y).
ancetre(X,Y):-
	parent(X,Z),
	ancetre(Z,Y).