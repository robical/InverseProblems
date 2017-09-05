
%Disegno forma quadratica (paraboloide in R2)

m1=-5:.1:5;
m2=-5:.1:5;
for i=1:length(m1)
    for j=1:length(m2)
        t(i,j)=m1(i)^2+m2(j)^2;
    end
end

surf(t)

%aggiungo vincolo

% m1+m2=20;
% m1=20-m2;
% m1+m2-20=0; <-- forma nulla

i=1;
for m1=-5:.1:5
    temp1=m1*ones(1,length(m1));
    m2=8*temp1+(30);
    h(:,i)=m2;
    i=i+1;
end

hold on,surf(h)