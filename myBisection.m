
function [sol] = myBisection(f, xl, xu, tol, maxit)
% f is fuction handle defined as an anonymous fuction
% xl, xu are the lower and upper limits that brackets the root
% tol is the error tolerance in %
% maxit is maximum number of iterations

xr = (xl + xu)/2; % Estimation of first root

% initializing the iteration
i = 0;
x_max = fzero(f, xl); % Calculating true root using fzero function
et = abs((x_max - xr)/x_max)*100; % Calculating true error
% creating an array for results:
sol = [i, xr, f(xr), NaN, et];


while abs(f(xr)) > tol && i < maxit
    i = i + 1; %updating the number of iterations
    xold = xr; % assigning old x 
    
    % updating the "Bisection Method" brackets:
    if f(xl)*f(xr) < 0
        xu = xr;
    elseif f(xl)*f(xr) > 0
        xl = xr;
    else
        break
    end
    
    xr = (xl + xu)/2; % getting the new estimate of the root
    et = abs((x_max - xr)/x_max)*100; % Updating True Error
    ea = abs((xr - xold)/xr)*100; % calculating the realtive error
    sol(i, :) = [i, xr, f(xr), ea, et];
end

sprintf('The root (using Bisection Method) is %f', xr) % printing the root
sprintf('The value of the function at the root is %e', f(xr))
Bisection_resultsT = array2table(sol,.....
    'VariableNames',{'Iterations', 'ApproximateRoot', 'frootAtApproximateRoot', 'RelativeError','TrueError'})
end

