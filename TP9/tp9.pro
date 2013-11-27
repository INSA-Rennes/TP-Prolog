/**
 * TP9 Prolog
 * @author Paul CHAIGNON
 * @author Clément GAUTRAIS
 * @version Annee scolaire 2013/2014
 */
/**
 * Question 1.1
 * combiner(+Buddies, -Pairs)
 */
combiner([], []).
combiner([First|Buddies], Pairs):-
	make_pairs(First, Buddies, Pairs1),
	combiner(Buddies, Pairs2),
	concat(Pairs1, Pairs2, Pairs).

/**
 * make_pairs(+Buddy, +Buddies, -Pairs)
 */
make_pairs(Buddy, [], []).
make_pairs(Buddy, [First|Buddies], [(Buddy, First)|Pairs]):-
	make_pairs(Buddy, Buddies, Pairs).

/**
 * concat(+X, +Y, ?T)
 */
concat([], Y, Y).
concat([P|R], Y, [P|T]):-
	concat(R, Y, T).


/**
 * Question 1.2
 * extraire(+AllPossiblePairs, +NbPairs, -Tp, -RemainingPairs)
 */
extraire(AllPossiblePairs, 0, [], AllPossiblePairs).
extraire([PossiblePair|AllPossiblePairs], NbPairs, [PossiblePair|Tp], NewRemainingPairs):-
	NbPairs > 0,
	NewNbPairs is NbPairs - 1,
	extraire(AllPossiblePairs, NewNbPairs, Tp, RemainingPairs),
	not(pair_in_array(PossiblePair, Tp)),
	delete_pair(RemainingPairs, PossiblePair, NewRemainingPairs).
extraire([PossiblePair|AllPossiblePairs], NbPairs, Tp, [PossiblePair|RemainingPairs]):-
	NbPairs > 0,
	extraire(AllPossiblePairs, NbPairs, Tp, RemainingPairs),
	pair_in_array(PossiblePair, Tp).

/**
 * delete_pair(+Pairs, +Pair, -PairsWithoutPair)
 */
delete_pair([], _, []).
delete_pair([Pair|Pairs], Pair, Pairs):-!.
delete_pair([FirstPair|Pairs], Pair, [FirstPair|PairsWithoutPair]):-
	delete_pair(Pairs, Pair, PairsWithoutPair).

/**
 * pair_in_array(+Pair, +Pairs)
 */
pair_in_array((A, B), [(C, D)|Pairs]):-
	(A == C ; B == D ; A == D ; B == C),
	!.
pair_in_array(Pair, [FirstPair|Pairs]):-
	pair_in_array(Pair, Pairs).


/**
 * Question 1.3
 * les_tps(+Buddies, -Tps)
 */
les_tps(Buddies, Tps):-
	combiner(Buddies, PossiblePairs),
	length(Buddies, NbBuddies),
	NbPairs is integer(NbBuddies / 2),
	findall(Tp, extraire(PossiblePairs, NbPairs, Tp, _), Tps).


/**
 * Tests
 */
/*
combiner([pluto, riri, fifi, loulou], Pairs).
	Pairs = [(pluto, riri), (pluto, fifi), (pluto, loulou),
				(riri, fifi), (riri, loulou), (fifi, loulou)]

combiner([pluto, riri, fifi, loulou], Pairs), extraire(Pairs, 2, Tp, R).
	Pairs = [(pluto, riri), (pluto, fifi), (pluto, loulou), (riri, fifi), (riri, loulou), (fifi, loulou)]
	Tp = [(pluto, riri), (fifi, loulou)]
	R = [(pluto, fifi), (pluto, loulou), (riri, fifi), (riri, loulou)]

	Pairs = [(pluto, riri), (pluto, fifi), (pluto, loulou), (riri, fifi), (riri, loulou), (fifi, loulou)]
	Tp = [(pluto, fifi), (riri, loulou)]
	R = [(pluto, riri), (pluto, loulou), (riri, fifi), (fifi, loulou)]

	Pairs = [(pluto, riri), (pluto, fifi), (pluto, loulou), (riri, fifi), (riri, loulou), (fifi, loulou)]
	Tp = [(pluto, loulou), (riri, fifi)]
	R = [(pluto, riri), (pluto, fifi), (riri, loulou), (fifi, loulou)]

les_tps([pluto, riri, fifi, loulou], Tps).
	Tps = [[(pluto, riri), (fifi, loulou)],
			[(pluto, fifi), (riri, loulou)],
			[(pluto, loulou), (riri, fifi)]]
			
les_tps([a,b,c,d,e,f], Tps).
	Tps = [[(a, b), (c, d), (e, f)], [(a, b), (c, e), (d, f)],
			[(a, b), (c, f), (d, e)], [(a, d), (b, e), (c, f)],
			[(a, d), (b, f), (c, e)], [(a, e), (b, f), (c, d)]]

*/