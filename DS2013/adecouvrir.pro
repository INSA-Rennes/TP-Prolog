ckoi([], M, []).
ckoi([X|L], M, [X|N]):-
	etsa(X, M),
	!,
	ckoi(L, M, N).
ckoi([X|L], M, N):-
	ckoi(L, M, N).

etsa(X, []).
etsa(X, [X|M]):-
	!,
	fail.
etsa(X, [Y|M]):-
	etsa(X, M).