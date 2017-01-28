function [ vecteur_proba ] = decision_chaque_chiffre(matrice_coord_chiffre,I,d,centres)
%Détermine le vecteur de probabilité d'appartenance aux 10 classes
%pour le chiffre passé en paramètre.
% Paramètres : 
%   matrice_coord_chiffre : cellule contenat la matrice représentant le
%   rectangle englobant du chiffre
%   I : matrice de l'image issue de imread
%   d : taille du profil gauche et droit
%   centres : cellule contenant les centres de chaque classe de chiffres
% Sortie : 
%   vecteur_proba : vecteur de probabilité d'appartenance du chiffre aux
%   classes 

vecteur_proba = zeros(10,1);

profil_chiffre = extraction_profils(matrice_coord_chiffre,I,d);

somme_exp =0;

exp_distances = zeros(10,1);

for i=1:1:10
      exp_distances(i) = exp(-distance(centres{i},profil_chiffre,d));
      somme_exp = somme_exp + exp_distances(i);
end

for i=1:1:10
      vecteur_proba(i) = exp_distances(i)/somme_exp;
end

end


