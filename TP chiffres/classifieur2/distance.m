function [ dist ] = distance( densites_chifre_base , densite_chiffre , n,m )
%D�termine la distance entre la matrice de densit� d'un chiffre de la base 
%d'apprentissage en param�tre avec la matrice de densit� du chiffre pass�
%en param�tre
% Param�tres : 
%   densites_chifre_base : matrice de densit� d'un chiffre de la base 
%   d'apprentissage 
%   densite_chiffre : matrice de densit� du chiffre
%   n : nombre de zone sur la hauteur du rectangle du chiffre
%   m : nombre de zone sur la largeur du rectangle du chiffre
% Sortie : 
%   dist : distance euclidienne entre les deux premieres matrices pass�es en
%   param�tre
dist = 0;

for i=1:1:n
    for j=1:1:m
        dist = dist + (densites_chifre_base(i,j)-densite_chiffre(i,j))^2;
    end
end

dist = sqrt(dist);
end

