function [ vecteurs_densites ] = apprentissage_densite_chiffres(I,n,m)
%Détermine le vecteur caractéristique de chacun des chiffres de la base I.
%Le vecteur caractéristique correspond à la matrice de densité du chiffre
% Paramètres : 
%   I : matrice de l'image issue de imread
%   n : nombre de zone sur la hauteur du rectangle du chiffre
%   m : nombre de zone sur la largeur du rectangle du chiffre
% Sortie : 
%   vecteurs_densites : cellule contenant les matrices de densité de chaque
%   chiffre de l'image d'apprentissage

MAT = localisation_extraction_chiffre(I);

vecteurs_densites = cell(size(MAT,1),size(MAT,2));

for i=1:1:size(MAT,1)
    for j=1:1:size(MAT,2)
        vecteurs_densites{i,j} = calcul_densites(MAT{i,j},I,n,m);
    end
end

end
