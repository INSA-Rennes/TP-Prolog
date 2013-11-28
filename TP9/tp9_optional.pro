/**
 * TP9 Prolog
 * @author Paul CHAIGNON
 * @author Clément GAUTRAIS
 * @version Annee scolaire 2013/2014
 */
/**
 * Part 2.1
 * make_lists(+Buddies, -First, -FirstList, -SecondList)
 */
make_lists(Buddies, FirstBuddy, FirstList, SecondList):-
	length(Buddies, NbBuddies),
	LengthFirstList is integer(NbBuddies / 2),
	split_buddies(Buddies, LengthFirstList, [FirstBuddy|FirstList], SecondList).

/**
 * split_buddies(+Buddies, +LengthFirstList, -FirstList, -SecondList)
 */
split_buddies(Buddies, 0, [], Buddies).
split_buddies([FirstBuddy|Buddies], LengthFirstList, [FirstBuddy|FirstList], SecondList):-
	NewLengthFirstList is LengthFirstList - 1,
	split_buddies(Buddies, NewLengthFirstList, FirstList, SecondList).


/**
 * Part 2.2
 * rotate(+FirstList, +SecondList, -NewFirstList, -NewSecondList)
 */
rotate(FirstList, [FirstSecondList|SecondList], [FirstSecondList|NewFirstList], NewSecondList):-
	popLast(FirstList, LastFirstList, NewFirstList),
	putLast(SecondList, LastFirstList, NewSecondList).

/**
 * popLast(+List, -Last, -NewList)
 */
popLast([Last], Last, []):-!.
popLast([First|List], Last, [First|NewList]):-
	popLast(List, Last, NewList).

/**
 * putLast(+List, +Last, -NewList)
 */
putLast([], Last, [Last]):-!.
putLast([First|List], Last, [First|NewList]):-
	putLast(List, Last, NewList).


/**
 * Part 2.3
 * get_pairs(+FirstList, +SecondList, -Pairs)
 */
get_pairs([], [], []).
get_pairs([FirstOfFirstList|FirstList], [FirstOfSecondList|SecondList], [(FirstOfFirstList, FirstOfSecondList)|Pairs]):-
	get_pairs(FirstList, SecondList, Pairs).


/**
 * Part 2.4
 * les_tps(+Buddies, -Tps)
 */
les_tps(Buddies, Tps):-
	NbRotations is length(Buddies) - 1,
	make_lists(Buddies, FirstBuddy, FirstList, SecondList),
	les_tps(FirstBuddy, FirstList, SecondList, NbRotations, Tps).

/**
 * les_tps(+FirstBuddy, +FirstList, +SecondList, +NbRotations, -Tps)
 */
les_tps(_, _, _, 0, []):-!.
les_tps(FirstBuddy, FirstList, SecondList, NbRotations, [Pairs|Tps]):-
	NewNbRotations is NbRotations - 1,
	get_pairs([FirstBuddy|FirstList], SecondList, Pairs),
	rotate(FirstList, SecondList, NewFirstList, NewSecondList),
	les_tps(FirstBuddy, NewFirstList, NewSecondList, NewNbRotations, Tps).

/**
 * range(+I, +J, -List)
 * range(+Nb, -List)
 */
range(Nb, List):-
	range(1, Nb, List).
range(I, J, []):-
	I > J.
range(I, J, [I|Tail]):-
	I =< J,
	I1 is I + 1,
	range(I1, J, Tail).


/**
 * Tests
 */
/*
make_lists([1,2,3,4,5,6,7,8], First, FirstList, SecondList).
	First = 1
	FirstList = [2, 3, 4]
	SecondFirst = [5, 6, 7, 8]
rotate([2, 3, 4], [5, 6, 7, 8], FirstList, SecondList).
	FirstList = [5, 2, 3]
	SecondList = [6, 7, 8, 4]
get_pairs([1,2,3,4], [5,6,7,8]).
	Pairs = [(1, 5), (2, 6), (3, 7), (4, 8)]
range(8, Buddies), les_tps(Buddies, Tps).
	Tps = [[(1, 5), (2, 6), (3, 7), (4, 8)], [(1, 6), (5, 7), (2, 8), (3, 4)],
			[(1, 7), (6, 8), (5, 4), (2, 3)], [(1, 8), (7, 4), (6, 3), (5, 2)],
			[(1, 4), (8, 3), (7, 2), (6, 5)], [(1, 3), (4, 2), (8, 5), (7, 6)],
			[(1, 2), (3, 5), (4, 6), (8, 7)]]
range(1000, Buddies), les_tps(Buddies, Tps).
	Tps = ... on vous passe les resultats... mais ça a l'air correct.
*/