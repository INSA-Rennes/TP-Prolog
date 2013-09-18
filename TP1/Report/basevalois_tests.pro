enfant(henri_II, claude_de_france). %-> Yes
enfant(henri_II, henri_III). %-> No
enfant(henri_III, henri_II). %-> Yes

parent(claude_de_france, henri_II). %-> Yes
parent(henri_III, henri_II). %-> No
parent(henri_II, henri_III). %-> Yes

grand_pere(anne_de_Bretagne, henri_II). %-> No
grand_pere(louis_XII, henri_II). %-> Yes
grand_pere(jean_II, henri_II). %-> No

frere(francois_II, charles_IX). %-> Yes
frere(charles_VI, charles_VI). %-> No

oncle(jean_d_angouleme, louis_XII). %-> Yes
oncle(francois_I, henri_II). %-> No

cousin(charles_d_angouleme, louis_XII). %-> Yes
cousin(charles_V, henri_II). %-> No

le_roi_est_mort_vive_le_roi(charles_V, 1380, charles_VI). %-> Yes
le_roi_est_mort_vive_le_roi(jean_II, 1350, henri_III). %-> No

ancetre(charles_V, charles_VI). %-> Yes
ancetre(charles_V, claude_de_france). %-> Yes
ancetre(charles_VI, claude_de_france). %-> No