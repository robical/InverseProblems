function [estDamp, estReg] = tomoInvVSP(ns, nr, nx, ny, sigma, reg, v1, v2, stdNoise)

% Tomografia travel time per geometrie VSP
%
%
% USAGE
%
% [estDamp, estReg, modello] = tomoInvVSP(ns, nr, nx, ny, sigma, reg, v1, v2, stdNoise)
%
% INPUT
% ns   = numero di sorgenti
% nr   = numero di ricevitori
% nx   = numero di pixel del modello lungo l'asse orizzontale
% ny   = numero di pixel del modello lungo l'asse verticale
% sigma = fattore di damping 
% reg   = tipo di regolarizzatore (stringa)
%         'D1x' differenze prime lungo x
%         'D2x' differenze seconde lungo x
%         'D1y' differenze prime lungo y
%         'D2y' differenze seconde lungo y
%         'LAP' laplaciano
% v1    = descrittore dell'anomalia di velocita'.
%         L'anomalia di velocita' ha forma rettangolare e ampiezza pari al 20%
%         del valore di background.
%         v1 e' un vettore di due elementi (v1x,v1y) che contiene la posizione
%         in pixel dello spigolo superiore sinistro dell'anomalia
% v2    = descrittore dell'anomalia di velocita'.
%         L'anomalia di velocita' ha forma rettangolare e ampiezza pari al 20%
%         del valore di background.
%         v2 e' un vettore di due elementi (v2x,v2y) che contiene la posizione
%         in pixel dello spigolo inferiore destro dell'anomalia
% stdNoise = deviazione standard del rumore additivo (gaussiano e bianco) sui traveltime
%            std(noise) = stdNoise*std(travelTime)
%
% OUTPUT
% estDamp = matrice ny-x-nx contenente il modello ottenuto dall'inversione
%           con damping
% estReg  = matrice ny-x-nx contenente il modello ottenuto dall'inversione
%           con regolarizzatore
%
% VARIABILI DI INTERESSE (per chi sa usare il debugger)
% sl        = MATRICE DI SLOWNESS PER IL FORWARD (ny,nx) 
% Dati      = TRAVELTIME (ns*nr)
% G         = MATRICE (sparsa) DI FORWARD (nx*ny,ns*nr)
% noise     = RUMORE ADDITIVO GAUSSIANO noise = std(Dati)*stdNoise*randn(size(Dati));
% reg       = MATRICE REGOLARIZZATORE (sparsa)
