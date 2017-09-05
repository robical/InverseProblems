function ris=metrop(df,T)
%devo rifiutare il punto candidato o accettarlo, sulla base della
%probabilit� di Gibbs, che dipende dalla temperatura e dall'energia df
%L'energia df rappresenta la differenza della misura della funzione costo
%nel punto candidato
p=exp((df/T));
rand('state',sum(100*clock));
c=rand;
if (p<c)
    ris=0; %rifiuto il punto
else
    ris=1; %accetto il punto
end
