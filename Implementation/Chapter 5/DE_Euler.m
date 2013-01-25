function [ ans1 ] = DE_Euler( f,x0,f0,g,g0,h,x_request )

syms x;
syms y;
syms z;
n=(x_request-x0)/h+1;
f=subs(f);
g=subs(g);
ans1(1,1)=x0;
ans1(1,2)=f0+h*subs(f,[x y z],[x0,f0,g0]);
ans1(1,3)=g0+h*subs(g,[x y z],[x0,f0,g0]);

for i=2:n
    x0=x0+h;
    ans1(i,1)=x0;
    ans1(i,2)=ans1(i-1,2)+h*subs(f,[x y z],[x0,ans1(i-1,2),ans1(i-1,3)]);
    ans1(i,3)=ans1(i-1,3)+h*subs(g,[x y z],[x0,ans1(i-1,2),ans1(i-1,3)]);
    
end



end

