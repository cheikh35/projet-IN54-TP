function [profil] = extraction_profils(matrice_coord_chiffre,I,d)
%Fonction permettant d'extraire les profils gauche et droit de l'image et
%renvoie un vecteur de profil de taille 2xd
% Paramètres : 
%   matrice_coord_chiffre : coordonées du rectangle engloblant du chiffre
%   I : matrice de l'image issue de imread
%   d : taille du profil droit/gauche, le vecteur profil aura une taille
%   2xd
% Sorite : 
%   profil : vecteur 2xd de profil du chiffre 

% détermination des vrais indices (sans l'espace en plus)
haut = matrice_coord_chiffre(1,1)+1;
gauche = matrice_coord_chiffre(1,2)+1;
bas = matrice_coord_chiffre(2,1)-1;
droite = matrice_coord_chiffre(2,2)-1;

%initialisation des vecteurs de profils
profil_gauche = zeros(d,1);
profil_droit = zeros(d,1);

compt_d=0;

% calcul des profils
for i=haut:((bas-haut)/(d-1)):bas
    indice = ceil(i);
    j = gauche;
    k = droite;
    while (I(indice,j)>50 && j<droite)
        j=j+1;  
    end
    while (I(indice,k)>50 && k>gauche)
        k=k-1;
    end
    compt_d=compt_d+1;
    if(j<droite)
        profil_gauche(compt_d) = (j-gauche)/(droite-gauche);
    else
        profil_gauche(compt_d) = -1;
    end
    if(k>gauche)
        profil_droit(compt_d) = (droite-k)/(droite-gauche);
    else
        profil_droit(compt_d) = -1;
    end
end

% concatenation des deux profils
profil = [profil_gauche ; profil_droit];
end