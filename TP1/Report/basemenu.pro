/**
 * TP Base Menu
 * @author Clement GAUTRAIS
 * @author Paul CHAIGNON
 * @version Annee scolaire 2013/2014
 */


% Question 1.1
% hors_d_oeuvre(X).
% viande(X).
% poisson(X).
% calories(X, Y).


% Question 1.2

% plat_resistance(?)
plat_resistance(Plat):-
	viande(Plat);
	poisson(Plat).

% repas(?, ?, ?)
repas(Entree, Plat, Dessert):-
	hors_d_oeuvre(Entree),
	plat_resistance(Plat),
	dessert(Dessert).

% bon_plat(?)
bon_plat(Plat):-
	calories(Plat, Cal),
	Cal > 200,
	Cal < 400.

% plus_calorique_algues(?)
plus_calorique_algues(Plat):-
	calories(bar_aux_algues, CalAlgues),
	calories(Plat, Cal),
	Cal > CalAlgues.

% total_calories(?, ?, ?, -)
total_calories(Entree, Plat, Dessert, Total):-
	repas(Entree, Plat, Dessert),
	calories(Entree, CalEntree),
	calories(Plat, CalPlat),
	calories(Dessert, CalDessert),
	Total is CalEntree + CalPlat + CalDessert.

% repas_equilibre(?, ?, ?)
repas_equilibre(Entree, Plat, Dessert):-
	total_calories(Entree, Plat, Dessert, Total),
	Total < 800.