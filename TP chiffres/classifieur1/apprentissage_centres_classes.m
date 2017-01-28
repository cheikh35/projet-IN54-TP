function [ centres ] = apprentissage_centres_classes(I,d)
%Détermine le centre de chacun des 10 classes de chiffres.
%Le centre correspond à la moyenne pondérée (barycentre) des vecteurs
%caractéristiques de chaque chiffre de la classe.
% Paramètres : 
%   I : matrice de l'image issue de imread
%   d : taille du profil gauche et droit
% Sortie : 
%   centres : cellule contenant les centres de chaque classe de chiffres

centres = cell(10,1);

MAT = localisation_extraction_chiffre(I);

somme = zeros(2*d,1);

for i=1:1:10 
    for j=1:1:size(MAT,2)
        somme = somme + extraction_profils(MAT{i,j},I,d);
    end
        somme = somme /size(MAT,2);
        centres{i} = somme;
end

end
