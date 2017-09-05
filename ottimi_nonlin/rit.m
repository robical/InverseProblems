function y=rit(yr,d,dur,N)
%VARIABILI IN:
%yr=segnale completo su traccia
%d=ritardo(+)/anticipo(-)
%dur=durata della forma d'onda
%N=durata della traccia

if (d>=0)
    i=1;
    while(yr(i)==0)
    i=i+1;
    end
    count=i-1;
    y=[zeros(1,count+d) yr(1,count+1:count+1+dur) zeros(1,N-dur-count-d-1)];
else
    i=1;
    while(yr(i)==0)
    i=i+1;
    end
    count=i-1; %mi dice quanti zeri ho prima del segnale
    y=[zeros(1,count-d) yr(1,count+1:count+1+dur) zeros(1,N-dur-count+d-1)];
end