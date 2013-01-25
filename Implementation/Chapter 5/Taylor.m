function [ ans1 ] = Taylor( func , x0 ,y0 , h ,order ,x_request)
func=subs(func);

syms x;
syms y;
n=(x_request-x0)/h;
tempy=y+h*func;
temph=h;
tempfunc=func;

for i=2:order
    temph=temph*h/i;
    func=diff(func,x)+tempfunc*diff(func,y);
    tempy=tempy+temph*func;
end

ans1(1,2)=y0;
ans1(1,1)=x0;
x0=x0+h;


for j=2:n
    ans1(j,1)=x0;
    ans1(j,2)=subs(tempy,[x y],[x0-h, ans1(j-1,2)]);
    x0=x0+h;
end

end