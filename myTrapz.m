function [It] = myTrapz(y,a,b,n)
   %y = Data to be integrated
   %a = first point
   %b = end point
   %n = no. of elements - 1 = no. of intervals
    h = (b - a)/n; % defining the increment interval
    % defining the Trapezoindal interval Integral equation
    It = 0.5*h*(y(1) + 2*sum(y(2:end-1)) + y(end));
end