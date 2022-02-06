function [ a, r2 ] = myQuadraticRegression( x, y )
% fit a straight line:
n =length(x);
A = [n sum(x) sum(x.^2); sum(x) sum(x.^2) sum(x.^3); sum(x.^2) sum(x.^3) sum(x.^4)];
b = [sum(y); sum(x.*y); sum(x.^2.*y)];
xb = mean(x);
yb = mean(y);
a = A \ b;
a0 = a(1)
a1 = a(2)
a2 = a(3)
% form the equation of the linear fit
yp = a0 + a1*x + a2*(x.^2)
% compute the total sum of the squares around the mean of y:
St = sum((y - yb).^2);
% compute the sum of the squares of the residuals between the measured y
% and the y calculated with the linear model:
Sr = sum((y - yp).^2);
% compute the standard error of the estimate:
Syx = sqrt(Sr/(n-2));
% compute the standard deviation:
stan_dev = sqrt(St/(n-1))
% compute the coefficient of determination:
r2 = (St - Sr)/St;

res = [a0,a1,a2,r2,Syx];
results = array2table(res,...
'VariableNames',{'Coefficient_a0', 'Coefficient_a1','Coeffeicient_a2', 'Determination_Coeffecient','Standard_err_of_estimate'})
end



