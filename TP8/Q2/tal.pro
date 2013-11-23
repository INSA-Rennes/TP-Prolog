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
verbe(dort).

nom_propre(paul).

preposition(dans).

pronom(qui).

adjectif(noir).
adjectif(petit).

/*
===============================================================================
===============================================================================
 Définition des prédicats
===============================================================================
*/
phrase_simple(List, Rest, phr(GnTree, GvTree)):-
	gn(List, Rest1, GnTree),
	gv(Rest1, Rest, GvTree).

gn(List, Rest, GnTree):-
	gn_simple(List, Rest, GnTree).
gn(List, Rest, gn(GnTree, PropTree)):-
	gn_simple(List, Rest1, GnTree),
	prop_relative(Rest1, Rest, PropTree).

gn_simple([First|List], List, gn(nom_propre(First))):-
	nom_propre(First).
gn_simple([First, Second|List], List, gn(art(First), nom_com(Second))):-
	article(First),
	nom_commun(Second).
gn_simple([First, Second, Third|List], List, gn(art(First), nom_com(Second), adj(Third))):-
	article(First),
	nom_commun(Second),
	adjectif(Third).
gn_simple([First, Second, Third|List], List, gn(art(First), adj(Second), nom_com(Third))):-
	article(First),
	adjectif(Second),
	nom_commun(Third).
gn_simple([First, Second, Third, Fourth|List], List, gn(art(First), adj(Second), nom_com(Third), adj(Fourth))):-
	article(First),
	adjectif(Second),
	nom_commun(Third),
	adjectif(Fourth).

gv([First|List], List, gv(verbe(First))):-
	verbe(First).
gv([First|List], Rest, gv(verbe(First), GnTree)):-
	verbe(First),
	gn(List, Rest, GnTree).
gv([First|List], Rest, gv(verbe(First), GnTree, GpTree)):-
	verbe(First),
	gn(List, Rest1, GnTree),
	gp(Rest1, Rest, GpTree).
gv([First|List], Rest, gv(verbe(First), GpTree)):-
	verbe(First),
	gp(List, Rest, GpTree).

gp([First|List], Rest, gp_prep(prep(First), GnTree)):-
	preposition(First),
	gn(List, Rest, GnTree).

prop_relative([First|List], Rest, rel(pronom(First), GvTree)):-
	pronom(First),
	gv(List, Rest, GvTree).

analyse(List, Tree):-
	phrase_simple(List, [], Tree).

/*
===============================================================================
===============================================================================
 Tests
===============================================================================

Les arbres ne sont pas identiques a l'enonce.
Les groupes nominaux contenant des propositions subordonees relatives ont ete modifies afin de simplifier le code.

*/

/*
analyse([le, chien, aboie], Tree).
	Tree = phr(gn(art(le), nom_com(chien)), gv(verbe(aboie)))
analyse([paul, qui, porte, un, pull, noir, mange, un, steack], Tree).
	Tree = phr(gn(nom_prop(paul), rel(pronom(qui), gv(verbe(porte), 
				gn(art(un), nom_com(pull), adj(noir))))), gv(verbe(mange), 
				gn(art(un), nom_com(steack))))
analyse([la, petit, chien, noir, qui, dort, mange], Tree).
	Tree = phr(gn(gn(art(la), adj(petit), nom_com(chien), adj(noir)), 
				rel(pronom(qui), gv(verbe(dort)))), gv(verbe(mange)))
*/