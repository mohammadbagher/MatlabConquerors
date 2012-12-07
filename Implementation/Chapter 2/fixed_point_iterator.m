function root = fixed_point_iterator( gfunc, start, max_step, tol )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
xis = zeros(max_step,1);
xis(1,1) = start;
errs
for i=2:max_step+1
    xis(i,1) = feval(gfunc,xis(i-1));
    if(abs(xis(i,1)-xis(i-1,1))<tol)
        root = xis(i,1);
        return;
    end
end

end
