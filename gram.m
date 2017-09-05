%costruzione base ortonormale in RN con Gram-Schmitd
function [E]=gram(A)

N=size(A,1); %A è quadrata, contiene vettori a caso lunghi N
if (size(A,2)<N || size(A,2)<N)
    return;
end
E(:,1)=A(:,1); %vettore 1 è uguale
E(:,1)=E(:,1)/norm(E(:,1)); %lo normalizzo
for j=2:N
    E(:,j)=A(:,j);
    for h=j-1:-1:1
    E(:,j)=E(:,j)-(E(:,j)'*E(:,h))*E(:,h);
    end
    E(:,j)=E(:,j)/norm(E(:,j));
end
