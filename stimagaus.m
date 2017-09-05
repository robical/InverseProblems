function [sigmam]=stimagaus(a,b,t,y,varia)

sigmam=1;
for i=1:11
    sigmam=sigmam*exp(-0.5*((a*t(i)+b-y(i))^2/4));
end

