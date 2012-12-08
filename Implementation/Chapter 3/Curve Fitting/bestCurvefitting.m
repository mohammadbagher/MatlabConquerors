function [funcreturn,func1,func2,func3,func4,func5,func6 ] = bestcurvefitting(axes, X , Y )
x=X;
y=Y;
func=0;
xfunc=sym('x');
n=length(x);
[A1,A2,A3,A4,B1,B2,B3]=mysigma(x ,y);
as1=(B2*A1-B1*A2)/(A1*A1-n*A2);
ay1=(B1-as1*n)/A1;
y1=ay1*x+as1;
func=sym(ay1*xfunc+as1);
func5=sym(ay1*xfunc+as1);
y_request=y1;
error1=MRS(y,y1);
r=error1;

ay2=((B3*A2-B1*A4)*(A1*A2-n*A3)-(B2*A2-B1*A3)*(A2*A2-n*A4))/((A2*A3-A1*A4)*(A1*A2-n*A3)-(A2*A2-A1*A3)*(A2*A2-n*A4));
as2=((B2*A2)-B1*A3-ay2*(A2*A2-A1*A3))/(A1*A2-n*A3);
ad2=(B1-as2*n-ay2*A1)/A2;
y2=as2+ay2*x+ad2*(x.*x);
error2=MRS(y,y2);
func6=expand(sym(as2+ay2*xfunc+ad2*(xfunc)^2));
if r>error2
   
    r=error2;
	y_request=y2;
    func=expand(sym(as2+ay2*xfunc+ad2*(xfunc)^2));
end

tempY=log(y);
[A1,A2,A3,A4,B1,B2,B3]=mysigma(x ,tempY);
as3=(B2*A1-B1*A2)/(A1*A1-n*A2);
ay3=(B1-as3*n)/A1;
y3=exp(as3).*exp(ay3*x);
error3=MRS(y,y3);
func1=expand(sym(exp(as3)*exp(ay3*xfunc)));
if r>error3

    r=error3;
y_request=y3;
func=expand(sym(exp(as3)*exp(ay3*xfunc)));

end

tempX=log(x);
[A1,A2,A3,A4,B1,B2,B3]=mysigma(tempX ,y);
as4=(B2*A1-B1*A2)/(A1*A1-n*A2);
ay4=(B1-as4*n)/A1;
y4=ay4.*log(x)+as4;
error4=MRS(y,y4);
func2=expand(sym(ay4*log(xfunc)+as4));
if r>error4

    r=error4;
y_request=y4;
func=expand(sym(ay4*log(xfunc)+as4));

end

tempY=1./y;
[A1,A2,A3,A4,B1,B2,B3]=mysigma(x ,tempY);
as4=(B2*A1-B1*A2)/(A1*A1-n*A2);
ay4=(B1-as4*n)/A1;
temparr=ones(size(x));
y5=temparr./(as4+ay4.*x);
error5=MRS(y,y5);
func4=expand(sym(1/(as4+ay4*xfunc)));
if r>error5
    r=error5;
y_request=y5;
func=expand(sym(1/(as4+ay4*xfunc)));

end
%%%%%%%%%%%%%%%%%
tempX=1./x;
[A1,A2,A3,A4,B1,B2,B3]=mysigma(tempX ,y);
as4=(B2*A1-B1*A2)/(A1*A1-n*A2);
ay4=(B1-as4*n)/A1;
temparr=ones(size(x));
y5=as4+(ay4*temparr./x);
error5=MRS(y,y5);
func3=expand(sym(as4+(ay4*temparr/xfunc)));
if r>error5
    r=error5;
y_request=y5;
func=expand(sym(as4+(ay4*temparr/xfunc)));

end
%%%%%%%%%%%%%%%%%%

plot(axes,x,y_request,'+');hold on;
xlabel('points');
ylabel('approximations');
plot(axes,X,Y,'or');
x=min(x):.1:max(x);

funcreturn=expand(func);
plot(axes,x,eval(func));
hleg1 = legend('approximatedpoints','firstpoints','bestCurvefitting');

end

