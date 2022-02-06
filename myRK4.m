function [t,y] = myRK4(F,y0,ti,tf,h)
t = ti:h:tf;
y = zeros(length(y0),length(t));
% store the initial condition:
y(:,1) = y0;
% start the iterative process of RK-4:
for i = 2:length(t)

 %
 k1 = h*F( t(i-1), y(:,i-1) );
 %
 t2 = t(i-1) + h*0.5;
 f2 = y(:,i-1) + 0.5*k1;
 %
 k2 = h*F(t2, f2);
 %
 f3 = y(:,i-1) + 0.5*k2;
 k3 = h*F(t2, f3);
 %
 f4 = y(:,i-1) + k3;
 k4 = h*F(t(i), f4);
 %
 y(:,i) = y(:,i-1) + (k1 + 2*k2 + 2*k3 + k4 )/6;
 %
end
end


