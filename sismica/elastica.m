% Parametrizzazione dell'interfaccia elastica con lentezze di prop e
% densità


the=[5 10 15 20 25];
b2=2;
a2=50;
for i=1:3
    for v=1:5
        switch (i)
            case {1}
                G(v,i)=1/2+1/2*(sin(the(v))^2);
            case {2}
                G(v,i)=-4*(b2/a2)*(sin(the(v))^2);
            case {3}
                G(v,i)=0.5-2*(b2/a2)*(sin(the(v))^2);
        end
    end
end