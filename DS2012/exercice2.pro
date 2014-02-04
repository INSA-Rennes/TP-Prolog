lmono([], []).
lmono([Last], [[Last]]).
lmono([F|L], [[F], [First|Mono]|RestResult]):-
	lmono(L, [[First|Mono]|RestResult]),
	F > First.
lmono([F|L], [[F, First|Mono]|RestResult]):-
	lmono(L, [[First|Mono]|RestResult]),
	F < First.
	

rever(L, N):-
	rever(L, N, []).
rever([], Acc, Acc).
rever([First|Rest], L, Acc):-
	rever(Rest, L, [First|Acc]).


fusion([], M2, M2).
fusion(M1, [], M1).
fusion([F1|M1], [F2|M2], [F2|M]):-
	F1 > F2,
	fusion([F1|M1], M2, M).
fusion([F1|M1], [F2|M2], [F1|M]):-
	F1 < F2,
	fusion(M1, [F2|M2], M).


tri(L, Triee):-
	lmono(L, Lm),
	parcours_fusion(Lm, Triee).
parcours_fusion([], []).
parcours_fusion([First|Rest], Fusion):-
	parcours_fusion(Rest, FusionRest),
	fusion(First, FusionRest, Fusion).