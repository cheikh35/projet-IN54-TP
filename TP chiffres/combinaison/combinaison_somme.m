function [ vecteurs_proba_final , taux_reconnaissance ] = combinaison_somme( vecteurs_proba1 , vecteurs_proba2 )
%Réalise la combinaison des probabilités issues des deux classifieurs par
%la méthode de la somme
% Paramètres : 
%   vecteurs_proba1 : vecteurs de probabilité issus du classifieur 1
%   vecteurs_proba2 : vecteurs de probabilité issus du classifieur 2
% Sortie : 
%   vecteurs_proba_final : vecteurs de probabilité combinaison par somme
%   des deux classifieurs

vecteurs_proba_final = cell(size(vecteurs_proba1));

nb_chiffres_reconnus = 0;

for i=1:1:size(vecteurs_proba_final,1)
    for j=1:1:size(vecteurs_proba_final,2)
        vecteurs_proba_final{i,j} = vecteurs_proba1{i,j} + vecteurs_proba2{i,j};
        
        % on determine l'indice en ligne du nombre reconnu
        [~ , nombre_reconnu] = max(vecteurs_proba_final{i,j});
        
        % on le compare à l'indice du chiffre actuel 
        if nombre_reconnu == i 
            nb_chiffres_reconnus = nb_chiffres_reconnus +1;
        end
    end
end

taux_reconnaissance = nb_chiffres_reconnus/100;

end