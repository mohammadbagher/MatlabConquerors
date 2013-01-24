function [ ans1 ] = Runge_kutta( func , x0 ,y0 , h ,x_request,a )

b=1-a;
alphabeta=1/(2*b);

syms x;
syms y;

n=(x_request-x0)/h;
func=subs(func);

k1=h*func;
k2=h*subs(func,[x y],[x+alphabeta*h,y+alphabeta*k1]);

tempy=y+a*k1+b*k2;

ans1(1,2)=y0;
ans1(1,1)=x0;
x0=x0+h;

for i=2:n
    ans1(i,1)=x0;
    ans1(i,2)=subs(tempy,[x y],[x0-h, ans1(i-1,2)]);
    x0=x0+h;
end

end


