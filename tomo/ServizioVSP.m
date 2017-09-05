function [G,RegDx,RegDy,RegD2x,RegD2y,RegLap] = ServizioVSP(ns, nr, nx, ny, v1, v2)

% Fornisce le matrici della tomografia per geometrie VSP
%
%
% USAGE
%
% [G,RegDx,RegDy,RegD2x,RegD2y,RegLap,modello] = ServizioVSP(ns, nr, nx, ny)
%
% INPUT
% ns   = numero di sorgenti
% nr   = numero di ricevitori
% nx   = numero di pixel del modello lungo l'asse orizzontale
% ny   = numero di pixel del modello lungo l'asse verticale
%
% OUTPUT
% G         = MATRICE DI FORWARD (nx*ny,ns*nr)
% RegDx     = MATRICE REGOLARIZZATORE con differenze prime lungo x
% RegDy     = MATRICE REGOLARIZZATORE con differenze prime lungo y
% RegD2x    = MATRICE REGOLARIZZATORE con differenze seconde lungo x
% RegDy    = MATRICE REGOLARIZZATORE con differenze seconde lungo y
% RegLap    = MATRICE REGOLARIZZATORE con laplaciano
