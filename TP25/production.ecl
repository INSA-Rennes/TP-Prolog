/**
 * Question 5.1
 */
/**
 * techniciens(?Techniciens)
 */
techniciens(Techniciens):-
	Techniciens = [](5, 7, 2, 6, 9, 3, 7, 5, 3).

/**
 * quantites(?Quantites)
 */
quantites(Quantites):-
	Quantites = [](140, 130, 60, 95, 70, 85, 100, 30, 45).

/**
 * benefices(?Benefices)
 */
benefices(Benefices):-
	Benefices = [](4, 5, 8, 5, 6, 4, 7, 10, 11).

/**
 * fabrique(?Fabrique)
 */
fabrique(Fabrique):-
	techniciens(Techniciens),
	dim(Techniciens, Taille),
	dim(Fabrique, Taille),
	Fabrique #:: 0..1.

/**
 * Question 5.2
 */
/**
 * nb_ouvriers(?Fabriquer, ?NbOuvriers)
 */
nb_ouvriers(Fabriquer, NbOuvriers):-
	techniciens(Techniciens),
	dim(Techniciens, Taille),
	(for(I, 1, Taille), fromto(0, In, Out, NbOuvriers) do
		Out #= Fabriquer[I] * Techniciens[I] + In
	).

/**
 * benefices_totaux(?Fabriquer, ?BeneficesTotaux)
 */
benefices_totaux(Fabriquer, BeneficesTotaux):-
	quantites(Quantites),
	benefices(Benefices),
	dim(Benefices, Taille),
	(for(I, 1, Taille) do
		BeneficesTotaux[I] #= Do * Quantites[I] * Benefices[I]
	).

/**
 * profit_total(?Fabriquer, ?Profit)
 */
profit_total(Fabriquer, Profit):-
	benefices_totaux(Fabriquer, BeneficesTotaux),
	(foreachelem(Benef, BeneficesTotaux), fromto(0, In, Out, Profit) do
		Out #= Do * Benef + In
	).

/**
 * Question 5.3
 * pose_contraintes(?Fabriquer, ?NbTechniciensTotal, ?Profit)
 */
pose_contraintes(Fabriquer, NbTechniciensTotal, Profit):-
	nb_ouvriers(Fabriquer, NbOuvriers),
	NbOuvriers #=< NbTechniciensTotal,
	profit_total(Fabriquer, Profit).

/**
 * Question 5.4
 */


/**
 * Question 5.5
 */


/**
 * Question 5.6
 */
