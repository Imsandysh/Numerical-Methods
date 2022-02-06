function [t,y] = myEuler(F,y0,ti,tf,h)
t = ti:h:tf;
y = zeros(length(y0),length(t));
y(:,1) = y0;
for i = 2:length(t)
    y(:,i) = y(:,i-1) + F(t(i-1),y(:,i-1))*h;
end
end
    