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
 * Question 2
 * assoc(+, +, -)
 */
fresh_variables(Number, _, Number):-
	number(Number),
	boolean(Number).

assoc(X, [(X, Y)], Y):-!.
assoc(X, [(In, Out)|Assoc], Res):-
	X == In,
	Res = Out.
assoc(X, [(In, Out)|Assoc], Res):-
	X \== In,
	assoc(X, Assoc, Res).


/**
 * Question 3
 * Evaluation de l'application d'une fonction a une expression.
 */
evaluate(apply(Expr, Param), Res):-
	fresh_variables(Expr, ExprFreshed),
	evaluate(ExprFreshed, fun(X, Body)),
	X = Param,
	evaluate(Body, Res).

