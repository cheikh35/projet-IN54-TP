function [ vecteurs_proba , taux_reconnaissance ] = decision_tous_chiffres( link_test , link_base, d )
%Détermine le vecteur de probabilité d'appartenance aux 10 classes
%pour tous les chiffres de l'image de test.
% Paramètres : 
%   link_test : lien vers l'image à tester
%   link_base : lien vers l'image contenant la base d'apprentissage
%   d : taille du profil gauche et droit
% Sortie : 
%   vecteur_proba : cellule contrenant vecteurs de probabilité d'appartenance des chiffres aux
%   classes
%   taux_reconnaissance : pourcentage de chiffres correctement identifiés

Itest = imread(link_test);
Ibase = imread(link_base);

centres = apprentissage_centres_classes(Ibase, d);

MAT = localisation_extraction_chiffre(Itest);

vecteurs_proba = cell(size(MAT));

nb_chiffres_reconnus = 0;

for i=1:1:size(MAT,1)
    for j=1:1:size(MAT,2)
        vecteurs_proba{i,j} = decision_chaque_chiffre(MAT{i,j},Itest,d,centres);
        
        % on determine l'indice en ligne du nombre reconnu
        [~ , nombre_reconnu] = max(vecteurs_proba{i,j});
        
        % on le compare à l'indice du chiffre actuel 
        if nombre_reconnu == i 
            nb_chiffres_reconnus = nb_chiffres_reconnus +1;
        end
        
    end
end

taux_reconnaissance = nb_chiffres_reconnus/100;

end

