/**
 * TP5 - Arithmetique
 * @author Paul CHAIGNON
 * @author Clement GAUTRAIS
 * @version Annee scolaire 2013/2014
 */

/**
 * Question 1
 * evaluate(+, -)
 */
/**
 * Verifie que X est booleen.
 */
boolean(X):-
	X = t; X = f.

/**
 * Le resultat de l'evaluation doit etre un entier.
 */
evaluate_numbers(N1, M1, N2, M2):-
	evaluate(N1, N2),
	evaluate(M1, M2),
	number(N2),
	number(M2).

/**
 * Le resultat de l'evaluation doit etre booleen.
 */
evaluate_boolean(B1, B2):-
	evaluate(B1, B2),
	boolean(B2).

/**
 * Le resultat doit etre un booleen ou un nombre.
 */
evaluate(N, N):-
	number(N);
	boolean(N).

/**
 * Evaluation d'addition de deux entiers.
 */
evaluate(add(N1, M1), N):-
	evaluate_numbers(N1, M1, N2, M2),
	N is N2 + M2.

/**
 * Evaluation de soustractions de deux entiers.
 */
evaluate(sub(N1, M1), N):-
	evaluate_numbers(N1, M1, N2, M2),
	N is N2 - M2.

/**
 * Evaluation de produits de deux entiers.
 */
evaluate(prod(N1, M1), N):-
	evaluate_numbers(N1, M1, N2, M2),
	N is N2 * M2.

/**
 * Evaluation de tests d'egalite.
 */
evaluate(eq(N1, M1), Res):-
	evaluate_numbers(N1, M1, N2, M2),
	(
		N2 = M2, Res = t
		;
		N2 \= M2, Res = f
	).

evaluate(fun(X, Body), fun(X, Body)).

/**
 * Evaluation de conditionnelles.
 */
evaluate(if(Cond1, Then1, Else1), Res):-
	evaluate_boolean(Cond1, Cond2),
	(
		Cond2 = t, evaluate(Then1, Res)
		;
		Cond2 \= t, evaluate(Else1, Res)
	).

/**
 * Evaluation de l'application d'une fonction a une expression.
 */
evaluate(apply(Expr, Param), Res):-
	fresh_variables(Expr, ExprFreshed),
	evaluate(ExprFreshed, fun(X, Body)),
	X = Param,
	evaluate(Body, Res).


/**
 * Question 2
 * assoc(+, +, -)
 */
assoc(X, [(X, Y)], Y):-!.
assoc(X, [(In, Out)|Assoc], Res):-
	X == In,
	Res = Out.
assoc(X, [(In, Out)|Assoc], Res):-
	X \== In,
	assoc(X, Assoc, Res).

/**
 * fresh_variables(+, -)
 */
fresh_variables(Expr, Res):-
	fresh_variables(Expr, [], Res).

fresh_variables(X, Assoc, Y):-
	var(X),
	!,
	assoc(X, Assoc, Y).

fresh_variables(add(X1, Y1), Assoc, add(X2, Y2)):-
	fresh_variables(X1, Assoc, X2),
	fresh_variables(Y1, Assoc, Y2).

fresh_variables(prod(X1, Y1), Assoc, prod(X2, Y2)):-
	fresh_variables(X1, Assoc, X2),
	fresh_variables(Y1, Assoc, Y2).

fresh_variables(sub(X1, Y1), Assoc, sub(X2, Y2)):-
	fresh_variables(X1, Assoc, X2),
	fresh_variables(Y1, Assoc, Y2).

fresh_variables(eq(X1, Y1), Assoc, eq(X2, Y2)):-
fresh_variables(X1, Assoc, X2),
fresh_variables(Y1, Assoc, Y2).

fresh_variables(if(Cond1, X1, Y1), Assoc, if(Cond2, X2, Y2)):-
	fresh_variables(Cond1, Assoc, Cond2),
	fresh_variables(X1, Assoc, X2),
	fresh_variables(Y1, Assoc, Y2).

fresh_variables(Number, _, Number):-
	number(Number).

fresh_variables(fun(X, Body1), Assoc, fun(Y, Body2)):-
	fresh_variables(Body1, [(X, Y) | Assoc], Body2).

fresh_variables(apply(Fun1, Param1), Assoc, apply(Fun2, Param2)):-
	fresh_variables(Fun1, Assoc, Fun2),
	fresh_variables(Param1, Assoc, Param2).


/**
 * Tests
 */
fresh_variables(fun(X, fun(Y, add(Y, prod(X, X)))), Fresh).
% Fresh = fun(A,fun(B,add(B,prod(A,A))))
F = fun(X, prod(X, X)), evaluate(apply(F, 1), Res1), evaluate(apply(F, 2), Res2).
% Res1 = 1
% Res2 = 4
Fun = fun(N, fun(F, if(eq(N, 0), 1, prod(N, apply(apply(F, sub(N, 1)), F))))), Factorial = fun(N, apply(apply(Fun, N), Fun)), evaluate(apply(Factorial, 19), Res).
% Res = 121645100408832000