%esperimento sismico 1
% ang=angoli di incidenza ai quali voglio sondare il riflettore
% prify = profondità del riflettore
% psy= profondità sorgenti
% pry = profondita ricevitori

function [rx,sor]=sism(ang,prify,psy,pry)

ang=[5 10 15 20 25 30];
ang=ang/180*pi; %trasformo in rad
ds=prify-psy; %distanza verticale sorgenti- riflettore in metri
dr=prify-pry; %distanza verticale ricevitori-riflettore in metri
for i=1:length(ang)
l1s(i)=ds/cos(ang(i));
l1r(i)=dr/cos(ang(i));
end
rx=l1r.*sin(ang); %posizioni ricevitori relative alla posizione del riflettore nella coordinata orizzontale
sor=-(l1s.*sin(ang)); %posizioni sorgenti relative alla posizione del riflettore nella coordinata orizzontale
