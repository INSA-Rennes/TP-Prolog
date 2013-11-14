
%%%%%%%%%%% First part

copy_prog(program(
		start, 
		[stop], 
		[delta(start, ' ', ' ', right, stop),
			delta(start, 1, ' ', right, s2),
			delta(s2, 1, 1, right, s2),
			delta(s2, ' ', ' ', right, s3),
			delta(s3, 1, 1, right, s3),
			delta(s3, ' ', 1, left, s4),
			delta(s4, 1, 1, left, s4),
			delta(s4, ' ', ' ', left, s5),
			delta(s5, 1, 1, left, s5),
			delta(s5, ' ', 1, right, start)
		]
	)
).

initial_state(program(InitialState, _, _), InitialState).

final_states(program(_, FinalStates, _), FinalStates).

transitions(program(_, _, Deltas), Deltas).


%write to meta post format
%compile result with: 
% mpost filename
% epstopdf filename.1
dump_to_mpost(Filename, Dump) :-
open(Filename, write, Stream),
write_header(Stream),
write_dump(0, Dump, Stream),
write_end(Stream),
close(Stream).

write_header(Stream) :-
write(Stream, 'prologues := 1;\n'),
write(Stream, 'input turing;\n'),
write(Stream, 'beginfig(1)\n').

write_end(Stream) :-
write(Stream, 'endfig;\n'),
write(Stream, 'end').

write_dump(_, [], _).
write_dump(Y, [(State, Tape) | Tapes], Stream) :-
write(Stream, 'tape(0, '),
write(Stream, Y),
write(Stream, 'cm, 1cm, \"'),
write(Stream, State),
write(Stream, '\", '),
write_tape(Tape, Stream),
write(Stream, ');\n'),
Y1 is Y - 2,
write_dump(Y1, Tapes, Stream).

write_tape(tape(Left, Right), Stream) :-
length(Left, N),
write(Stream, '\"'),
append(Left, Right, L),
(param(Stream), foreach(X, L) do 
write(Stream, X)        
),
write(Stream, '\", '),
write(Stream, N),
write('\n').

%%%%%%%%%%% Optional part        

%make_pairs(+, -): 'a list * ('a * 'a) list
make_pairs([], _, []).
make_pairs([X | L], L2, Res) :-
make_pairs_aux(X, L2, Pairs),
make_pairs(L, L2, RemainingPairs),
append(Pairs, RemainingPairs, Res).

%make_pairs_aux(+, +, -): 'a * 'a list * ('a * 'a) list
make_pairs_aux(_, [], []).
make_pairs_aux(X, [Y | Ys], [(X, Y) | Zs]) :-
make_pairs_aux(X, Ys, Zs).

complete(S1, Sym, Symbols, Directions, States, Res) :-
member(Sym1, Symbols),
member(Dir, Directions),
member(S2, States),
Res = delta(S1, Sym, Sym1, Dir, S2).

complete_list([], _, _, _, []).
complete_list([(S, Sym) | Pairs], Symbols, Directions, States, [Delta | Deltas]) :-
complete(S, Sym, Symbols, Directions, States, Delta),
complete_list(Pairs, Symbols, Directions, States, Deltas).


next(program(D,F,R), State0, Symbol0, Symbol1, Dir, State1):-
match_next_step(R, State0, Symbol0, Symbol1, Dir, State1).

match_next_step([delta(State0, Symbol0, Symbol1, Dir, State1)|L], State0, Symbol0, Symbol1, Dir, State1).

match_next_step([delta(StateInit, SymbolTete, _, _, _)|L], State0, Symbol0, Symbol1, Dir, State1):-
match_next_step(L, State0, Symbol0, Symbol1, Dir, State1).

/*

next(program(
start, 
[stop], 
[delta(start, ' ', ' ', right, stop),
delta(start, 1, ' ', right, s2),
delta(s2, 1, 1, right, s2),
delta(s2, ' ', ' ', right, s3),
delta(s3, 1, 1, right, s3),
delta(s3, ' ', 1, left, s4),
delta(s4, 1, 1, left, s4),
delta(s4, ' ', ' ', left, s5),
delta(s5, 1, 1, left, s5),
delta(s5, ' ', 1, right, start)
]
), start, 1, X, Y, Z).
X=' '
Y=right
Z=s2
*/
last_elem([X], X).
last_elem([P|L], D):-
last_elem(L,D).

copy_except_last([X], []).
copy_except_last([P|L], [P|D]):-
copy_except_last(L, D).

insert_last(D, [], [D]).
insert_last(D, [P|L], [P|R]):-
insert_last(D, L, R).

add_blank_left([X], [' ',X]).
add_blank_left([X, Y|L], [X, Y|L]).


update_tape(tape(Left, [Head|Right]), Symbol, left, tape(NewLeft, [NewHead,Symbol|Right])):-
last_elem(Left, NewHead),
add_blank_left(Left, Left2),
copy_except_last(Left2, NewLeft).

update_tape(tape(Left, [Head, NewHead|Right]), Symbol, right, tape(NewLeft, [NewHead|Right])):-
insert_last(Symbol, Left, NewLeft).

update_tape(tape(Left, [Head]), Symbol, right, tape(NewLeft, [' '])):-
insert_last(Symbol, Left, NewLeft).

/*
update_tape(tape([' '], [1, ' ']), ' ', right, UpdatedTape).
UpdatedTape = tape([' ', ' '], [' ']).
*/

	

/**
 * membre(?A, +X)
 */
membre(A, [A|R]).
membre(A, [X|R]):-
	membre(A, R).

/**
 * concat(+X, +Y, ?T)
 */
concat([], Y, Y).
concat([P|R], Y, [P|T]):-
	concat(R, Y, T).

/**
 * run_turing_machine(+Program, +Input, -Output, -FinalState)
 */
run_turing_machine(program(Depart, Finals, Trans), BandDroite, Output, FinalState, Filename):-
	run_turing_machine_tape(program(Depart, Finals, Trans), Depart, tape([' '], BandDroite), tape(Left, Right), FinalState, Dump),
	concat(Left, Right, Output),
	dump_to_mpost(Filename, Dump).

run_turing_machine_tape(program(Depart, Finals, Trans), EtatCourant, Input, Input, EtatCourant, [(EtatCourant, Input)]):-
	membre(EtatCourant, Finals).

run_turing_machine_tape(Prog, CurrentState, tape(Left, [Tete|Right]), Output, FinalState, [(CurrentState, tape(Left, [Tete|Right]))|Dump]):-
	next(Prog, CurrentState, Tete, NewTete, Direct, NextState),
	update_tape(tape(Left, [Tete|Right]), NewTete, Direct, UpdatedTape),
	run_turing_machine_tape(Prog, NextState, UpdatedTape, Output, FinalState, Dump).

/*
copy_prog(Prog), run_turing_machine(Prog, [1], Output, FinalState).
*/