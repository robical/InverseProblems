%Regressione non lineare con Gauss Newton (problema sottodeterminato)

%xi e yi sono affetti da incertezza nota a priori e diversa da coppia a
%coppia e tra xi e yi
%occorre stimare:
% 1) La retta che meglio regredisce le coppie (xi, yi)
% 2) I valori xi e yi
% Ho 2N+2 valori da stimare!!

N=5;
d=ones(N,1);
%Ho le osservazioni
x=[0 1 2 3 4]';
y=[0.5 1 1.5 2 2.5]';
xp=x+(rand(N,1)-0.5);
yp=y+(rand(N,1)-0.5);
dx=xp-x;
dy=yp-y;
al=linspace(-10,10,20);
be=linspace(-10,10,20);
for i=1:20
    for j=1:20
m(:,1)=ones(2*N+2,1);
Cm=
G=[al(i)*ones(5,1) be(i)*ones(5,1) yp xp];
