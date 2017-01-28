function [densites] = calcul_densites(matrice_coord_chiffre,I,n,m)
%Fonction permettant de calculer la densité en pixel de chaque zone du 
%rectangle engloblant du chiffre passé en paramètre.
% Paramètres : 
%   matrice_coord_chiffre : cellule contenant la matrice représentant le
%   rectangle englobant du chiffre
%   I : matrice de l'image issue de imread
%   n : nombre de zone sur la hauteur du rectangle du chiffre
%   m : nombre de zone sur la largeur du rectangle du chiffre
% Sortie : 
%   densites : matrice de taille n x m = d, ayant la densite de chaque zone

densites = zeros(n,m);

haut = matrice_coord_chiffre(1,1)+1;
gauche = matrice_coord_chiffre(1,2)+1;
bas = matrice_coord_chiffre(2,1)-1;
droite = matrice_coord_chiffre(2,2)-1;

largeur_rectangle = abs(bas-haut);
longueur_rectangle = abs(droite-gauche);

pas_vertical = (longueur_rectangle/(n));
pas_horizontal = (largeur_rectangle/(m));

k=1;
for i=haut:pas_vertical:bas-pas_vertical
    l=1;
    indice_vertical = ceil(i);
    for j=gauche:pas_horizontal:droite-pas_horizontal
        indice_horizontal = ceil(j);
    zone = I(indice_vertical:ceil(i+pas_vertical), indice_horizontal:ceil(j+pas_horizontal));
    indices_pixels_noirs = find(zone<50);
    nb_pixels_noirs = size(indices_pixels_noirs,1);
    
    densites(k,l) = nb_pixels_noirs/(pas_horizontal*pas_vertical);
    l=l+1;
    end
    k=k+1;
end

end