function [ A1,A2,A3,A4,B1,B2,B3 ] = mysigma( x,y )
A1=0;

for i=1:length(x)
    A1=A1+x(i);
end
B1=0;
for i=1:length(y)
    B1=B1+y(i);
end
A2=0;
for i=1:length(x)
    A2=A2+x(i)^2;
end
B2=0;
for i=1:length(x)
    B2=B2+x(i)*y(i);
end
A3=0;
for i=1:length(x)
    A3=A3+x(i)^3;
end
A4=0;
for i=1:length(x)
    A4=A4+x(i)^4;
end
B3=0;
for i=1:length(x)
    B3=B3+x(i)^2*y(i);
end

end

