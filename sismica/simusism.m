% Problema di inversione sismica
clc;

angoli=[10 15 20 25 30]./180.*pi;
G=zeros(5,3);
for i=1:3
    for v=1:5
        switch (i)
            case {1}
                G(v,i)=1/(2*(cos(angoli(v)))^2);
            case {2}
                G(v,i)=-4/3*sin(angoli(v))^2;
            case {3}
                G(v,i)=0.5-1/(2*(cos(angoli(v)))^2)+2/3*sin(angoli(v))^2;
        end
    end
end

                