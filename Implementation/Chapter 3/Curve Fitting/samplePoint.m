function [ X,Y ] = samplePoint( func )
input=zeros(1,20);
y=zeros(1,20);
for k=1:20
    input(k)=((7)^.5)+10-k;
    x=input(k);
    y(k)=eval(func);
end
X=input;
Y=y;
    

end

