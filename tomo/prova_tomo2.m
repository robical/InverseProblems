%perturbazione di mu
% mu=1e-16;
% for i=1:16
%     muu(i)=mu*10^i;
%     Gp_dump=(G'*G + eye(size(G'*G))*muu(i))\G';
%     traccia(i)=trace(Gp_dump*G); %risoluzione
% end
% 
% figure,plot(muu,traccia)


%Inversione con dumping

mu=1e-19;

figure(1),
for i=1:4
    muu=mu*10^(4*i);
    Gp_dump=(G'*G + eye(size(G'*G))*muu)\G'; %inversa con dumping
    minv_dump=Gp_dump*d;
    dric_dump=G*minv_dump;
    res=d-dric_dump;
    mu_s=num2str(muu,10);
    tit='Inversione con dumping, mu= ';
    titl=strcat(tit,mu_s);
    subplot(2,2,i),imagesc(reshape(minv_dump,20,20)),title(titl),colorbar
    disp('Norma del modello : '),norm(minv_dump),
    disp('Norma del residuo nei dati: '),norm(res),
    disp('Fattore di dumping: '),muu
    pause,
end

    

%inversione modello con SVD, con tolleranza su max autovalore piccolo da
%tenere
%hist(diag(diag(D)))
close all;

g=1;
minv_svd=zeros(400,1);
i=1;
while(D(i,i)>g)
    minv_svd=minv_svd+V(:,i)*(1/D(i,i))*U(:,i)'*d;
    i=i+1;
end
disp('Numero di autovettori usati: '),i
disp('Tolleranza : '),g
k=0;
for i=1:length(minv_svd)
    if (minv_svd(i)>1e-8)
        k=k+1;
    end
end
disp('Numero di celle del modello con valore diverso da zero: '),k

figure,imagesc(reshape(minv_svd,20,20))

%Dati ricalcolati

dric_svd=G*minv_svd; %da SVD troncata
dric_dump=G*minv_dump; %da inversa fatta con dumping



%RUMORE NEI DATI
k=0.1;
dn= d+ k*std(d)*randn(size(d)); % se vario k cambia la varianza, cioè la potenza di rumore nei dati, perchè il rumore è gaussiano bianco in questo caso
figure,plot(d,dn)