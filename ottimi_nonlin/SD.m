%Steepest Descent

clc;
clear all;
close all;
% m=[3 4]'; %modelloi
% g=@(m) [m(1).^2+m(2).^3; 3*m(1).^4-2*m(2)];
% d=g(m); %calcolo i dati
% syms m1;
% syms m2;
% m=[m1;m2];
% g_s=[m(1).^2+m(2).^3; 3*m(1).^4-2*m(2)];
% G_s=jacobian(g_s,m);


% A=rand(2);
% A=A'*A;
A=[0.8485 0.3530;0.3530 0.1545];
y=[1;4];

h1=[-1100:10:1100];
h2=[-1100:10:1100];

%f quadratica
for i=1:length(h1)
    for j=1:length(h2)
    f(i,j)=0.5*([h1(i);h2(j)]'*A*[h1(i);h2(j)])-y'*[h1(i);h2(j)];
    end
end
%griglia
[H1,H2]=meshgrid(h1,h2);
figure,mesh(H2,H1,f),colormap('pink'),title('Percorso dello Steepest Descent nella ricerca del minimo')


i=1;
x(:,i)=[34;23];
ft(i)=0.5*([x(1,i);x(2,i)]'*A*[x(1,i);x(2,i)])-y'*[x(1,i);x(2,i)];
hold on, plot3(x(1,1),x(2,1),ft(i),'og'),hold on,
contour(H2,H1,f,[ft(1) ft(1)],'r');
i=2;
r(:,1)=y-A*x(:,1);
while (norm(r(:,i-1))>1e-5)
    al=r(:,i-1)'*r(:,i-1)/(r(:,i-1)'*A*r(:,i-1)); %passo del SD tale che il punto x successivo sia quello di minimo della funzione quadratica per i punti
    %che stanno sulla retta che ha direzione r(i-1)
    x(:,i)=x(:,i-1)+al*r(:,i-1);
    ft(i)=0.5*([x(1,i);x(2,i)]'*A*[x(1,i);x(2,i)])-y'*[x(1,i);x(2,i)];
    plot3(x(1,i),x(2,i),ft(i),'or'),
    contour(H2,H1,f,[ft(i) ft(i)],'r');
    refresh;
    r(:,i)=y-A*x(:,i);
    i=i+1;
end

hold on, plot3(x(1,:),x(2,:),ft,'-','LineWidth',2)
rsd=r;
for i=1:size(rsd,2)
    nr_sd(i)=norm(rsd(:,i));
end

disp('!Metodo Steepest Descent!')
disp('Soluzione trovata: '),x(:,i-1)
disp('Norma Residuo finale: '),norm(r(:,i-1))
disp('Numero di iterazioni: '),(i-1)


%%  Gradiente Coniugato

%clear all;
%clc;

%guess iniziale
N=10;
clear x;
clear ft;
clear r;
x(:,1)=randn(N,1);
%A=randn(N);
A=randn(N); %creo matrice simmetrica definita positiva

G=A'*A;
A=G;
not=randn(N,1); %creo vettore dei termini noti
y=not;

r(:,1)=not-G*x(:,1); %primo residuo
d(:,1)=r(:,1); %corrisponde alla prima direzione di ricerca
a(1)=(d(:,1)'*r(:,1))/(d(:,1)'*G*d(:,1)); %passo scelto per fare in modo di raggiungere il minimo della funzione proseguendo lungo la direzione di ricerca d(i), in x(i+1)
%grazie a questa proprietà inoltre il residuo nello spazio dei dati
%all'iteraz i+1 è ortogonale alla direzione di ricerca d(i)

%plotting
i=1;
ft(i)=0.5*(x(:,i)'*A*x(:,i))-y'*x(:,i);
hold on, plot3(x(1,1),x(2,1),ft(1),'ok')
i=2;
while(norm(r(:,i-1))>1e-8)
x(:,i)=x(:,i-1) + a(i-1)*d(:,i-1); %mi muovo lungo la direz di ricerca e trovo il punto nello spazio del modello che elimina la prima componente del residuo
%cioè quella lungo la direzione di ricerca d(i), il nuovo residuo avra
%componenti ortogonali al precedente, ho dunque eliminato una componente
%plotting
ft(i)=0.5*(x(:,i)'*A*x(:,i))-y'*x(:,i);
plot3(x(1,i),x(2,i),ft(i),'ob'),
refresh;
%plotting    
r(:,i)=r(:,i-1) - a(i-1)*G*d(:,i-1); %calcolo il nuovo residuo che avrà una componente in meno
b(i)=(r(:,i)'*r(:,i))/(r(:,i-1)'*r(:,i-1)); %calcolo il peso per la nuova direzione di ricerca coniugata alla precedente, dato che ho scelto i residui come base
%di partenza questo peso dipenderà solo dalla direzione scelta
%precedentemente, che però per costruzione è combinazione lineare dei
%residui, e data la loro ortogonalità questo porta ad avere un peso b(i)
%funzione solo dei residui al passo i e i-1
d(:,i)=r(:,i) + b(i)*d(:,i-1); %calcolo la nuova direzione di ricerca con peso b(i) su direz d(i-1) sommata al residuo corrente
a(i)=(d(:,i)'*r(:,i))/(d(:,i)'*G*d(:,i)); %calcolo il nuovo peso nella nuova direz di ricerca
i=i+1;
end

hold on, plot3(x(1,:),x(2,:),ft,'-g','LineWidth',2)



%figure,plot(1:size(rsd,2),nr_sd), title('Andamento della norma del residuo nei dati - SD'),



for i=1:size(r,2)
    nr_gc(i)=norm(r(:,i));
end
figure,plot(1:size(r,2),nr_gc), title('Andamento della norma del residuo nei dati - GC')




disp('')
disp('!Metodo del Gradiente Coniugato!')
disp('Soluzione trovata: '),x(:,i)
disp('Norma del Residuo finale: '),norm(r(:,i))
disp('Numero di iterazioni: '),i-1

