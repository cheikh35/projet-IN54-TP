%Script permetant de charger les vecteurs de probabilit�s g�n�r�s par les
%classifieurs, et realise la combinaison par somme et par produit. On
%r�cup�re alors les 2 ensembles de vecteurs de probabilit�s, et les deux
%taux de reconnaissance.


clear all
close all
clc

load('vecteurs_proba1.mat');
load('vecteurs_proba2.mat');

[ vecteurs_proba_final_somme, taux_somme ] = combinaison_somme( vecteurs_proba1 , vecteurs_proba2 );
    
[ vecteurs_proba_final_produit , taux_produit ] = combinaison_produit( vecteurs_proba1 , vecteurs_proba2 );