% Funzione:
% Parametrizzazione del processo fisico di misura con radiometro del
% contenuto di vapor acqueo dell'atmosfera, questa funzione crea lo
% jacobiano della funzione che lega il contenuto di vapore acqueo in ogni
% cella con la misura della potenza ricevuta dal radiometro da una
% particolare angolazione
%
% Parametri:
% N_mod=dimensione dello spazio del modello
% N_dat= dimensione dello spazio dei dati
% lar=larghezza cella
% alt=altezza cella
% angoli= vettore degli angoli di misura del dispositivo di acquisizione

function [G]=jacob(angoli,lar,alt,N_mod,N_dat)

for i=1:N_dat %per ogni angolo
    for v=1:N_mod %per ogni cella del modello, cioè colonna
        beta=(pi/2)-angoli(i,1)*(pi/180);
        if (beta<=acos(2/(sqrt(alt^2+lar^2))))
            if (v==1)
            G(i,v)=alt/cos(beta);
            else
                G(i,v)=0;
            end
        
        elseif (beta>acos(2/(sqrt(alt^2+lar^2))) && beta<=acos(2/(sqrt(alt^2+(2*lar)^2))))
            
            if (v==1)
            G(i,v)=lar/sin(beta);
            resalt=alt-(G(i,v)*cos(beta));
            elseif (v==2)
                G(i,v)=resalt/cos(beta);
            else
                G(i,v)=0;
            end
                
        else
            
            if (v==1 || v==2)
                G(i,v)=lar/sin(beta);
                resalt1=alt-(2*G(i,v)*cos(beta));
            else
                G(i,v)=resalt1/cos(beta);
            end
        
        end
    end
end

