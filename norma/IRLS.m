%Iterative Raweighted Least Squares, IRLS

close all;
clear all;
clc;


%uso stesso esempio di osservazioni con outlier

t=[1 3 5 7 10 12 13 15 16 18 31]';
y=[10 11 11 12 13 14 14 15 15 16 2]';

G=[t ones(size(t))];

%y=G*x ----> x=(G'*G)\G'*y

tol1=1e-4; %tolleranza sulle oscillazioni permesse alla soluzione una volta arrivata a convergenza

dump=0.5;

Gp=(G'*G)\G';
x(:,1)=Gp*y; %è la stima in norma l2 della soluzione, difatti sbaglia
no(1)=norm(y-G*x(:,1));
i=2;
R=diag(1./((y-G*x(:,i-1))+ones(size(y))*dump));
x(:,i)=pinv(G'*R*G,0.1)*G'*(R*y); %<--- aggiornamento della soluzione attraverso pesatura con l'inverso dei residui dell'iteraz precedente
no(i)=norm(y-G*x(:,i));
imax=1;

while (norm(x(:,i)-x(:,i-1))>tol1 && imax<=100) %<--- test  d'arresto, dovrei controllare la convergenza del residuo nei dati
    i=i+1;
    R=diag(1./((y-G*x(:,i-1))+ones(size(y))*dump));
    x(:,i)=pinv(G'*R*G,0.1)*G'*(R*y); %<--- aggiornamento della soluzione attraverso pesatura con l'inverso dei residui dell'iteraz precedente
    no(i)=norm(y-G*x(:,i));
    imax=imax+1;
end

imax=imax-1;
i=i-1;

figure(1),plot(x(1,1),x(2,1),'or'),hold on,plot(x(1,2:end),x(2,2:end),'ok'),hold on, line(x(1,:),x(2,:))
figure(2),plot(1:length(no),no)