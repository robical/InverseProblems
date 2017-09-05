%esempio propagazione onde piane


clear all;
close all;
clc;



x=0:.5:200; %metri in superficie
z=0:-0.5:-200; %metri in profondità
[X Z]=meshgrid(x,z);

c=3000; %vel propagazione del mezzo
f=50; %frequenza di generazione dell'onda
theta= 45; %angolo di inclinazione del fronte di fase dell'onda rispetto all'asse z (che va verso il basso)
lam=(c/f); %lunghezza d'onda reale
lamz=((2*pi)/lam)*(1/(cos(theta)+eps)); %rad/m in z
lamx=((2*pi)/lam)*(1/(cos(pi/2-theta)+eps)); %rad/m in x
fxz=exp(-j*(lamz*Z+lamx*X));
figure,mesh(X,Z,fxz)
 