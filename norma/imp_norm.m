%% Importanza della norma
pop=rand(1000);
b=reshape(pop,1000*1000,1);
hist(b)

m1=median(pop);
m2=mean(pop);

for i=1:1000
    minf(i)=0.5*(max(pop(:,i))-min(pop(:,i)));
end

figure,subplot(1,3,1),hist(m1),title('Valore mediano'),subplot(1,3,2),hist(m2),title('Valore Medio'),subplot(1,3,3),hist(minf),title('Midrange')

%% effetto sugli Outlier
 clear all;
 clc;
 
%voglio stimare a e b di una retta y=a*t+b

%osservazioni

t=[1 3 5 7 10 12 13 15 16 18 31]';
y=[10 11 11 12 13 14 14 15 15 16 2]';

G=[t ones(size(t))];

%y=G*x
%suppongo: -NO info a priori sul modello
%          -osservazioni indipendenti (matrice di covarianza dei dati diagonale)
% Ad ogni componente del vettore y è associata un incertezza di + o - 2

Cy=diag(4*ones(size(y)));

%Stime Gaussiana

a=[-2:.01:2];
b=[5:.1:20];
sigmam=ones(length(a),length(b));
[A,B]=meshgrid(a,b); %griglia dello spazio del modello
for i=1:length(a)
    for j=1:length(b)
        for h=1:length(t)
        sigmam(i,j)=sigmam(i,j)*exp(-0.5*(((a(i)*t(h)+b(j)-y(h))^2)/(Cy(h,h))));
        end
    end
end

%con outlier
figure,imagesc(b,a,sigmam),colormap('gray')

%estraggo moda (stima a max verosimiglianza)
maxr=0;
maxc=0;
[Y,I]=max(sigmam); %per ogni colonna trova il max e lo pone nel vettore Y, l'indice di riga di questo lo pone in I
[J,F]=max(Y); %trova il massimo nel vettore dei massimi di tutte le colonne, e mette l'indice della colonna contenente il max in J
maxc=F; %colonna contenente il max
%trovo la riga
for i=1:length(Y)
    if (Y(i)==J)
        maxr=I(i);
    end
end
a_mv_gau=a(maxr); %parametri trovati con stima a massima verosimiglianza
b_mv_gau=b(maxc);

%traccio punti corrispondenti alle osservazioni e retta trovata con stima
%MV

l=a_mv_gau*t+b_mv_gau; %retta trovata
figure,plot(t,y,'ok'),hold on, plot(t,l)

%stima esponenziale

a=[-2:.01:2];
b=[5:.1:20];
sigmam=ones(length(a),length(b));
[A,B]=meshgrid(a,b); %griglia dello spazio del modello
for i=1:length(a)
    for j=1:length(b)
        for h=1:length(t)
        sigmam(i,j)=sigmam(i,j)*exp(-(abs(a(i)*t(h)+b(j)-y(h))/sqrt(Cy(h,h))));
        end
    end
end
%con outlier
figure,imagesc(b,a,sigmam),colormap('gray')

%estraggo moda (stima a max verosimiglianza)
maxr=0;
maxc=0;
[Y,I]=max(sigmam); %per ogni colonna trova il max e lo pone nel vettore Y, l'indice di riga di questo lo pone in I
[J,F]=max(Y); %trova il massimo nel vettore dei massimi di tutte le colonne, e mette l'indice della colonna contenente il max in J
maxc=F; %colonna contenente il max
%trovo la riga
for i=1:length(Y)
    if (Y(i)==J)
        maxr=I(i);
    end
end
a_mv_exp=a(maxr); %parametri trovati con stima a massima verosimiglianza
b_mv_exp=b(maxc);

%traccio punti corrispondenti alle osservazioni e retta trovata con stima
%MV

l=a_mv_exp*t+b_mv_exp; %retta trovata
figure,plot(t,y,'ok'),hold on, plot(t,l)
