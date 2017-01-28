%Script permettant de tester le calcul de la matrice de densité pour un 
%chiffre pour le classifieur 2.


clear all
close all
clc

I = imread('../test.tif');

MAT = localisation_extraction_chiffre(I);

densite=calcul_densites(MAT{7,9},I,5,5)