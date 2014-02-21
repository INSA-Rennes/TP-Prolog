:- lib(ic).

/**
 * Question 4.1
 * getData(?TailleEquipes, ?NbEquipes, ?CapaBateaux, ?NbBateaux, ?NbConf)
 */
getData(TailleEquipes, NbEquipes, CapaBateaux, NbBateaux, 7):-
	%TailleEquipes = [](5, 5, 2, 1),
	TailleEquipes = [](7, 6, 5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
	dim(TailleEquipes, [NbEquipes]),
	%CapaBateaux = [](7, 6, 5),
	CapaBateaux = [](10, 10, 9, 8, 8, 8, 8, 8, 8, 7, 6, 4, 4),
	dim(CapaBateaux, [NbBateaux]).

/**
 * Question 4.2
 * defineVars(?T, +NbEquipes, +NbConf, +NbBateaux) 
 */
defineVars(T, NbEquipes, NbConf, NbBateaux):-
	dim(T, [NbEquipes, NbConf]),
	T #:: 1..NbBateaux.

/**
 * Question 4.3
 * getVarList(+T, ?L)
 */
getVarList(T, L):-
	dim(T, [NbEquipes, NbConf]),
	(for(J, 0, NbConf-1), fromto([], In, Out, L), param(T, NbEquipes, NbConf) do
		(for(I, 1, NbEquipes), foreach(Elem, SubL), param(T, J, NbConf) do
			JInv is NbConf - J,
			Elem is T[I, JInv]
		),
		append(SubL, In, Out)
	).

/**
 * Question 4.4
 * solve(?T)
 */
solve(T):-
	getData(TailleEquipes, NbEquipes, CapaBateaux, NbBateaux, NbConf),
	defineVars(T, NbEquipes, NbConf, NbBateaux),

	pasMemeBateaux(T, NbEquipes, NbConf),
	pasMemePartenaires(T, NbEquipes, NbConf),
	capaBateaux(T, TailleEquipes, NbEquipes, CapaBateaux, NbBateaux, NbConf),

	getVarListAlt(T, L),
	labeling(L).

/**
 * Question 4.5
 * pasMemeBateaux(+T, +NbEquipes, +NbConf)
 * Pas deux fois la meme valeur sur une ligne.
 */
pasMemeBateaux(T, NbEquipes, NbConf):-
	(for(K, 1, NbEquipes), param(T, NbConf) do
		(for(I, 1, NbConf), param(T, NbConf, K) do
			(for(J, I+1, NbConf), param(T, I, K) do
				T[K, I] #\= T[K, J]
			)
		)
	).

/**
 * Question 4.6
 * pasMemePartenaires(+T, +NbEquipes, +NbConf)
 * T[i][k] == T[j][k] => T[i][x] != T[j][x] pour tout x \ x != k.
 */
pasMemePartenaires(T, NbEquipes, NbConf):-
	(for(I, 1, NbEquipes), param(T, NbEquipes, NbConf) do
		(for(J, I+1, NbEquipes), param(T, NbConf, I) do
			(for(K, 1, NbConf), param(T, NbConf, I, J) do
				(for(X, K+1, NbConf), param(T, I, J, K) do
					(T[I, K] #= T[J, K]) => (T[I, X] #\= T[J, X])
				)
			)
		)
	).

/**
 * Question 4.7
 * capaBateaux(+T, +TailleEquipes, +NbEquipes, +CapaBateaux, +NbBateaux, +NbConf)
 */
capaBateaux(T, TailleEquipes, NbEquipes, CapaBateaux, NbBateaux, NbConf):-
	(for(Conf, 1, NbConf), param(T, CapaBateaux, TailleEquipes, NbBateaux, NbEquipes) do
		(for(Bateau, 1, NbBateaux), param(T, CapaBateaux, TailleEquipes, Conf, NbEquipes) do
			(for(Equipe, 1, NbEquipes), fromto(0, TailleTotale, NewTailleTotale, TailleFinale),
			param(T, TailleEquipes, Bateau, Conf) do
				NewTailleTotale #= TailleTotale + (T[Equipe, Conf] #= Bateau) * TailleEquipes[Equipe]
			),
			CapaBateaux[Bateau] #>= TailleFinale
		)
	).

/**
 * Question 4.8
 * getVarListAlt(+T, ?List)
 * Alterne une petite et une grosse equipe par rapport a getVarList.
 */
getVarListAlt(T, List):-
	dim(T, [NbEquipes, NbConf]),
	(for(J, 0, NbConf-1), fromto([], In, Out, List), param(T, NbEquipes, NbConf) do
		MoitieNbEquipes is div(NbEquipes, 2),
		(for(I, 1, MoitieNbEquipes), fromto([], SubIn, SubOut, SubList), param(MoitieNbEquipes, T, J, NbConf, NbEquipes) do
			JInv is NbConf - J,
			Elem1 is T[MoitieNbEquipes-I+1, JInv],
			Elem2 is T[NbEquipes-(MoitieNbEquipes-I+1)+1, JInv],
			SubOut = [Elem1, Elem2|SubIn]
		),
		append(SubList, In, Out)
	).