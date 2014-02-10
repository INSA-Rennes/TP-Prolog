:- lib(ic).

/**
 * Question 3.1
 * taches(?Taches)
 */
taches(Taches):-
	Taches = [](tache(3, [],      m1, _),
				tache(8, [],      m1, _),
				tache(8, [4, 5],  m1, _),
				tache(6, [],      m2, _),
				tache(3, [1],     m2, _),
				tache(4, [1, 7],  m1, _),
				tache(8, [3, 5],  m1, _),
				tache(6, [4],     m2, _),
				tache(6, [6, 7],  m2, _),
				tache(6, [9, 12], m2, _),
				tache(3, [1],     m2, _),
				tache(6, [7, 8],  m2, _)).

/**
 * Question 3.2
 * 
 */


/**
 * Question 3.3
 * domaines(+Taches, ?Fin)
 */
domaines(Taches, Fin):-
	(foreach(tache(_, _, _, Debut), Taches),
	param(Fin)
	do
		Debut #:: 0..Fin
	).

/**
 * Question 3.4
 * getVarList(+taches, ?Fin, ?List)
 */
getVarList(Taches, Fin, [Fin|List]):-
	(foreach(tache(Duree, Precedences, Machine, Debut), Taches),
	fromto([], In, Out, List)
	do
		Out = [Duree, Precedences, Machine, Debut|In]
	).

/**
 * Question 3.5
 * solve(?Taches, ?Fin)
 */
solve(Taches, Fin):-
	taches(Taches),
	domaines(Taches, Fin),
	%precedences(Taches),
	%conflits(Taches),
	getVarList(Taches, Fin, List),
	labeling(List).

/**
 * Question 3.6
 * precedences(+Taches)
 */
precedences(Taches):-
	(foreach(tache(_, Precedences, _, Debut), Taches),
	param(Taches)
	do
		(foreach(Precedence, Precedences),
		param(Debut), param(Taches)
		do
			Debut #>= Taches[Precedence]
		)
	).

/**
 * Question 3.7
 * conflits(+Taches)
 */
conflits(Taches):-
	(foreach(tache(Duree1, _, Machine1, Debut1), Taches),
	param(Taches), param(Machine1)
	do
		(foreach(tache(Duree2, _, Machine2, Debut2), Taches),
		param(Duree1), param(Debut1), param(Machine1)
		do
			(Machine1 == Machine2) => (Debut2#>=Debut1+Duree1 or Debut2#<=Debut1-Duree2)
		)
	).