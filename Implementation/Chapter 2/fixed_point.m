function r = fixed_point( func, a, b, max_step, tol, gfunc )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if(nargin == 6)
   r = fixed_point_iterator(func ,gfunc, a, b, max_step,tol);
   return;
end
disp('log(func(x)+exp(x))');
g = @(x)(log(func(x)+exp(x)));
r = fixed_point_iterator(func,g,a,b,max_step,tol);
if(~isnan(r))
    return;
end

disp('func(x)+x');
g = @(x)(func(x)+x);
r = fixed_point_iterator(func,g,a,b,max_step,tol);
if(~isnan(r))
    return;
end

g = @(x)(log(func(x)+1)+1);
r = fixed_point_iterator(func,g,a,b,max_step,tol);
if(~isnan(r))
    return;
end

g = @(x)(x*func(x) + x);
r = fixed_point_iterator(func,g,a,b,max_step,tol);
if(~isnan(r))
    return;
end

g = @(x)(sqrt(func(x) + x^2));
r = fixed_point_iterator(func,g,a,b,max_step,tol);
if(~isnan(r))
    return;
end

r = NaN;
end