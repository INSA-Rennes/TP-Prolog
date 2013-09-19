/**
 * QUESTION 1 : carte_test
 */
carte_test(c1, C1), est_carte(C1). %-> Yes
carte_test(c2, C2), est_carte(C2). %-> Yes
carte_test(ce1, CE1), est_carte(CE1). %-> No
carte_test(ce2, CE2), est_carte(CE2). %-> No


/**
 * QUESTION 2 : est_main
 */
main_test(main_triee_une_paire, M1), est_main(M1). %-> Yes
main_test(m2, M2), est_main(M2). %-> 3 solutions
	%main(carte(valet, trefle), carte(valet, coeur), carte(dame, carreau), carte(roi, coeur), carte(as, pique))
	%main(carte(valet, carreau), carte(valet, coeur), carte(dame, carreau), carte(roi, coeur), carte(as, pique))
	%main(carte(valet, pique), carte(valet, coeur), carte(dame, carreau), carte(roi, coeur), carte(as, pique))
main_test(merreur1, ME1), est_main(ME1).
main_test(merreur2, ME2), est_main(ME2).


/**
 * QUESTION 3 premiere version
 */
carte_test(c1, C1), carte_test(c2, C2), inf_carte(C1, C2). %-> Yes
carte_test(ce1, CE1), carte_test(ce2, CE2), inf_carte(CE1, CE2). %-> No


/**
 * QUESTION 3 deuxieme version
 */
carte_test(c1, C1), carte_test(c2, C2), inf_carte_b(C1, C2). %-> Yes
carte_test(ce1, CE1), carte_test(ce2, CE2), inf_carte_b(CE1, CE2). %-> No


/**
 * QUESTION 4
 */
main_test(main_triee_une_paire, M1), est_main_triee(M1). %-> Yes
main_test(main_pas_triee, M2), est_main_triee(M2). %-> No


/**
 * QUESTION 5
 */
main_test(main_triee_une_paire, M1), une_paire(M1). %-> Yes
main_test(main_triee_suite, M2), une_paire(M2). %-> No


/**
 * QUESTION 6
 */
main_test(main_triee_deux_paires, M1), deux_paires(M1). %-> Yes
main_test(main_triee_une_paire, M2), deux_paires(M2). %-> No


/**
 * QUESTION 7
 */
main_test(main_triee_deux_paires, M1), brelan(M1). %-> No
main_test(main_triee_brelan, M2), brelan(M2). %-> Yes


/**
 * QUESTION 8
 */
main_test(main_triee_deux_paires, M1), suite(M1). %-> No
main_test(main_triee_suite, M2), suite(M2). %-> Yes


/**
 * QUESTION 9
 */
main_test(main_triee_deux_paires, M1), full(M1). %-> No
main_test(main_triee_full, M2), full(M2). %-> Yes