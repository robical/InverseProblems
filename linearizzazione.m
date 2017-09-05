%linearizzazione
clc;
clear all;
close all;

 %plotting e trovo punto di lavoro
 m2=linspace(0,1.6,100000);
 plot(m2,log(1+m2),'g-'),hold on,plot(m2,(5-exp(2*m2)),'r-')
 for i=1:100000
 if(log(1+m2(i))-(5-exp(2*m2(i)))<1e-4 && log(1+m2(i))-(5-exp(2*m2(i)))>1e-5)
     hold on,plot(m2(i),(5-exp(2*m2(i))),'*');
     m10=(5-exp(2*m2(i)));
     m20=m2(i);
 end
 end
 
 m=[m10; m20]; %fisso i parametri del modello sul punto di lavoro
 dobs=[5; 0]; %dati osservati
 
 %Sviluppo jacobiana linearizzata
 
 G=[1 2*exp(2*m20);exp(m10) -1];
 
 %dati osservati dal punto di lavoro
 
 d=G*m;
 
 %plotto le approssimanti lineari
 hold on, plot(m2,(d(1)-G(1,2)*m2),'b-'),hold on,plot(m2,1/G(2,1)*(d(2)+m2),'m')
 
 %stima del modello
 Gin=inv(G);
 mst=Gin*dobs; %stimo i parametri del modello a partire dai dati osservati dal punto di lavoro
 
 %ricalcolo i dati
 dric=G*mst; %dato ricalcolato
 
 disp('Dati osservati: '); [5;0]
 disp('Dati osservati dal punto di lavoro: '); d
 disp('Modello stimato: '); mst
 disp('Dati ricalcolati da modello stimato: '); dric
 disp('Residuo iniziale in norma 2: '); norm([5;0]-d)
 disp('Residuo finale in norma 2: '); norm(d-dric)