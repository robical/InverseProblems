% Inversione del modello di velocità a partire dai dati rumorosi che ci ha
% inviato
clear all;
close all;
clc;

load dn;


[G,RegDx,RegDy,RegD2x,RegD2y,RegLap] = ServizioVSP(30, 30, 30, 20);

Gp_dx=(G'*G+ 0.001*RegDx'*RegDx)\G';
Gp_dy=(G'*G+ 0.001*RegDy'*RegDy)\G';
Gp_lap=(G'*G+ 0.001*RegLap'*RegLap)\G';
m_dx=Gp_dx*dn;
m_dy=Gp_dy*dn;
m_lap=Gp_lap*dn;
m_med=(m_dx+m_dy)./2;

figure,imagesc(reshape(m_med,20,30)),caxis([0 1.4])
figure,imagesc(reshape(m_lap,20,30)),caxis([0 1.4])

%damping puro
mu=linspace(1e-3,1e-1,50);
for i=1:length(mu)
Gp_d=(G'*G+ mu(i)*RegDy'*RegDy)\G';
m_d(:,i)=Gp_d*dn;
dric(:,i)=G*m_d(:,i);
nres(i)=norm(dn-dric(:,i));
nmod(i)=norm(m_d(:,i));
end

[val ind]=min((nres+nmod));
Gp_d=(G'*G+ mu(ind)*eye(size(G'*G)))\G';
R=Gp_d*G;
Ris=diag(R);

figure,imagesc(reshape(Ris,20,30)),caxis([0 1])
figure,imagesc(reshape(m_d(:,ind),20,30)),caxis([0 1.4])
