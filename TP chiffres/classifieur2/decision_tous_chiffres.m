function [ vecteurs_proba , taux_reconnaissance ] = decision_tous_chiffres( link_test , link_base, n, m, K )
%D�termine le vecteur de probabilit� d'appartenance aux 10 classes
%pour tous les chiffres de l'image de test.
% Param�tres : 
%   link_test : lien vers l'image � tester
%   link_base : lien vers l'image contenant la base d'apprentissage
%   n : nombre de zone sur la hauteur du rectangle du chiffre
%   m : nombre de zone sur la largeur du rectangle du chiffre
%   K : nombre de plus proches voisins retenus
% Sortie : 
%   vecteur_proba : cellule contrenant vecteurs de probabilit� d'appartenance des chiffres aux
%   classes
%   taux_reconnaissance : pourcentage de chiffres correctement identifi�s

Itest = imread(link_test);
Ibase = imread(link_base);

densites = apprentissage_densite_chiffres(Ibase, n, m);

MAT = localisation_extraction_chiffre(Itest);

vecteurs_proba = cell(size(MAT));

nb_chiffres_reconnus = 0;

for i=1:1:size(MAT,1)
    for j=1:1:size(MAT,2)
        vecteurs_proba{i,j} = decision_chaque_chiffre(MAT{i,j},Itest,n,m,densites,K);
        
        % on determine l'indice en ligne du nombre reconnu
        [~ , nombre_reconnu] = max(vecteurs_proba{i,j});
        
        % on le compare � l'indice du chiffre actuel 
        if nombre_reconnu == i 
            nb_chiffres_reconnus = nb_chiffres_reconnus +1;
        end
        
    end
end

taux_reconnaissance = nb_chiffres_reconnus/100;

end

