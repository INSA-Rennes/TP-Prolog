/**
TP 8 Traitement Automatique de la Langue (TAL) - Prolog
@author Paul CHAIGNON
@author Clement GAUTRAIS
@version Annee scolaire 2013/2014
*/

article(le).
article(les).
article(la).
article(un).

nom_commun(chien).
nom_commun(enfants).
nom_commun(steack).
nom_commun(pull).
nom_commun(rue).
nom_commun(femme).

verbe(aboie).
verbe(jouent).
verbe(marche).
verbe(porte).
verbe(mange).

nom_propre(paul).

preposition(dans).

pronom(qui).

adjectif(noir).

/*
===============================================================================
===============================================================================
 Définition des prédicats
===============================================================================
*/

phrase_simple(List, Rest):-
	gn(List, Rest1),
	gv(Rest1, Rest).

gn([Elem|List], List):-
	nom_propre(Elem).
gn([First, Second|List], List):-
	article(First),
	nom_commun(Second).
gn([First, Second, Third, List], List):-
	article(First),
	nom_commun(Second),
	adjectif(Third).
gn([First, Second|List], List):-
	nom_propre(First),
	relatif(Second).
gn([First, Second, Third|List], List):-
	article(First),
	nom_commun(Second),
	relatif(Third).

gv([Elem|List], List):-
	verbe(Elem).
gv([First|List], Rest):-
	verbe(First),
	gn(List, Rest).
gv([First|List], Rest):-
	verbe(First),
	gp(List, Rest).

gp([First|List], Rest):-
	preposition(First),
	gn(List, Rest).

relatif([First|List], Rest):-
	pronom(First),
	gv(List, Rest).

analyse(List):-
	phrase_simple(List, []).

/*
===============================================================================
===============================================================================
 Tests
===============================================================================
*/

% Quelques phrases de test à copier coller pour vous faire gagner du temps, mais
% n'hésitez pas à en définir d'autres

/*
analyse([le, chien, aboie]).
analyse([les, enfants, jouent]).
analyse([paul, marche, dans, la, rue]).
analyse([la, femme, qui, porte, un, pull, noir, mange, un, steack]).
analyse([les, chien, aboie]).
analyse([la, femme, qui, porte, un, pull, noir, mange, un, chien]).
*/