%esp sismico 2
%determinare lunghezza del cavo per sondare riflettori a : 1km, 3km, 5km
%con angolo di incidenza 30 gradi

clear all;
clc;

ps=15; %prof sorg
pr=10; %prof ricevitori
[rx1,sor1]=sism(30,1000,ps,pr);
l1=rx1-sor1; %lunghezza cavo sismico in metri per riflettore a 1km
[rx3,sor3]=sism(30,3000,ps,pr);
l3=rx3-sor3; %lunghezza cavo sismico in metri per riflettore a 3km
[rx5,sor5]=sism(30,5000,ps,pr);
l5=rx5-sor5; %lunghezza cavo sismico in metri per riflettore a 5km

disp('Per il riflettore a 1km di profondità serve un cavo sismico lungo [km]: '), l1/1e3
disp('Per il riflettore a 3km di profondità serve un cavo sismico lungo [km]: '), l3/1e3
disp('Per il riflettore a 5km di profondità serve un cavo sismico lungo [km]: '), l5/1e3