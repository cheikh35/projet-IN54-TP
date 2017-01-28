%Script permettant de générer les vecteurs de probabilité pour chaque
%chiffre de l'image de test en paramètre. On sauvegarde ensuite ces
%vecteurs dans le dossier courant et dans le dossier de combinaison des
%classifieurs pour utiliser les meilleurs résultats.

clear all
close all
clc

[vecteurs_proba1 , taux_reconnaissance] = decision_tous_chiffres('../test.tif','../app.tif',20);

save('vecteurs_proba1.mat','vecteurs_proba1');
save('../combinaison/vecteurs_proba1.mat','vecteurs_proba1');
