plat_resistance(cresson_oeuf_poche). %-> Faux
plat_resistance(poulet_au_tilleul). %-> Vrai
plat_resistance(bar_aux_algues). %-> Vrai
plat_resistance(melon_en_surprise). %-> Faux

repas(cresson_oeuf_poche, poulet_au_tilleul, melon_en_surprise). %-> Vrai
repas(cresson_oeuf_poche, poulet_au_tilleul, bar_aux_algues). %-> Faux

bon_plat(artichauts_Melanie). %-> Faux
bon_plat(truffes_sous_le_sel). %-> Vrai
bon_plat(grillades_de_boeuf). %-> Faux
bon_plat(poulet_au_tilleul). %-> Faux

plus_calorique_algues(saumon_oseille). %-> Vrai
plus_calorique_algues(bar_aux_algues). %-> Faux
plus_calorique_algues(poulet_au_tilleul). %-> Vrai
plus_calorique_algues(artichauts_Melanie). %-> Faux

total_calories(cresson_oeuf_poche, poulet_au_tilleul, melon_en_surprise, Cals). %-> Cals = 734
total_calories(cresson_oeuf_poche, poulet_au_tilleul, bar_aux_algues, Cals). %-> Faux


repas_equilibre(artichauts_Melanie, poulet_au_tilleul, melon_en_surprise). %-> Vrai
repas_equilibre(cresson_oeuf_poche, grillades_de_boeuf, fraises_chantilly). %-> Faux