function [ A1,A2,A3,A4,B1,B2,B3 ] = sigma( x,y )
A1=0;

for i=1:size(x)
    A1=A1+x(i);
end
B1=0;
for i=1:size(y)
    B1=B1+y(i);
end
A2=0;
for i=1:size(x)
    A2=A2+x(i)*x(i);
end
B2=0;
for i=1:size(x)
    B2=B2+x(i)*y(i);
end
A3=0;
for i=1:size(x)
    A3=A3+x(i)*x(i)*x(i);
end
A4=0;
for i=1:size(x)
    A4=A4+x(i)*x(i)*x(i)*x(i);
end
B3=0;
for i=1:size(x)
    B3=B3+x(i)*x(i)*y(i);
end

end
