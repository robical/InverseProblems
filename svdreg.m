%inversione ai minimi quadrati con regolarizzazione di Tychonov

function [R,m]=reg(A,mu,dati)

m=((A'*A)+mu*eye(length(A')))^(-1)*A'*dati; %dumping con mu

R=((A'*A)+mu*eye(length(A')))^(-1)*A'*A;   %matrice di risoluzione con regolarizzazione

norm(m),    %norma di m dopo regolarizzazione

norm(A*m-dati) %norma del residuo