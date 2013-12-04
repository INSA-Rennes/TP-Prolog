/**
 * TP10 Prolog
 * @author Paul CHAIGNON
 * @author Clément GAUTRAIS
 * @version Annee scolaire 2013/2014
 */

people([abby, bess, cody, dana]).


/**
 * Question 1.1
 * make_all_pairs(+Members, -Pairs)
 */
make_all_pairs([], []).
make_all_pairs([First|Members], [likes(First, First)|Pairs]):-
	make_pairs(First, Members, Pairs1),
	make_all_pairs(Members, Pairs2),
	concat(Pairs1, Pairs2, Pairs).

/**
 * make_pairs(+Member, +Members, -Pairs)
 */
make_pairs(Member, [], []).
make_pairs(Member, [First|Members], [likes(First, Member), likes(Member, First)|Pairs]):-
	make_pairs(Member, Members, Pairs).

/**
 * concat(+X, +Y, ?T)
 */
concat([], Y, Y).
concat([P|R], Y, [P|T]):-
	concat(R, Y, T).


/**
 * Question 1.2
 * sub_list(+List, -SubList)
 */
sub_list([], []).
sub_list([First|List], [First|SubList]):-
	sub_list(List, SubList).
sub_list([First|List], SubList):-
	sub_list(List, SubList).


/**
 * Question 1.3
 * propositionI(+World)
 */
/**
 * Dana likes Cody.
 */
proposition1(World):-
	member(likes(dana, cody), World).

/**
 * Bess does not like Dana.
 */
proposition2(World):-
	not(member(likes(bess, dana), World)).

/**
 * Cody does not like Abby.
 */
proposition3(World):-
	not(member(like(cody, abby), World)).

/**
 * Nobody likes someone who does not like him.
 */
proposition4(World):-
	not(proposition4(World)).
notproposition4(World):-
	member(likes(Nobody, Someone), World),
	not(member(likes(Someone, Nobody), World)).

/**
 * Abby likes everyone who likes Bess.
 */
proposition5(World):-
	not(notproposition5(World)).
notproposition5(World):-
	member(likes(X, bess), World),
	not(member(likes(abby, X), World)).

/**
 * Dana likes everyone Bess likes.
 */
proposition6(World):-
	not(notproposition6(World)).
notproposition6(World):-
	member(likes(bess, X), World),
	not(member(likes(dana, X), World)).

/**
 * Everybody likes somebody.
 */
proposition7(World):-
	not(notproposition7(World)).
notproposition7(World):-
	people(People),
	member(Somebody, People),
	not(member(likes(Somebody, _), World)).


/**
 * Question 1.4
 * possible_worlds(-Worlds)
 */
possible_worlds(PossibleWorlds):-
	people(People),
	make_all_pairs(People, Pairs),
	findall(World, sub_list(Pairs, World), PossibleWorlds),
	possible_worlds(Worlds, PossibleWorlds).

/**
 * possible_worlds(+Pairs, -PossibleWorld)
 */
possible_worlds([World|Worlds], [World|PossibleWorlds]):-
	propositions(World),
	possible_worlds(Worlds, PossibleWorlds).
possible_worlds([World|Worlds], PossibleWorlds):-
	not(propositions(World)),
	possible_worlds(Worlds, PossibleWorlds).

/**
 * propositions(+World)
 */
propositions(World):-
	proposition1(World).


/**
 * Questions 1.6 and 1.7
 */
test_possible_worlds(_):-
    possible_worlds(World),
    writeln(World),
    fail.