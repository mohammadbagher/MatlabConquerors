function intervals = interval_of_roots(func, a, b, delta )
%finds subintervals of [a b] that bolzano condition aplly in them, means
%that finds subintervals with one root in them.
%   Detailed explanation goes here
format long;
n = ceil((b-a)/delta)-1;
intervals = zeros(0);
for i=1:n
    s = a+(i-1)*delta;
    e = a+i*delta;
    if(feval(func,s)*feval(func,e)< 0.0)
        t = size(intervals,1);
        intervals(t+1,1) = s;
        intervals(t+1,2) = e; 
    end
end
s = a+n*delta;
e=b;
if(feval(func,s)*feval(func,e)< 0.0)
    t = size(intervals,1);
    intervals(t+1,1) = s;
    intervals(t+1,2) = e; 
end

end