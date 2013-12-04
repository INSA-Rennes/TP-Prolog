/**
TP 8 Traitement Automatique de la Langue (TAL) - Prolog
@author Paul CHAIGNON
@author Clement GAUTRAIS
@version Annee scolaire 2013/2014
*/

article(m, s, le).
article(m, s, un).
article(f, s, la).
article(_, p, les).

nom_commun(m, s, chien).
nom_commun(m, s, steack).
nom_commun(m, s, pull).
nom_commun(f, s, rue).
nom_commun(f, s, femme).
nom_commun(m, p, enfants).

verbe(s, aboie).
verbe(s, marche).
verbe(s, porte).
verbe(s, mange).
verbe(p, mangent).
verbe(s, dort).
verbe(p, jouent).
verbe(s, joue).
verbe(p, dorment).

nom_propre(m, s, paul).

preposition(dans).

pronom(qui).

adjectif(m, s, noir).
adjectif(m, s, petit).
adjectif(f, s, petite).
adjectif(m, p, petits).

/*
===============================================================================
===============================================================================
 Définition des prédicats
===============================================================================
*/
phrase_simple(List, Rest, phr(GnTree, GvTree)):-
	gn(Number, List, Rest1, GnTree),
	gv(Number, Rest1, Rest, GvTree).

gn(Number, List, Rest, GnTree):-
	gn_simple(Number, List, Rest, GnTree).
gn(Number, List, Rest, gn(GnTree, PropTree)):-
	gn_simple(Number, List, Rest1, GnTree),
	prop_relative(Number, Rest1, Rest, PropTree).

gn_simple(Number, [First|List], List, gn(nom_propre(First))):-
	nom_propre(_, Number, First).
gn_simple(Number, [First, Second|List], List, gn(art(First), nom_com(Second))):-
	article(Gender, Number, First),
	nom_commun(Gender, Number, Second).
gn_simple(Number, [First, Second, Third|List], List, gn(art(First), nom_com(Second), adj(Third))):-
	article(Gender, Number, First),
	nom_commun(Gender, Number, Second),
	adjectif(Gender, Number, Third).
gn_simple(Number, [First, Second, Third|List], List, gn(art(First), adj(Second), nom_com(Third))):-
	article(Gender, Number, First),
	adjectif(Gender, Number, Second),
	nom_commun(Gender, Number, Third).
gn_simple(Number, [First, Second, Third, Fourth|List], List, gn(art(First), adj(Second), nom_com(Third), adj(Fourth))):-
	article(Gender, Number, First),
	adjectif(Gender, Number, Second),
	nom_commun(Gender, Number, Third),
	adjectif(Gender, Number, Fourth).

gv(Number, [First|List], List, gv(verbe(First))):-
	verbe(Number, First).
gv(Number, [First|List], Rest, gv(verbe(First), GnTree)):-
	verbe(Number, First),
	gn(_, List, Rest, GnTree).
gv(Number, [First|List], Rest, gv(verbe(First), GnTree, GpTree)):-
	verbe(Number, First),
	gn(_, List, Rest1, GnTree),
	gp(Rest1, Rest, GpTree).
gv(Number, [First|List], Rest, gv(verbe(First), GpTree)):-
	verbe(Number, First),
	gp(List, Rest, GpTree).

gp([First|List], Rest, gp_prep(prep(First), GnTree)):-
	preposition(First),
	gn(_, List, Rest, GnTree).

prop_relative(Number, [First|List], Rest, rel(pronom(First), GvTree)):-
	pronom(First),
	gv(Number, List, Rest, GvTree).

analyse(List, Tree):-
	phrase_simple(List, [], Tree).

/*
===============================================================================
===============================================================================
 Tests
===============================================================================
*/

/*
analyse([les, chien, aboie], Tree).
	No
analyse([paul, qui, jouent, mange, un, steack], Tree).
	No
analyse([la, petit, chien, noir, qui, dort, mange], Tree).
	No
analyse([les, enfants, qui, dorment, mangent], Tree).
	Yes
*/