add([1], [0, 0, 1, 1], Sum).
% Sum = [0, 0, 1, 1]
add([1, 0, 0, 0], [0, 0, 1, 1], [1, 0, 1, 1]).
% Yes
add([1, 0, 0, 0], [0, 0, 1, 1], Sum).
% Sum = [1, 0, 1, 1]

sub([1, 1], [1, 0], Sub).
% Sub = [0, 1]
sub([1, 1, 0, 1], [1, 0, 0, 1], Sub).
% Sub = [0, 1, 0, 0]
sub([1, 1, 0, 1], [1, 0, 0, 1], [0, 1, 0, 0]). % Yes

prod([1, 1, 0, 1], [1, 0, 0, 1], Mul).
% Mul = [1, 1, 0, 0, 0, 1, 1]
prod([], [1, 1], Mul).
% Mul = []
prod([0, 1, 0, 1], [1, 1], Mul).
% Mul = [0, 1, 1, 1, 1]

int2bin(5, IntBin), factorial(IntBin, OutBin), bin2int(OutBin, Fact).
% Fact = 120
% IntBin = [1, 0, 1]
% OutBin = [0, 0, 0, 1, 1, 1, 1]
int2bin(10, IntBin), factorial(IntBin, OutBin), bin2int(OutBin, Fact).
% Fact = 3628800
% IntBin = [0, 1, 0, 1]
% OutBin = [0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 1]