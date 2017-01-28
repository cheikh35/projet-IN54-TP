%Script permettant de tester l'apprentissage pour le classifieur 2.


clear all
close all
clc

I = imread('../test.tif');

vecteurs_densites = apprentissage_densite_chiffres(I,5,5)