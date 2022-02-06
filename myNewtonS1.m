function [sol] = myNewtonS1(f,j,x0,tol,maxit)
% Description of function
%f is a function handle, to be defined as an anonymous function within the script that
%calls myNewtonS1

%j is a function handle, to be defined as an anonymous function within the script; j is
%being called and used within myNewtonS1,

%x0 is the initial guess for the root,

%tol is the error tolerance in %,

%maxit is the maximum number of iterations

%sol an array or table that stores for every iteration the following information: number of Iteration, the approximate roots, the value of the function froot at the
%approximated roots, the approximate relative percent error ea.

ea = 1+tol; % approximate percent error
i = 1; % initializing iterations
sol = [i, x0', f(x0)', NaN, ea]; % Intial Value of Result
x_old = x0; %Setting up initial guess

% While loop to enter interations to minimize error
while ea>tol && i < maxit  %Boundary Conditions set
    i = i+1 % Updating Iteration
    
   dx = -j(xold)\f(xold); % Change in Y/Change in X 
   xnew = xold + dx; % new estimate of error
   
   ea = norm(xnew-xold); % Calculating approximate error
   
   res = norm(f(xnew)-f(xold)); % Calculating residual of Objective function
   
   xold = xnew; % Updating oldvalue with new value
   
   % Storing the results
   
   sol(i,:) = [i,xnew',f(xnew)',res,ea];
end

% Array of Results
NewtonS2_results = array2table(sol,...
'VariableNames',{'Iterations', 'root_x', 'root_y','f_root_x', 'f_root_y','Residual', 'RelativeError'})

% Printing roots
sprintf('The roots are x_r=%f and y_r=%f', xnew(1), xnew(2))
sprintf('The value of the function at the root is F(xr)=%e',f(xnew))

end
   
   


