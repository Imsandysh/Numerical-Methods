function [a,r2] = myLinearRegression(x,y)
% compute the necessary quantities that appear in the normal equations
n = length(x);
% compute the mean value of the given data:
xb = mean(x);
yb = mean(y);
sumx = sum(x);
sumy = sum(y);
x2 = x.*x;
sumx2 = sum(x2);
xy = x.*y;
sumxy = sum(xy);
% form the system of linear equations:
A = [n, sumx; sumx, sumx2]
b = [sumy; sumxy]

% solve for coeffecients
a = A \ b;
a0 = a(1)
a1 = a(2)
% form the equation of the linear fit
yl = a0 + a1*x
% compute the total sum of the squares around the mean of y:
St = sum((y - yb).^2);
% compute the sum of the squares of the residuals between the measured y
% and the y calculated with the linear model:
Sr = sum((y - yl).^2);
% compute the standard error of the estimate:
Syx = sqrt(Sr/(n-2));
% compute the standard deviation:
stan_dev = sqrt(St/(n-1));


% compute the coefficient of determination:
r2 = (St - Sr)/St;

res = [a0,a1,r2,Syx];
results = array2table(res,...
'VariableNames',{'Coefficient_a0', 'Coefficient_a1', 'Determination_Coeffecient','Standard_err_of_estimate'})
end

