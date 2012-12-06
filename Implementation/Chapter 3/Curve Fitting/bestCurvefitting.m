function [ ] = bestcurvefitting( X , Y )
x=X;
y=Y;
n=1;
[A1,A2,A3,A4,B1,B2,B3]=sigma(x ,y);
as1=(B2*A1-B1*A2)/(A1*A1-size(x,1)*A2);
ay1=(B1-as1*size(x,1))/A1;
y1=ay1*x+as1;
y_request=y1;
error1=MRS(y,y1);
r=error1;

ay2=((B3*A2-B1*A4)*(A1*A2-size(x,1)*A3)-(B2*A2-B1*A3)*(A2*A2-size(x,1)*A4))/((A2*A3-A1*A4)*(A1*A2-size(x,1)*A3)-(A2*A2-A1*A3)*(A2*A2-size(x,1)*A4));
as2=((B2*A2)-B1*A3-ay2*(A2*A2-A1*A3))/(A1*A2-size(x,1)*A3);
ad2=(B1-as2*size(x,1)-ay2*A1)/A2;
y2=as2+ay2*x+ad2*(x.*x);
error2=MRS(y,y2);
if r>error2
    n=2;
    r=error2;
	y_request=y2;
end

tempY=log(y);
[A1,A2,A3,A4,B1,B2,B3]=sigma(x ,tempY);
as3=(B2*A1-B1*A2)/(A1*A1-size(x,1)*A2);
ay3=(B1-as3*size(x,1))/A1;
y3=exp(as3).*exp(ay3*x);
error3=MRS(y,y3);
if r>error3
    n=3;
    r=error3;
y_request=y3;

end

tempX=log(x);
[A1,A2,A3,A4,B1,B2,B3]=sigma(tempX ,y);
as4=(B2*A1-B1*A2)/(A1*A1-size(x,1)*A2);
ay4=(B1-as4*size(x,1))/A1;
y4=ay4.*log(x)+as4;
error4=MRS(y,y4);
if r>error4
    n=4;
    r=error4;
y_request=y4;

end

tempY=1./y;
[A1,A2,A3,A4,B1,B2,B3]=sigma(x ,tempY);
as4=(B2*A1-B1*A2)/(A1*A1-size(x,1)*A2);
ay4=(B1-as4*size(x,1))/A1;
temparr=ones(size(x));
y5=temparr./(as4+ay4.*x);
error5=MRS(y,y5);
if r>error5
    n=5;
    r=error5;
y_request=y5;

end

plot(x,y_request);hold on;
for g=1:n
    plot(X(g),Y(g),'or');
end


end

