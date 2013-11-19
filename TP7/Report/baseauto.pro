/**
TP 7 Base de Données Déductives (BDD) - Prolog

@author Paul Chaignon
@author Clément Clément
@version Annee scolaire 2013/2014
*/


/*
===============================================================================
===============================================================================
 Définition des prédicats
===============================================================================
*/
% ============================================================================= 
% SECTION 1 : Base de données
% ============================================================================= 

assemblage(voiture, porte, 4).
assemblage(voiture, roue, 4).
assemblage(voiture, moteur, 1).
assemblage(roue, jante, 1).
assemblage(porte, tole, 1).
assemblage(porte, vitre, 1).
assemblage(roue, pneu, 1).
assemblage(moteur, piston, 4).
assemblage(moteur, soupape, 16).

           
piece(p1, tole, lyon).
piece(p2, jante, lyon).
piece(p3, jante, marseille).
piece(p4, pneu, clermontFerrand).
piece(p5, piston, toulouse).
piece(p6, soupape, lille).
piece(p7, vitre, nancy).
piece(p8, tole, marseille).
piece(p9, vitre, marseille).

                  
demandeFournisseur(dupont, lyon).
demandeFournisseur(michel, clermontFerrand).
demandeFournisseur(durand, lille).
demandeFournisseur(dupond, lille).
demandeFournisseur(martin, rennes).
demandeFournisseur(smith, paris).
demandeFournisseur(brown, marseille).
          
          
fournisseurReference(f1, dupont, lyon).
fournisseurReference(f2, durand, lille).
fournisseurReference(f3, martin, rennes).
fournisseurReference(f4, michel, clermontFerrand).
fournisseurReference(f5, smith, paris).
fournisseurReference(f6, brown, marseille).

                  
livraison(f1, p1, 300).
livraison(f2, p2, 200).
livraison(f3, p3, 200).
livraison(f4, p4, 400).
livraison(f6, p5, 500).
livraison(f6, p6, 1000).
livraison(f6, p7, 300).
livraison(f1, p2, 300).
livraison(f4, p2, 300).
livraison(f4, p1, 300).


% ============================================================================= 
% SECTION 2 : Opération relationnelles
% ============================================================================= 
fromcity(City, piece(NumPiece, Nom, City)):-
	piece(NumPiece, Nom, City).

infospieces(Nom, Lieu):-
	piece(_, Nom, Lieu).

inter(Nom, Lieu):-
	demandeFournisseur(Nom, Lieu),
	fournisseurReference(_, Nom, Lieu).

union(Nom, Lieu):-
	demandeFournisseur(Nom, Lieu).
union(Nom, Lieu):-
	fournisseurReference(_, Nom, Lieu),
	not(demandeFournisseur(Nom, Lieu)).

diff(Nom, Lieu):-
	demandeFournisseur(Nom, Lieu),
	not(fournisseurReference(_, Nom, Lieu)).

prodcart(uplet(NumFourn1, Nom, Ville, NumFourn2, Piece, Quantite)):-
	fournisseurReference(NumFourn1, Nom, Ville),
	livraison(NumFourn2, Piece, Quantite).

jointure(uplet(NumFourn, Nom, Ville, Piece, Quantite)):-
	fournisseurReference(NumFourn, Nom, Ville),
	livraison(NumFourn, Piece, Quantite).

jointureSelect(uplet(NumFourn, Nom, Ville, Piece, Quantite)):-
	jointure(uplet(NumFourn, Nom, Ville, Piece, Quantite)),
	Quantite > 350.

jointureSelect2(uplet(NumFourn, Nom, Ville, Piece, Quantite)):-
	livraison(NumFourn, Piece, Quantite),
	Quantite > 350,
	fournisseurReference(NumFourn, Nom, Ville).

pasOk(Fourn1):-
	piece(PieceLyon, _, lyon),
	not(livraison(Fourn1, PieceLyon, _)).
div(Fourn):-
	fournisseurReference(Fourn, _, _),
	not(pasOk(Fourn)).

sumQuantites([], 0).
sumQuantites([Prem|List], Total):-
	sumQuantites(List, Total2),
	Total is Total2 + Prem.

totalPieces(Fourn, NB):-
	findall(Quantite, livraison(Fourn, _, Quantite), Quantites),
	sumQuantites(Quantites, NB).

totalPieces(uplet(Fourn, NB)):-
	fournisseurReference(Fourn, _, _),
	totalPieces(Fourn, NB).	
	


% ============================================================================= 
% SECTION 3 : Au dela de l algebre relationnelle
% ============================================================================= 

composants(Composant, Composant):-
	piece(_, Composant, _),
	!.
composants(Composant, ComposeDe):-
	assemblage(Composant, SousComposant, _),
	composants(SousComposant, ComposeDe).
composants(Composant, ComposeDe):-
	assemblage(Composant, ComposeDe, _),
	!.

