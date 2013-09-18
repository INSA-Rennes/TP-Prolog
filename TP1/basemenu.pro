/**
 * TP Base Menu
 * @author Clement GAUTRAIS
 * @author Paul CHAIGNON
 * @version Annee scolaire 2013/2014
 */

hors_d_oeuvre(artichauts_Melanie).
hors_d_oeuvre(truffes_sous_le_sel).
hors_d_oeuvre(cresson_oeuf_poche).

viande(grillade_de_boeuf).
viande(poulet_au_tilleul).

poisson(bar_aux_algues).
poisson(saumon_oseille).

dessert(sorbet_aux_poires).
dessert(fraises_chantilly).
dessert(melon_en_surprise).

calories(artichauts_Melanie, 150).
calories(truffes_sous_le_sel, 202).
calories(cresson_oeuf_poche, 212).
calories(grillade_de_boeuf, 532).
calories(poulet_au_tilleul, 400).
calories(bar_aux_algues, 292).
calories(saumon_oseille, 254).
calories(sorbet_aux_poires, 223).
calories(fraises_chantilly, 289).
calories(melon_en_surprise, 122).


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

% Question 1.3


% Tests
% plat_resistance(cresson_oeuf_poche). -> Faux
% plat_resistance(poulet_au_tilleul). -> Vrai
% plat_resistance(bar_aux_algues). -> Vrai
% plat_resistance(melon_en_surprise). -> Faux

% repas(cresson_oeuf_poche, poulet_au_tilleul, melon_en_surprise). -> Vrai
% repas(cresson_oeuf_poche, poulet_au_tilleul, bar_aux_algues). -> Faux

% bon_plat(artichauts_Melanie). -> Faux
% bon_plat(truffes_sous_le_sel).-> Vrai
% bon_plat(grillades_de_boeuf). -> Faux
% bon_plat(poulet_au_tilleul). -> Faux

% plus_calorique_algues(saumon_oseille).-> Vrai
% plus_calorique_algues(bar_aux_algues). -> Faux
% plus_calorique_algues(poulet_au_tilleul). -> Vrai
% plus_calorique_algues(artichauts_Melanie). -> Faux

% total_calories(cresson_oeuf_poche, poulet_au_tilleul, melon_en_surprise, Cals). -> Cals = 734
% total_calories(cresson_oeuf_poche, poulet_au_tilleul, bar_aux_algues, Cals). -> Faux


% repas_equilibre(artichauts_Melanie, poulet_au_tilleul, melon_en_surprise). -> Vrai
% repas_equilibre(cresson_oeuf_poche, grillades_de_boeuf, fraises_chantilly). -> Faux
