%esempio balistica (senza resistenza aria)
clear all;
close all;
clc;


g0=10; %m/s^2
v0=100; %m/s
the=20; %deg, angolo di alzo
the=the/180*pi; %conversione in rad

%perturbo i dati in modo da ottenere delle stime della perturbazione di
%gravit� e di velocit�, uso solo le perturbazioni per eccitare il sistema
it=1:60;

for i=1:60
t0=2*(v0/g0)*sin(the);
x0=(v0^2/g0)*sin(2*the);
d0=[t0;x0];
G=[-2*(v0/g0^2)*sin(the) (2/g0)*sin(the); -(v0^2/g0^2)*sin(2*the)  2*(v0/g0)*sin(2*the)];
dn(:,i)=randn(2,1)*0.01*max(abs(d0));
mcal(:,i)=G\dn(:,i);
the=(the/pi*180)+1; %deg, angolo di alzo
the=the/180*pi; %conversione in rad
end
figure, plot(it,dn(1,:),'r-'),hold on,plot(it,dn(2,:),'g-'),title('Perturbazioni dei dati: tempo(r) spazio(g)');
figure, plot(it,mcal(1,:),'r-'),hold on,plot(it,mcal(2,:),'g-'),title('Parametri del modello invertiti: gravit�(r) velocit�(v)');

%con resistenza dell'aria sulla componente orizzontale di moto


it=1:60;
the=20; %deg, angolo di alzo
the=the/180*pi;
for i=1:60
t0=2*(v0/g0)*sin(the);
x0=(v0^2/g0)*sin(2*the);
d0=[t0;x0];
Gr=[[-2*(v0/g0^2)*sin(the) (2/g0)*sin(the); -(v0^2/g0^2)*sin(2*the)  2*(v0/g0)*sin(2*the)] [0;-(v0^3/g0^2)*sin(the)*sin(2*the)]]; %problema linearizzato
mcalr(:,i)=Gr\dn(:,i);
the=(the/pi*180)+1; %deg, angolo di alzo
the=the/180*pi; 
end
figure, plot(it,dn(1,:),'r-'),hold on,plot(it,dn(2,:),'g-'),title('Perturbazioni dei dati: tempo(r) spazio(g)');
figure, plot(it,mcalr(1,:),'r-'),hold on,plot(it,mcalr(2,:),'g-'),hold on,plot(it,mcalr(3,:),'b-'),title('Parametri del modello invertiti: gravit�(r) velocit�(v) attrito(n)');

%riutilizzo il modello invertito per stimare i dati
it=1:60;
the=20; %deg, angolo di alzo
the=the/180*pi;
for i=1:60
t0=2*(v0/g0)*sin(the);
x0=(v0^2/g0)*sin(2*the);

Gr=[[-2*(v0/g0^2)*sin(the) (2/g0)*sin(the); -(v0^2/g0^2)*sin(2*the)  2*(v0/g0)*sin(2*the)] [0;-(v0^3/g0^2)*sin(the)*sin(2*the)]];
dric(:,i)=Gr*mcalr(:,i);
the=(the/pi*180)+1; %deg, angolo di alzo
the=the/180*pi; 
end
figure, plot(it,dric(1,:),'r-'),hold on,plot(it,dric(2,:),'g-'),title('Dati ricalcolati')