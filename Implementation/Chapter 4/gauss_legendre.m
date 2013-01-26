function [ calc, exact, err, h, n, table] = gauss_legendre( func, a, b, horn, horn_code, plot1, p )
%UNTITLED5 Summary of this function goes here
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
eq_0 = [1];
eq_1 = [1 0];

for i=2:p
    something = conv([zeros(1,size(eq_1,2)-2) 1 0],eq_1);
    otherthing = [zeros(1,size(something,2)-size(eq_0,2),1),eq_0];
    eq_temp = 1/i*((2*i-1)*something-(i-1)*otherthing);
    eq_0 = eq_1;
    eq_1 = eq_temp;
end
xis = roots(eq_1);
wis = zeros(size(xis,1),1);
changed_func = @(t)(b-a)/2*((b-a)/2*t+(b-a)/2);
calc = 0;
for i=1:size(xis)
    lk = polyval(polyder(eq_1),xis(i,1));
    wis(i,1) = 2/((1-xis(i,1).*xis(i,1))*lk*lk);
    calc = calc+wis(i,1)*feval(changed_func,xis(i,1));
end
exact = integral(func, a, b);
err = abs(calc-exact);
table = [xis, wis];

end

