membre(2, [1,2,3,4]). % Yes
membre(5, [1,2,3,4]). % No

compte(1, [1,2,3,4], X). % X = 1
compte(5, [1,2,3,4], X). % X = 0
compte(1, [1,2,1,4], X). % X = 2
compte(1, [1,2,1,4], 2). % Yes

renverser([1,2,3,4], Y). % Y = [4,3,2,1]
renverser([1,2,3,4], [4,3,2,1]). % Yes

palind([1,2,3,4]). % No
palind([4,3,3,4]). % Yes
palind([4]). % Yes

nieme(0, [1,2,3,4], A). % A = -1
nieme(3, [1,2,3,4], A). % A = 2

hors_de(0, [1,2,3,4]). % Yes
hors_de(3, [1,2,3,4]). % No

tous_diff([1,2,3,4]). % Yes
tous_diff([1,2,4,4]). % No
tous_diff([]). % Yes

conc3([1,2], [3,4], [5,6], T). % T = [1,2,3,4,5,6]
conc3([1,2], [3,4], [5,6], [1,2,3,4,5,6]). % Yes
conc3([1,2], [3,4], [5,6], [1,2,3,4,5]). % No
conc3([], [], [], []). % Yes

debute_par([1,2,3], []). % Yes
debute_par([1,2,3], [1]). % Yes
debute_par([1,2,3], [1,2,3]). % Yes
debute_par([1,2,3], [2,3]). % No

sous_liste([1,2,3], []). % Yes
sous_liste([1,2,3], [1]). % Yes
sous_liste([1,2,3], [2,3]). % Yes
sous_liste([1,2,3], [1,3]). % No

elim([1,2,3], Y). % Y = [1,2,3]
elim([3,1,2,3,3], Y). % Y = [1,2,3]
elim([], Y). % Y = []

tri([1,2,3,4], Y). % Y = [1,2,3,4]
tri([4,3,2,1], Y). % Y = [1,2,3,4]
tri([3,1,2,4], Y). % Y = [1,2,3,4]

inclus([], [1,2,3,4]). % Yes
inclus([1,2,3,4], [1,2,3,4]). % Yes
inclus([1,2,4], [1,2,3,4]). % Yes
inclus([1,2,5], [1,2,3,4]). % No

non_inclus([1,2,3,4], []). % Yes
non_inclus([5], [1,2,3,4]). % Yes
non_inclus([], [1,2,3,4]). % No
non_inclus([2,3], [1,2,3,4]). % No

union_ens([1,2,3], [2,3,4], [1,2,3,4]). % Yes
union_ens([2,3,1], [4,2,3], [3,2,1,4]). % Yes
union_ens([2,3,1], [4,2,3], [3,2,1]). % No
union_ens([1,2,3], [2,3,4], Z). % Z = [1,2,3,4]
union_ens([2,3,1], [4,2,3], Z). % Z = [1,2,3,4]

inter_ens([1,2,3], [2,3,4], [2,3]). % Yes
inter_ens([2,3,1], [4,2,3], [3,2]). % Yes
inter_ens([2,3,1], [4,2,3], [3,2,1]). % No
inter_ens([1,2,3], [2,3,4], Z). % Z = [2,3]
inter_ens([2,3,1], [4,2,3], Z). % Z = [2,3]

diff_ens([1,5,3], [5,4,7], Z). % Z = [1,3]
diff_ens([1,5,3], [], Z). % Z = [5,1,3]
diff_ens([1,5,3], [5,4,7], [3,1]). % Yes
diff_ens([1,5,3], [5,4,7], [1,3]). % Yes
diff_ens([1,5,3], [5,4,7], [1,3,5]). % No
diff_ens([1,5,3], [5,4,7], [1]). % No
