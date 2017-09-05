%Derivazione numerica e problemi col rumore
clear all;
close all;
clc;


fc=800; %100Mhz campionamento
T=1/fc; %tempo di campionamento
N=8192; %campioni FFT, sovracampiono
fk=[-fc/2+fc/N:fc/N:fc/2]; %asse delle frequenze discrete
D=(2*j/T)*sin(pi.*fk/fc).*exp(-pi*fk./fc); %derivatore ottenuto con il rapporto incrementale
Dr=j*(2/T)*tan(pi*fk/fc); %Grank Nicholson, senza ritardo di mezzo campione perchè riferisco tutta l'eq diff finite all'istante centrale (n-1/2)T



figure,plot(fk,abs(D)),title('Derivatore approssimato con ritardo di mezzo campione')
figure,plot(fk,abs(Dr)),title('Derivatore approssimato senza ritardo')

der=[-1 2 -1]/2*T;
DER=fft(der,4096);
plot(-fc/2+fc/4096:fc/4096:fc/2,fftshift(abs(DER)))
hold on,plot(-fc/2+fc/4096:fc/4096:fc/2,abs(-fc/2+fc/4096:fc/4096:fc/2))
hold on,plot(-fc/2+fc/4096:fc/4096:fc/2,(-fc/2+fc/4096:fc/4096:fc/2).^2)
