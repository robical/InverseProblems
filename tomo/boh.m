% Inversione dati rumorosi
clear all;
clc;
close all;

load dn;
%Modello di vertical Seismic Profile con 30 sorgenti e 20 ricevitori, e
%dimensioni del modello 20x20 pixels
[G,RegDx,RegDy,RegD2x,RegD2y,RegLap] = ServizioVSP(30, 30, 30, 20);

%Creazione del modello di lentezza
m_ret1 = modello(30, 20, [8,3], [12,7], 0.134); %0.2 è l'ampiezza dell'anomalia rispetto al background
m_q1= modello(30, 20, [8,3], [9,4], 0.4);
m_q2= modello(30, 20, [11,3], [12,4], 0.4);
m_ret2= modello(30, 20, [9,6], [11,7], -0.4);
m_q2 = m_q2-ones(size(m_q2));
m_ret2 = m_ret2-ones(size(m_ret2));
m_q1=m_q1+m_q2+m_ret2;
figure,imagesc(m_q1),caxis([0 1.4]),title('Modello corretto')
figure,imagesc(m_ret1),caxis([0 1.4]),title('Modello supposto')

%Creazione dei dati
mv1=reshape(m_ret1,size(m_ret1,1)*size(m_ret1,2),1);
mv2=reshape(m_q1,size(m_q1,1)*size(m_q1,2),1);
dc1=G*mv1;
dc2=G*mv2;
figure,imagesc(reshape(dc1,30,30)'),colormap(1-gray)
figure,imagesc(reshape(dc2,30,30)'),colormap(1-gray),title('Dati calcolati con modello corretto')
%residuo
res1=dn-dc1;
res2=dn-dc2;
figure,imagesc(reshape(res1,30,30)'),colormap(1-gray),title('Residuo nello spazio dei dati supponendo anomalia 1 rettangolo')
figure,imagesc(reshape(res2,30,30)'),colormap(1-gray),title('Residuo nello spazio dei dati con modello corretto')









%Regolarizzazione
mu=linspace(1e-1,20,100);
dn=d+ 0.01*std(d)*randn(size(d));

%figure,
for i=1:length(mu)
Gp_dx=(G'*G+ mu(i)*RegDx'*RegDx)\G'; %regolarizzatore che minimizza la derivata prima in direz orizzontale
Gp_dy=(G'*G+ mu(i)*RegDy'*RegDy)\G';
Gp_lap=(G'*G+ mu(i)*RegLap'*RegLap)\G';
Rx=Gp_dx*G;
Ris_dx(:,i)=diag(Rx);
Ry=Gp_dy*G;
Ris_dy(:,i)=diag(Ry);
Rl=Gp_lap*G;
Ris_dl(:,i)=diag(Rl);

m_inv_dx(:,i)=Gp_dx*dn;
m_inv_dy(:,i)=Gp_dy*dn;
m_inv_dl(:,i)=Gp_lap*dn;

%subplot(4,2,i),imagesc(reshape(Ris_dy(:,i),30,30)),caxis([0 1])
dricx(:,i)=G*m_inv_dx(:,i); %dati ricalcolati
dricy(:,i)=G*m_inv_dy(:,i);
dricl(:,i)=G*m_inv_dl(:,i);
end

for i=1:size(dricy,2)
n_resy(i)=norm(dricy(:,i)-dn);
n_resx(i)=norm(dricx(:,i)-dn);
n_modx(i)=norm(m_inv_dx(:,i));
n_mody(i)=norm(m_inv_dy(:,i));
n_resl(i)=norm(dricl(:,i)-dn);
n_modl(i)=norm(m_inv_dl(:,i));


end

[valx,indx]=min((n_resx+n_modx));
[valy,indy]=min((n_resy+n_mody));
[vall,indl]=min((n_resl+n_modl));

figure,imagesc(reshape(m_inv_dx(:,indx),30,30)),caxis([0 1.2]),title('Reg Dx')
figure,imagesc(reshape(m_inv_dy(:,indy),30,30)),caxis([0 1.2]),title('Reg Dy')
figure,imagesc(reshape(m_inv_dl(:,indl),30,30)),caxis([0 1.2]),title('Reg Lap')

figure,subplot(1,2,1),imagesc(reshape(m_inv_dl(:,indl),30,30)),caxis([0 1.2]),subplot(1,2,2),imagesc(reshape(Ris_dl(:,indl),30,30)),caxis([0 1])
