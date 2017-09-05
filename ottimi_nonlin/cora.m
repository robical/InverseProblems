%Algoritmo di aggiornamento del passo di Corana
function ri=cora(q)

for i=1:length(q)
if(q(i)>0.6)
    ri(i)=1+2*((q(i)-0.6)/0.4);
     %ho provato a invertirli
elseif(q(i)<0.4)
    ri(i)=1/(1+2*((0.4-q(i))/0.4));
    
else
    ri(i)=1;
end
end
  
    