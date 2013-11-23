/**
TP 8 Traitement Automatique de la Langue (TAL) - Prolog
@author Paul CHAIGNON
@author Clement GAUTRAIS
@version Annee scolaire 2013/2014
*/

article(le).
article(un).
article_fem(la).
article_plu(les).

nom_commun(chien).
nom_commun(steack).
nom_commun(pull).
nom_commun_fem(rue).
nom_commun_fem(femme).
nom_commun_plu(enfants).

verbe(aboie).
verbe(marche).
verbe(porte).
verbe(mange).
verbe(dort).
verbe_plu(jouent).
verbe_plu(dorment).

nom_propre(paul).

preposition(dans).

pronom(qui).

adjectif(noir).
adjectif(petit).
adjectif_fem(petite).
adjectif_plu(petits).

/*
===============================================================================
===============================================================================
 Définition des prédicats
===============================================================================
*/
phrase_simple(List, Rest, phr(GnTree, GvTree)):-
	gn(List, Rest1, GnTree),
	gv(Rest1, Rest, GvTree).
phrase_simple(List, Rest, phr(GnTree, GvTree)):-
	gn_plu(List, Rest1, GnTree),
	gv_plu(Rest1, Rest, GvTree).

gn(List, Rest, GnTree):-
	gn_simple(List, Rest, GnTree).
gn(List, Rest, gn(GnTree, PropTree)):-
	gn_simple(List, Rest1, GnTree),
	prop_relative(Rest1, Rest, PropTree).

gn_plu(List, Rest, GnTree):-
	gn_simple(List, Rest, GnTree).
gn_plu(List, Rest, gn(GnTree, PropTree)):-
	gn_simple_plu(List, Rest1, GnTree),
	prop_relative_plu(Rest1, Rest, PropTree).

gn_simple([First|List], List, gn(nom_propre(First))):-
	nom_propre(First).
gn_simple([First, Second|List], List, gn(art(First), nom_com(Second))):-
	((
		article(First),
		nom_commun(Second)
	);(
		article_fem(First),
		nom_commun_fem(Second)
	)).
gn_simple([First, Second, Third|List], List, gn(art(First), nom_com(Second), adj(Third))):-
	((
		article(First),
		nom_commun(Second),
		adjectif(Third)
	);(
		article_fem(First),
		nom_commun_fem(Second),
		adjectif_fem(Third)
	)).
gn_simple([First, Second, Third|List], List, gn(art(First), adj(Second), nom_com(Third))):-
	((
		article(First),
		adjectif(Second),
		nom_commun(Third)
	);(
		article_fem(First),
		adjectif_fem(Second),
		nom_commun_fem(Third)
	)).
gn_simple([First, Second, Third, Fourth|List], List, gn(art(First), adj(Second), nom_com(Third), adj(Fourth))):-
	((
		article(First),
		adjectif(Second),
		nom_commun(Third),
		adjectif(Fourth)
	);(
		article_fem(First),
		adjectif_fem(Second),
		nom_commun_fem(Third),
		adjectif_fem(Fourth)
	)).

gn_simple_plu([First, Second|List], List, gn(art(First), nom_com(Second))):-
	article_plu(First),
	nom_commun_plu(Second).
gn_simple_plu([First, Second, Third|List], List, gn(art(First), nom_com(Second), adj(Third))):-
	article_plu(First),
	nom_commun_plu(Second),
	adjectif_plu(Third).
gn_simple_plu([First, Second, Third|List], List, gn(art(First), adj(Second), nom_com(Third))):-
	article_plu(First),
	adjectif_plu(Second),
	nom_commun_plu(Third).
gn_simple_plu([First, Second, Third, Fourth|List], List, gn(art(First), adj(Second), nom_com(Third), adj(Fourth))):-
	article_plu(First),
	adjectif_plu(Second),
	nom_commun_plu(Third),
	adjectif_plu(Fourth).

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

gv_plu([First|List], List, gv(verbe(First))):-
	verbe_plu(First).
gv_plu([First|List], Rest, gv(verbe(First), GnTree)):-
	verbe_plu(First),
	gn(List, Rest, GnTree).
gv_plu([First|List], Rest, gv(verbe(First), GnTree, GpTree)):-
	verbe_plu(First),
	gn(List, Rest1, GnTree),
	gp(Rest1, Rest, GpTree).
gv_plu([First|List], Rest, gv(verbe(First), GpTree)):-
	verbe_plu(First),
	gp(List, Rest, GpTree).

gp([First|List], Rest, gp_prep(prep(First), GnTree)):-
	preposition(First),
	gn(List, Rest, GnTree).

prop_relative([First|List], Rest, rel(pronom(First), GvTree)):-
	pronom(First),
	gv(List, Rest, GvTree).

prop_relative_plu([First|List], Rest, rel(pronom(First), GvTree)):-
	pronom(First),
	gv_plu(List, Rest, GvTree).

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