%Script permettant de générer les vecteurs de probabilité pour chaque
%chiffre de l'image de test en paramètre. On sauvegarde ensuite ces
%vecteurs dans le dossier courant et dans le dossier de combinaison des
%classifieurs pour utiliser les meilleurs résultats.

clear all
close all
clc

[vecteurs_proba2 , taux_reconnaissance] = decision_tous_chiffres('../test.tif','../app.tif',13,13,1);

save('vecteurs_proba2.mat','vecteurs_proba2');
save('../combinaison/vecteurs_proba2.mat','vecteurs_proba2');