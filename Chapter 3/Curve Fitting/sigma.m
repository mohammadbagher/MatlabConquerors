function [ A1,A2,B1,B2 ] = sigma( x,y )
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

end

