copy_prog(Prog), next(Prog, start, 1, X, Y, Z).
	X = ' '
	Y = right
	Z = s2

update_tape(tape([' '], [1, ' ']), ' ', right, UpdatedTape).
	UpdatedTape = tape([' ', ' '], [' ']).

copy_prog(Prog), run_turing_machine(Prog, [1], Output, FinalState).