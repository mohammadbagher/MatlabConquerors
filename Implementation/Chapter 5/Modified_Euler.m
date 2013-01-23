function [ ans1 ] = Modified_Euler( func , x0 ,y0 , h ,x_request )
ans1=Runge_kutta( func , x0 ,y0 , h ,x_request,0.5 );


end

