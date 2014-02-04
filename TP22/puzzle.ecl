:- lib(ic_symbolic).
:- lib(ic).

m(Pays, Couleur, Boisson, Voiture, Animal, 1).
m(Pays, Couleur, Boisson, Voiture, Animal, 2).
m(Pays, Couleur, Boisson, Voiture, Animal, 3).
m(Pays, Couleur, Boisson, Voiture, Animal, 4).
m(Pays, Couleur, Boisson, Voiture, Animal, 5).

/**
 * Question 2.1
 */
local domain(pays(angleterre, espagne, ukraine, norvege, japon)).
local domain(couleur(rouge, vert, jaune, bleu, blanc)).
local domain(boisson(cafe, the, lait, jus_orange, eau)).
local domain(voiture(bmw, toyota, ford, honda, datsun)).
local domain(animal(chien, serpent, renard, cheval, zebre)).

/**
 * Question 2.2
 * domaines_maison(?Maison)
 */
domaines_maison(m(Pays, Couleur, Boisson, Voiture, Animal, Numero)):-
	Pays &:: pays,
	Couleur &:: couleur,
	Boisson &:: boisson,
	Voiture &:: voiture,
	Animal &:: animal, 
	Numero #:: 1..5.

/**
 * Question 2.3
 * rue(?Rue)
 */
rue().

/**
 * Question 2.4
 * ecrit_maisons(?Rue)
 */
ecrit_maisons().

/**
 * Question 2.5
 * getVarList(?Rue, ?Liste)
 */
getVarList().

/**
 * labeling_symbolic(+Liste)
 */
labeling_symbolic([]).
labeling_symbolic([Var|Liste]):-
	indomain(Var),
	labeling_symbolic(Liste).

/**
 * Question 2.6
 * resoudre(?Rue)
 */
resoudre(Rue):-
	rue(Rue),
	getVarListe(Rue, Liste),
	labeling_symbolic(Liste).

/**
 * Question 2.7
 */


/**
 * Question 2.8
 */

