function [ calc, exact, err, h, n, RombergTable] = romberg( func, a, b, horn, horn_code, plot1, p )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
format long;
switch horn_code
    case 1
        h = horn;
        n = (b-a)/h;
    case 2
        n = horn;
        h = (b-a)/n;
end
H=zeros(p+1,1);
for i=0:p
    H(i+1,1)= (b-a)/2^i;
end
RombergTable = zeros(p+1);
for i=1:p+1
    for j= i:p+1
        if(i==1)
            RombergTable(j,i)=trapezoidal(func,a,b,H(j,1),1,0);
        else
            RombergTable(j,i)=(4^(i-1)*RombergTable(j,i-1)-RombergTable(j-1,i-1))/(4^(i-1)-1);
        end
    end
end
calc=RombergTable(p+1,p+1);
exact = integral(func, a, b);
err = abs(calc-exact);


end