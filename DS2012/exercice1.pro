lconc(L, Lcs):-
	findall(Lc, lconc0(L, Lc), Lcs).
lconc0(L, c([], L)).
lconc0([First|Rest], c([First|A], B)):-
	lconc0(Rest, c(A, B)).

