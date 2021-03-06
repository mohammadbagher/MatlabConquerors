function root = bisection(func,x1,x2,max_step,tol)
% Finds a bracketed zero of f(x) by bisection.
% USAGE: root = bisection(func,x1,x2,filter,tol)
% INPUT:
% func = handle of function that returns f(x).
% x1,x2 = limits on interval containing the root.
% max_step = maximum number of steps.
% tol = error tolerance (default is 1.0e4*eps).
% OUTPUT:
% root = zero of f(x), or NaN if singularity suspected.
f1 = feval(func,x1);
if f1 == 0.0; 
    root = x1; 
    return; 
end
f2 = feval(func,x2);
if f2 == 0.0; 
    root = x2; 
    return; 
end
if f1*f2 > 0;
   root = NaN;
end
xis = zeros(max_step,1);
xis(1,1) = x1;
xis(2,1) = x2;

for i = 3:max_step+2
    xis(i,1) = 0.5*(xis(i-1,1) + xis(i-2,1));
    f3 = feval(func,xis(i,1));
    f2 = feval(func,xis(i-1,1));
    if(abs(xis(i,1)-xis(i-1,1))<=tol )
        root = xis(i,1);
        return;
    end
    if f3 == 0.0
        root = xis(i,1); return;
    end
    if f2*f3 < 0.0
        x1 = xis(i,1);
    else
        x2 = xis(i,1);
    end
end
root = (x1 + x2)/2;