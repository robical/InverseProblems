function m = modello(nx, ny, v1, v2, a)

% Tomografia travel time per geometrie VSP
%
%
% USAGE
%
% m = modello(nx, ny, v1, v2, a)
%
% INPUT
% nx   = numero di pixel del modello lungo l'asse orizzontale
% ny   = numero di pixel del modello lungo l'asse verticale
% v1    = descrittore dell'anomalia di velocita'.
%         L'anomalia di velocita' ha forma rettangolare e ampiezza pari a
%         (1+a) volte il valore di background.
%         v1 e' un vettore di due elementi (v1x,v1y) che contiene la posizione
%         in pixel dello spigolo superiore sinistro dell'anomalia
% v2    = descrittore dell'anomalia di velocita'.
%         L'anomalia di velocita' ha forma rettangolare e ampiezza pari al 20%
%         del valore di background.
%         v2 e' un vettore di due elementi (v2x,v2y) che contiene la posizione
%         in pixel dello spigolo inferiore destro dell'anomalia
% a     = ampiezze dell'anomalia rispetto al background (10% -> a = 0.1)
%
% OUTPUT
% m = matrice ny-x-nx contenente il modello 
%
% N.B. per riportare il modello allo stato di vettore usa 
% reshape(modello,nx*ny,1)
