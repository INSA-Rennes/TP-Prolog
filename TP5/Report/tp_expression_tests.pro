fresh_variables(fun(X, fun(Y, add(Y, prod(X, X)))), Fresh).
% Fresh = fun(A,fun(B,add(B,prod(A,A))))
F = fun(X, prod(X, X)), evaluate(apply(F, 1), Res1), evaluate(apply(F, 2), Res2).
% Res1 = 1
% Res2 = 4
Fun = fun(N, fun(F, if(eq(N, 0), 1, prod(N, apply(apply(F, sub(N, 1)), F))))), Factorial = fun(N, apply(apply(Fun, N), Fun)), evaluate(apply(Factorial, 19), Res).
% Res = 121645100408832000