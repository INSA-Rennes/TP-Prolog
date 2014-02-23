:- lib(ic).
:- lib(ic_symbolic).

:- local domain(personnes(ron, zoe, jim, lou, luc, dan, ted, tom, max, kim)).

/**
 * Question 6.1
 */
/**
 * famille(?Famille, ?Poids)
 */
famille(Famille, Poids):-
	Famille = [](ron, zoe, jim, lou, luc, dan, ted, tom, max, kim),
	(foreachelem(Personne, Famille) do
		Personne &:: personnes
	),
	Poids = [](24, 39, 85, 60, 165, 6, 32, 123, 7, 14).

/**
 * places(?Places)
 */
places(Places):-
	famille(_, Poids),
	dim(Poids, [Taille]),
	dim(Places, [Taille]),
	Places #:: -8..8.

/**
 * nb_chaque_cote(Places, ?NbGauche, ?NbDroite)
 */
nb_chaque_cote(Places, NbGauche, NbDroite):-
	(foreachelem(Place, Places), fromto(0, InGauche, OutGauche, NbGauche), fromto(0, InDroite, OutDroite, NbDroite) do
		OutDroite #= InDroite + (Place #> 0),
		OutGauche #= InGauche + (Place #< 0)
	).

/**
 * moment_total(?Places, ?Poids, ?MomentTotal)
 */
moment_total(Places, Poids, MomentTotal):-
	(foreachelem(Place, Places), foreachelem(Poid, Poids), fromto(0, In, Out, MomentTotal) do
		Out #= In + Place * Poid
	).

/**
 * extremites(?Places, ?PlusAGauche, ?PlusADroite)
 */
extremites(Places, PlusAGauche, Min, PlusADroite, Max):-
	dim(Places, [Taille]),
	(for(I, 1, Taille), param(Places),
	fromto(0, InMin, OutMin, Min), fromto(0, InGauche, OutGauche, PlusAGauche),
	fromto(0, InMax, OutMax, Max), fromto(0, InDroite, OutDroite, PlusADroite) do
		Place is Places[I],

		Sup #= (Place #> InMax),
		OutDroite #= (Sup * I) + (neg(Sup) * InDroite),
		OutMax #= (Sup * Place) + (neg(Sup) * InMax),

		Inf #= (Place #< InMin),
		OutGauche #= (Inf * I) + (neg(Inf) * InGauche),
		OutMin #= (Inf * Place) + (neg(Inf) * InMin)
	).

/**
 * differents(?Places)
 * Verifie qu'il n'y a pas deux personnes a la meme place.
 */
differents(Places):-
	dim(Places, [Taille]),
	(for(I, 1, Taille), param(Taille, Places) do
		(for(J, I+1, Taille), param(Places, I) do
			Places[I] #\= Places[J]
		)
	).

/**
 * pose_contraintes(?Places)
 * Verifie qu'il y a 5 personnes de chaque cote.
 * Verifie que la balancoire est equilibree.
 * Verifie que les parents encadrent les enfants et
 * que les deux plus jeunes sont juste devant leurs parents.
 */
pose_contraintes(Places, Famille, Poids):-
	differents(Places),
	
	nb_chaque_cote(Places, 5, 5),
	
	moment_total(Places, Poids, 0),

	(PlusAGauche #= 8 and PlusADroite #= 4) or
	(PlusAGauche #= 4 and PlusADroite #= 8),
	(Places[6]#=PosGauche+1 and Places[9]#=PosDroite-1) or
	(Places[9]#=PosGauche+1 and Places[6]#=PosDroite-1),
	extremites(Places, PlusAGauche, PosGauche, PlusADroite, PosDroite).

/**
 * getVarList(+Places, -VarList)
 */
getVarList(Places, VarList):-
	(foreachelem(Place, Places), foreach(Var, VarList) do
		Var = Place
	).

/**
 * resoudre(?Places)
 */
resoudre(Places):-
	famille(Famille, Poids),
	places(Places),
	pose_contraintes(Places, Famille, Poids)/*,
	getVarList(Places, VarList),
	labeling(VarList)*/.


/**
 * Question 6.2
 */



/**
 * Question 6.3
 */



/**
 * Question 6.4
 */



/**
 * Tests
 */
/*
places(Places).
	Places = [](_315{-8 .. 8}, _333{-8 .. 8}, _351{-8 .. 8}, _369{-8 .. 8}, _387{-8 .. 8}, _405{-8 .. 8}, _423{-8 .. 8}, _441{-8 .. 8}, _459{-8 .. 8}, _477{-8 .. 8})
	Yes (0.00s cpu)

places(Places), nb_chaque_cote(Places, NbG, NbD).
	Places = [](_413{-8 .. 8}, _431{-8 .. 8}, _449{-8 .. 8}, _467{-8 .. 8}, _485{-8 .. 8}, _503{-8 .. 8}, _521{-8 .. 8}, _539{-8 .. 8}, _557{-8 .. 8}, _575{-8 .. 8})
	NbG = NbG{0 .. 10}
	NbD = NbD{0 .. 10}
	There are 38 delayed goals. Do you want to see them? (y/n)
	Yes (0.00s cpu)

places(Places), famille(_, Poids), moment_total(Places, Poids, MomentTotal).
	Places = [](_473{-8 .. 8}, _491{-8 .. 8}, _509{-8 .. 8}, _527{-8 .. 8}, _545{-8 .. 8}, _563{-8 .. 8}, _581{-8 .. 8}, _599{-8 .. 8}, _617{-8 .. 8}, _635{-8 .. 8})
	Poids = [](24, 39, 85, 60, 165, 6, 32, 123, 7, 14)
	MomentTotal = MomentTotal{-4440 .. 4440}
	There are 10 delayed goals. Do you want to see them? (y/n)
	Yes (0.00s cpu)

places(Places), extremites(Places, PlusAGauche, PlusADroite).
	Places = [](_413{-8 .. 8}, _431{-8 .. 8}, _449{-8 .. 8}, _467{-8 .. 8}, _485{-8 .. 8}, _503{-8 .. 8}, _521{-8 .. 8}, _539{-8 .. 8}, _557{-8 .. 8}, _575{-8 .. 8})
	PlusAGauche = PlusAGauche{0 .. 55}
	PlusADroite = PlusADroite{0 .. 55}
	There are 238 delayed goals. Do you want to see them? (y/n)
	Yes (0.01s cpu)

resoudre(Places).
	Places = [](-6, -5, -4, -8, 2, 5, 3, 6, -7, 1)
	Yes (618.47s cpu, solution 1, maybe more)
	Places = [](-6, -5, -1, 8, 5, 7, 3, -8, -7, 1)
	Yes (628.51s cpu, solution 2, maybe more)
	Places = [](-6, -5, 1, -8, -2, 6, 5, 7, -7, 4)
	Yes (630.48s cpu, solution 3, maybe more)
	...
*/