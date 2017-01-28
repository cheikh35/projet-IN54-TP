%Script permettant de tester l'apprentissage pour le classifieur 1.

clear all
close all
clc

I = imread('../app.tif');

MAT = localisation_extraction_chiffre(I);

Profil=extraction_profils(MAT{9,7},I,5)

centres = apprentissage_centres_classes(I,5);
