%Script permettant d'executer le classifieur 1 en faisant varier la taille
%des profils gauche et droit. Les taux de reconnaissances sont ensuite
%tracé sur un graphe. La meilleure taille pour les profils droit et gauche
%est également déterminée.


clear all
close all
clc

N = 50;

taux = zeros(N,1);
for d=1:N
    [~,taux(d)] = decision_tous_chiffres( '../test.tif' , '../app.tif', d );
end

[~,best_d] = max(taux);

plot(taux);
xlabel('d/2');
ylabel('Taux de reconnaissance');

