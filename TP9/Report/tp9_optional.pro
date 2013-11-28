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