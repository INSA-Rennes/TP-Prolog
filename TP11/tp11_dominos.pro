/**
* TP11 Prolog
* @author Paul CHAIGNON
* @author Clément GAUTRAIS
* @version Annee scolaire 2013/2014
*/

stones([stone(2, 2), stone(4, 6), stone(1, 2), stone(2, 4), stone(6, 2)]).
% stones([stone(2, 2), stone(4, 6), stone(1, 2), stone(2, 4), stone(6, 2), stone(5, 1), stone(5, 5), stone(4, 5), stone(2, 3), stone(3, 6)]).
% stones([stone(6, 6), stone(6, 5), stone(6, 4), stone(6, 3), stone(6, 2), stone(6, 1), stone(6, 0),
%         stone(5, 5), stone(5, 4), stone(5, 3), stone(5, 2), stone(5, 1), stone(5, 0),
%         stone(4, 4), stone(4, 3), stone(4, 2), stone(4, 1), stone(4, 0),
%         stone(3, 3), stone(3, 2), stone(3, 1), stone(3, 0),
%         stone(2, 2), stone(2, 1), stone(2, 0),
%         stone(1, 1), stone(1, 0),
%         stone(0, 0)]).

chains_to_list_of_list([], []).
chains_to_list_of_list([chain(L, [double])|Rest], LL):-
    length(L, 1),
    chains_to_list_of_list(Rest, LL).
chains_to_list_of_list([chain(L1, L2)|Rest], [Stones|LL]):-
    (
        length(L1, N), N > 1
        ;
        L2 \== [double]
    ),
    reverse(L2, RevL2),
    append(L1, RevL2, L),
    create_stones(L, Stones),
    chains_to_list_of_list(Rest, LL).

create_stones([_], []).
create_stones([A, B|Rest], [stone(A, B)|Stones]):-
    create_stones([B|Rest], Stones).

print_chains(Chains):-
    chains_to_list_of_list(Chains, LL),
    (
        foreach(Chain, LL) do 
        writeln(Chain)
    ).


/**
 * Question 1.1
 * choose(+List, -Elem, -NewList)
 */
choose([Elem|List], Elem, List).
choose([First|List], Elem, [First|NewList]):-
    choose(List, Elem, NewList).


/**
 * Question 1.2
 * domino(-Chains)
 */
domino(Chains):-
    stones(Stones),
    chains(Stones, [], Chains).

/**
 * chains(+Stones, +Partial, -Chains)
 */
chains([], Chains, Chains).
chains([Stone|Stones], Partial, Chains):-
    add_stone(Partial, Stone, NewPartial),
    chains(Stones, NewPartial, Chains).
chains([Stone|Stones], Partial, Chains):-
    chains(Stones, Partial, NewPartial),
    add_stone(NewPartial, Stone, Chains).

/**
 * add_stone(+Chains, +Stone, -NewChains)
 */
add_stone([], stone(X, Y), [chain([X], [Y])]).
add_stone([chain([X|RestX], [FirstY|RestY])|Chains], stone(X, Y), [chain([Y, X|RestX], [FirstY|RestY])|Chains]).
add_stone([chain([FirstX|RestX], [Y|RestY])|Chains], stone(X, Y), [chain([FirstX|RestX], [X, Y|RestY])|Chains]).
add_stone([chain([Y|RestX], [FirstY|RestY])|Chains], stone(X, Y), [chain([X, Y|RestX], [FirstY|RestY])|Chains]).
add_stone([chain([FirstX|RestX], [X|RestY])|Chains], stone(X, Y), [chain([FirstX|RestX], [Y, X|RestY])|Chains]).
add_stone([chain([X|RestX], [FirstY|RestY])|Chains], stone(X, X), [chain([X], [double]), chain([X, X|RestX], [FirstY|RestY])|Chains]).
add_stone([chain([FirstX|RestX], [Y|RestY])|Chains], stone(Y, Y), [chain([Y], [double]), chain([FirstX|RestX], [Y, Y|RestY])|Chains]).
add_stone([First|Chains], Stone, [First|NewChains]):-
    add_stone(Chains, Stone, NewChains).


/**
 * Tests
 */
/*
choose([1, 2, 3], Elt, Rest).
    Elt = 1
    Rest = [2, 3]
    Elt = 2
    Rest = [1, 3]
    Elt = 3
    Rest = [1, 2]

add_stone([chain([2], [4])], stone(2, 1), Chains).
    Chains = [chain([1, 2], [4])]
add_stone([chain([3], [4]), chain([2], [double])], stone(2, 1), Chains).
    Chains = [chain([3], [4]), chain([1, 2], [double])]
add_stone([chain([2], [4])], stone(2, 2), Chains).
    Chains = [chain([2, 2], [4]), chain([2], [double])]
    Chains = [chain([2, 2], [4])]
*/