function y=sincs(T,fc,A)

for i=1:length(T)
if (T(i)==0)
    y(i)=A;
else
    y(i)=A*(sin(pi*T(i)/fc)./(pi/fc*T(i)));
end
end