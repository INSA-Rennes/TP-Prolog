add(s(zero), s(s(zero)), Sum).
% Sum = s(s(s(zero)))
add(X, Y, s(s(zero))).
% X = zero
% Y = s(s(zero)) ?
% X = s(zero)
% Y = s(zero) ?
% X = s(s(zero))
% Y = zero ? 

sub(s(s(zero)), s(zero), Sub).
% Sub = s(zero)
sub(s(s(zero)), s(s(zero)), Sub).
% Sub = zero
sub(s(s(zero)), s(s(s(zero))), Sub).
% No

prod(s(s(zero)), s(s(s(zero))), Prod).
% Prod = s(s(s(s(s(s(zero))))))

factorial(s(s(s(zero))), F).
% F = s(s(s(s(s(s(zero))))))