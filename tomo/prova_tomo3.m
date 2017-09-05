%creazione colormap per vedere bene il modello invertito

map=[linspace(0,1,8)' linspace(0,1,8)' linspace(0,1,8)'];
mape=zeros(64,3);
k=1;
for i=1:8
mape(k:k+7,:)=ones(8,3)*map(i,1);
k=k+8;
end

%ESPERIMENTO 9

%10000 realizzazioni di dati rumorosi
k=0.01; %fattore deviaz standard del rumore
dn=zeros(600,10000);
for i=1:10000
dn(:,i)= d+ (k*std(d))*randn(size(d));
end

%10000 modelli invertiti da realizzazioni, cioè dati osservati (che contengono il dato vero più un rumore gaussiano bianco additivo) 
Gp=pinv(G'*G,0.09 )*G'; %<--- invertitore SVD troncato, tronca tutti gli auto
%valori e dunque le matrici di rango 1 formate dalla coppia di autovettori dello 
%spazio dei dati e del modello corrispondenti inferiori al valore di
%tolleranza TOL
minv_dump=zeros(400,10000);

for i=1:10000
    minv_dump(:,i)=Gp*dn(:,i);
end

%medio un certo numero di realizzazioni per neutralizzare il rumore
M=10;
minvv=zeros(400,1);
for i=1:M
minvv=minvv+minv_dump(:,i);
end

minvv=minvv/M;
figure,imagesc(reshape(minvv,20,20)),colormap(mape)



%figure,subplot(2,1,1),plot([1 10 100 1000 10000],nm),title('Norma dell''errore nello spazio del modello'),
%subplot(2,1,2),plot([1 10 100 1000 10000],nd),title('Norma dell''errore nello spazio dei dati')

