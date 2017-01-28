%Script permettant d'executer le classifieur 2 en faisant varier la taille
%de la matrice de densité dans un premier temps, puis ensuite également le 
%nombre de plus proches voisins. Les taux de reconnaissances sont ensuite
%tracé sur un graphe. La meilleure taille la matrice de densité et le 
%meilleur nombre de voisins sont également déterminés.

clear all
close all
clc

N = 20;
M = 20;
K = 20;

taux1 = zeros(N,M);
for n=1:1:N
    for m=1:1:M
        [~,taux1(n,m)] = decision_tous_chiffres( '../test.tif' , '../app.tif', n, m, K );
    end
end

[vecteur_max,indice_temp] = max(taux1);
[~ , best_m] = max(vecteur_max);
best_n = indice_temp(best_m);


figure , surf(taux1);
ylabel('n');
xlabel('m');
zlabel('Taux de reconnaissance');


taux2 = zeros(N,K);
for n=1:1:N
    for k=1:1:K
        [~,taux2(n,k)] = decision_tous_chiffres( '../test.tif' , '../app.tif', n, n, k );
    end
end

[vecteur_max,indice_temp] = max(taux2);
[~ , best_k] = max(vecteur_max);
best_n_m = indice_temp(best_k);

figure , surf(taux2);
ylabel('n=m');
xlabel('k');
zlabel('Taux de reconnaissance');

