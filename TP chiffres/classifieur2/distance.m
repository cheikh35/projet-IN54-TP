function [ dist ] = distance( densites_chifre_base , densite_chiffre , n,m )
%Détermine la distance entre la matrice de densité d'un chiffre de la base 
%d'apprentissage en paramètre avec la matrice de densité du chiffre passé
%en paramètre
% Paramètres : 
%   densites_chifre_base : matrice de densité d'un chiffre de la base 
%   d'apprentissage 
%   densite_chiffre : matrice de densité du chiffre
%   n : nombre de zone sur la hauteur du rectangle du chiffre
%   m : nombre de zone sur la largeur du rectangle du chiffre
% Sortie : 
%   dist : distance euclidienne entre les deux premieres matrices passées en
%   paramètre
dist = 0;

for i=1:1:n
    for j=1:1:m
        dist = dist + (densites_chifre_base(i,j)-densite_chiffre(i,j))^2;
    end
end

dist = sqrt(dist);
end

