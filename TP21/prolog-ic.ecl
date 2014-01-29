voiture(rouge).
voiture(vert(clair)).
voiture(gris).
voiture(blanc).
bateau(vert).
bateau(blanc).
bateau(noir).

/**
 * Question 1.1
 * choixCouleur(?CouleurBateau, ?CouleurVoiture)
 */
choixCouleur(CouleurBateau, CouleurVoiture):-
	CouleurVoiture == CouleurBateau,
	voiture(CouleurVoiture),
	bateau(CouleurBateau).


minResistance(5000).
maxResistance(10000).
minCondensateur(9000).
maxCondensateur(20000).

/**
 * Question 1.3
 * isBetween(?Var, +Min, -Max)
 */
isBetween(Var, Min, Max):-
	var(Var),
	Var >= Min,
	Var <= Max.
isBetween(Var, Min, Max):-
	free(Var),
	isBetweenIncremental(Var, Min, Max).

/**
 * isBetweenIncremental(-Var, +Min, +Max)
 */
isBetweenIncremental(Min, Min, Max).
isBetweenIncremental(Var, Min, Max):-
	NextMin is Min + 1,
	NextMin <= Max,
	isBetweenIncremental(Var, NextMin, Max).

/**
 * Question 1.4
 * commande(-NbResistance, -NbCondensateur)
 */
commande(NbResistance, NbCondensateur):-
	minResistance(MinResistance),
	maxResistance(MaxResistance),
	minCondensateur(MinCondensateur),
	maxCondensateur(MaxCondensateur),
	isBetween(NbResistance, MinResistance, MaxResistance),
	isBetween(NbCondensateur, MinCondensateur, MaxCondensateur),
	NbResistance >= NbCondensateur.

/**
 * Question 1.7
 * commandeIC(-NbResistance, -NbCondensateur)
 */
commandeIC(NbResistance, NbCondensateur):-
	minResistance(MinResistance),
	maxResistance(MaxResistance),
	minCondensateur(MinCondensateur),
	maxCondensateur(MaxCondensateur),
	NbResistance #:: MinResistance..MaxResistance,
	NbCondensateur #:: MinCondensateur..MaxCondensateur,
	NbResistance #>= NbCondensateur.

/**
 * Question 1.8
 * commandeLabeling(-NbResistance, -NbCondensateur)
 */
commandeLabeling(NbResistance, NbCondensateur):-
	commandeIC(NbResistance, NbCondensateur),
	labeling([NbResistance, NbCondensateur]).


/**
 * Tests
 */
/*
choixCouleur(rouge, rouge).
choixCouleur(noir, vert(clair)).
choixCouleur(vert, vert(clair)).

isBetween(4000000, 1000000, 8000000).
isBetween(10000000, 1000000, 8000000).
isBetween(X, 1, 5).

commande(NbResistance, NbCondensateur).
commandeIC(NbResistance, NbCondensateur).
commandeLabeling(NbResistance, NbCondensateur).
*/