%Problema inverso con matrice jacobiana quadrata e rumore nei dati

close all;
clear all;
clc;

m=[0.1;1;0.1];
G=jacob([90; 60; 30],1,2,3,3);
dc=G*m;
Gp=inv(G);
%v=1:100;

%for i=1:100
n1=[0.1;0;0];
n2=[0;0.1;0];
n3=[0;0;0.1];
dn1=dc+n1;
dn2=dc+n2;
dn3=dc+n3;
%mric1(:,i)=Gp*dn1; %rumore solo su comp 1
%mric2(:,i)=Gp*dn2; %rumore solo su 2
%mric3(:,i)=Gp*dn3; %rumore solo su 3
mric1=Gp*dn1;
mric2=Gp*dn2;
mric3=Gp*dn3;
%end
% figure(1),
% plot(v,mric1(1,:),'r'),hold on,plot(v,mric1(2,:),'b'),hold on,plot(v,mric1(3,:),'g'),xlabel('realizzazioni'),ylabel('Ampiezza'), title('100 stime del modello con rumore sulla prima componente dei dati')
% figure(2),
% plot(v,mric2(1:),'r'),hold on,plot(v,mric2(2,:),'b'),hold on,plot(v,mric2(3,:),'g'),xlabel('realizzazioni'),ylabel('Ampiezza'), title('100 stime del modello con rumore sulla seconda componente dei dati')
% figure(3),
% plot(v,mric3(1,:),'r'),hold on,plot(v,mric3(2,:),'b'),hold on,plot(v,mric3(3,:),'g'),xlabel('realizzazioni'),ylabel('Ampiezza'), title('100 stime del modello con rumore sulla terza componente dei dati')

disp('errore relativo nei dati: ')
for i=1:3
disp(-dn1(i)+dc(i)./dc(i))
disp(-dn2(i)+dc(i)./dc(i))
disp(-dn3(i)+dc(i)./dc(i))
end
disp('errore relativo nel modello: ')
for i=1:3
disp(-mric1(i)+m(i)./m(i))
disp(-mric2(i)+m(i)./m(i))
disp(-mric3(i)+m(i)./m(i))
end