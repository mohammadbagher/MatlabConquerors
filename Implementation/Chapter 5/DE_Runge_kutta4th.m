function [ ans1 ] = DE_Runge_kutta4th( f,x0,f0,g,g0,h,x_request )
syms x;
syms y;
syms z;
n=(x_request-x0)/h+1;
f=subs(f);
g=subs(g);
k11=subs(f,[x y z],[x0,f0,g0]);
k21=subs(g,[x y z],[x0,f0,g0]);

k12=subs(f,[x y z],[x0+h/2,f0+h/2*k11,g0+h/2*k21]);
k22=subs(g,[x y z],[x0+h/2,f0+h/2*k11,g0+h/2*k21]);

k13=subs(f,[x y z],[x0+h/2,f0+h/2*k12,g0+h/2*k22]);
k23=subs(g,[x y z],[x0+h/2,f0+h/2*k12,g0+h/2*k22]);

k14=subs(f,[x y z],[x0+h,f0+h*k13,g0+h*k23]);
k24=subs(g,[x y z],[x0+h,f0+h*k13,g0+h*k23]);

ans1(1,1)=x0;
ans1(1,2)=f0+h/6*(k11+2*k12+2*k13+k14);
ans1(1,3)=g0+h/6*(k21+2*k22+2*k23+k24);

for i=2:n
    x0=x0+h;
    
    k11=subs(f,[x y z],[x0,ans1(i-1,2),ans1(i-1,3)]);
    k21=subs(g,[x y z],[x0,ans1(1-1,2),ans1(i-1,3)]);

    k12=subs(f,[x y z],[x0+h/2,ans1(i-1,2)+h/2*k11,ans1(i-1,3)+h/2*k21]);
    k22=subs(g,[x y z],[x0+h/2,ans1(i-1,2)+h/2*k11,ans1(i-1,3)+h/2*k21]);

    k13=subs(f,[x y z],[x0+h/2,ans1(i-1,2)+h/2*k12,ans1(i-1,3)+h/2*k22]);
    k23=subs(g,[x y z],[x0+h/2,ans1(i-1,2)+h/2*k12,ans1(i-1,3)+h/2*k22]);

    k14=subs(f,[x y z],[x0+h,ans1(i-1,2)+h*k13,ans1(i-1,3)+h*k23]);
    k24=subs(g,[x y z],[x0+h,ans1(i-1,2)+h*k13,ans1(i-1,3)+h*k23]);

    ans1(i,1)=x0;
    ans1(i,2)=ans1(i-1,2)+h/6*(k11+2*k12+2*k13+k14);
    ans1(i,3)=ans1(i-1,3)+h/6*(k21+2*k22+2*k23+k24);
    
end

end

