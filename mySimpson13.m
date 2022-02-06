function [Is] = mySimpson13(y,a,b,n)
%y = Data to be integrated
   %a = first point
   %b = end point
   %n = no. of elements - 1 = no. of intervals
h = (b-a)/n; % defining Increment Interval
    % defining the Simpson1/3 Integral equation
Is = (y(1) + 2*sum(y(2:2:end-2)) + 4*sum(y(3:2:end-1)) + y(end))*(h/3);
end