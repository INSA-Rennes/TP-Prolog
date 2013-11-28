make_lists([1,2,3,4,5,6,7,8], First, FirstList, SecondList).
	First = 1
	FirstList = [2, 3, 4]
	SecondFirst = [5, 6, 7, 8]
rotate([2, 3, 4], [5, 6, 7, 8], FirstList, SecondList).
	FirstList = [5, 2, 3]
	SecondList = [6, 7, 8, 4]
get_pairs([1,2,3,4], [5,6,7,8]).
	Pairs = [(1, 5), (2, 6), (3, 7), (4, 8)]
range(8, Buddies), les_tps(Buddies, Tps).
	Tps = [[(1, 5), (2, 6), (3, 7), (4, 8)], [(1, 6), (5, 7), (2, 8), (3, 4)],
			[(1, 7), (6, 8), (5, 4), (2, 3)], [(1, 8), (7, 4), (6, 3), (5, 2)],
			[(1, 4), (8, 3), (7, 2), (6, 5)], [(1, 3), (4, 2), (8, 5), (7, 6)],
			[(1, 2), (3, 5), (4, 6), (8, 7)]]
range(1000, Buddies), les_tps(Buddies, Tps).
	Tps = ... on vous passe les resultats... mais ca semble correct.