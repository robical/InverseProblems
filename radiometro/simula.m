clear all;
clc;

m=[0.1;1;0.1];
ang=[50; 30; 20]; %vettore colonna
G=jacob(ang,1,2,3,3);
dc=G*m;
y=zeros(10000,3);
%errori di modellizzazione gaussiani
for v=1:10000
    Gmod=G+0.1*max(dc)*rand(3,3);
    Gp=inv(Gmod);
    mric=Gp*dc;
    y(v,1)=mric(1,1);
    y(v,2)=mric(2,1);
    y(v,3)=mric(3,1);
end
n1=hist(y(:,1),100); %perturb comp 1 del modello
n2=hist(y(:,2),100); %perturb comp 2 del modello
n3=hist(y(:,3),100); %perturb comp 3 del modello
l1=linspace(min(y(:,1)),max(y(:,1)),100);
l2=linspace(min(y(:,2)),max(y(:,2)),100);
l3=linspace(min(y(:,3)),max(y(:,3)),100);
figure, subplot(2,2,1),bar(l1,n1,1),axis xy,
subplot(2,2,2),bar(l2,n2,1),axis xy,
subplot(2,2,3),bar(l3,n3,1),axis xy