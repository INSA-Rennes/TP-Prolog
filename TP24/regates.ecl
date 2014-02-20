:- lib(ic).

/**
 * Question 4.1
 * getData(?TailleEquipes, ?NbEquipes, ?CapaBateaux, ?NbBateaux, ?NbConf)
 */
getData(TailleEquipes, NbEquipes, CapaBateaux, NbBateaux, 3):-
	TailleEquipes = [](5, 5, 2, 1),
	dim(TailleEquipes, NbEquipes),
	CapaBateaux = [](7, 6, 5),
	dim(CapaBateaux, NbBateaux).

/**
 * Question 4.2
 * defineVars(?T, +NbEquipes, +NbConf, +NbBateaux) 
 */
defineVars(T, NbEquipes, NbConf, NbBateaux):-
	dim(T, [NbEquipes, NbConf]),
	(foreachelem(Line, T), param(NbBateaux) do
		(foreachelem(Elem, Line), param(NbBateaux) do
			Elem #:: 1..NbBateaux
		)
	).

/**
 * Question 4.3
 * getVarList(+T, ?L)
 */
getVarList(T, L):-
	(foreachelem(Line, T), param(L) do
		(foreachelem(Elem, Line),
		foreach(Elem, L) do
			
		)
	).

/**
 * Question 4.4
 * solve(?T)
 */
solve(T):-
	getData(TailleEquipes, NbEquipes, CapaBateaux, NbBateaux, NbConf),
	defineVars(T, NbEquipes, NbConf, NbBateaux),

	%pasMemeBateaux(T, NbEquipes, NbConf),
	%pasMemePartenaires(T, NbEquipes, NbConf),
	%capaBateaux(T, TailleEquipes, NbEquipes, CapaBateaux, NbBateaux, NbConf),

	getVarList(T, L),
	labeling(L).

/**
 * Question 4.5
 * pasMemeBateaux(+T, +NbEquipes, +NbConf)
 * Pas deux fois la meme valeur sur une ligne.
 */
pasMemeBateaux(T, NbEquipes, NbConf):-
	(foreachelem(Line, T), param(T) do
		(for(I, 1, NbConf), param(T) do
			(for(J, I+1, NbConf), param(T) do
				T[I] #\= T[J]
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
				T[I][K] #= T[J][K] =>
				(for(X, K+1, NbConf), param(T, I, J, K) do
					T[I][X] #\= T[J][X]
				)
			)
		)
	).

/**
 * Question 4.7
 * capaBateaux(+T, +TailleEquipes, +NbEquipes, +CapaBateaux, +NbBateaux, +NbConf)
 */
capaBateaux(T, TailleEquipes, NbEquipes, CapaBateaux, NbBateaux, NbConf):-
	.

/**
 * Question 4.8
 * getVarListAlt(+T, ?L)
 */
getVarListAlt(T, L):-
	.