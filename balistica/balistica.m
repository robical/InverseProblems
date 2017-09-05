% balistica
clear all,
clc;

the=45/180*pi; %angolo di rialzo
v0=100; %metri al secondo, velocità iniziale del proiettile
g0=10; %metri al secondo quadrato, accelerazione di gravità

t0=2*v0/g0*sin(the); %tempo impiegato per arrivare al suolo
x0=v0^2/g0*sin(2*the); %punto d'impatto del proiettile con ipotesi terra piatta

%Modello: 1)Perturb gravità 2)Perturb velocità iniziale
%Dati : 1)Perturb tempo impiegato 2)PErturb punto d'impatto
%Jacobiano

G=[-2*v0/(g0^2)*sin(the) 2/g0*sin(the); -(v0^2)/(g0^2)*sin(2*the) 2*v0/g0*sin(2*the)];

%con resistenza dell'aria lungo la componente orizzontale
%Modello aggiunge k, il coeff d'attrito normalizzato alla massa del
%proiettile
m=1000; %massa in grammi
K=1e-4/m;

x0air=v0^2/g0*sin(2*the)-K*(v0^3/g0^2)*sin(the)*sin(2*the);

Gair=[-2*v0/(g0^2)*sin(the) 2/g0*sin(the) 0; -(v0^2)/(g0^2)*sin(2*the) 2*v0/g0*sin(2*the) -v0^3/(g0^2)*sin(the)*sin(2*the)];
