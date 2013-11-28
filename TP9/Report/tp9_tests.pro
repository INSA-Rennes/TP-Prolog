combiner([pluto, riri, fifi, loulou], Pairs).
	Pairs = [(pluto, riri), (pluto, fifi), (pluto, loulou),
				(riri, fifi), (riri, loulou), (fifi, loulou)]

combiner([pluto, riri, fifi, loulou], Pairs), extraire(Pairs, 2, Tp, R).
	Pairs = [(pluto, riri), (pluto, fifi), (pluto, loulou), (riri, fifi), (riri, loulou), (fifi, loulou)]
	Tp = [(pluto, riri), (fifi, loulou)]
	R = [(pluto, fifi), (pluto, loulou), (riri, fifi), (riri, loulou)]

	Pairs = [(pluto, riri), (pluto, fifi), (pluto, loulou), (riri, fifi), (riri, loulou), (fifi, loulou)]
	Tp = [(pluto, fifi), (riri, loulou)]
	R = [(pluto, riri), (pluto, loulou), (riri, fifi), (fifi, loulou)]

	Pairs = [(pluto, riri), (pluto, fifi), (pluto, loulou), (riri, fifi), (riri, loulou), (fifi, loulou)]
	Tp = [(pluto, loulou), (riri, fifi)]
	R = [(pluto, riri), (pluto, fifi), (riri, loulou), (fifi, loulou)]

les_tps([pluto, riri, fifi, loulou], Tps).
	Tps = [[(pluto, riri), (fifi, loulou)],
			[(pluto, fifi), (riri, loulou)],
			[(pluto, loulou), (riri, fifi)]]
			
les_tps([a,b,c,d,e,f], Tps).
	Tps = [[(a, b), (c, d), (e, f)], [(a, b), (c, e), (d, f)],
			[(a, b), (c, f), (d, e)], [(a, d), (b, e), (c, f)],
			[(a, d), (b, f), (c, e)], [(a, e), (b, f), (c, d)]]