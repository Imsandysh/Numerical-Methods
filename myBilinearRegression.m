function [ abc, r2 ] = myBilinearRegression( x, y, z )
% fit a straight line:
n =length(x);
A = [n sum(x) sum(y); sum(x) sum(x.^2) sum(x.*y); sum(y) sum(x.*y) sum(y.^2)];
b = [sum(z); sum(x.*z); sum(y.*z)];
xb = mean(x);
yb = mean(y);
zb = mean(z);
abc = A \ b;
a = abc(1)
b = abc(2)
c = abc(3)
% form the equation of the linear fit
zp = a + b*x + c*y
% compute the total sum of the squares around the mean of y:
St = sum((z - zb).^2);
% compute the sum of the squares of the residuals between the measured y
% and the y calculated with the linear model:
Sr = sum((z - zp).^2);
% compute the standard error of the estimate:
Syx = sqrt(Sr/(n-2));
% compute the standard deviation:
stan_dev = sqrt(St/(n-1))
% compute the coefficient of determination:
r2 = (St - Sr)/St;

res = [a,b,c,r2,Syx];
results = array2table(res,...
'VariableNames',{'Coefficient_a0', 'Coefficient_a1','Coeffeicient_a2', 'Determination_Coeffecient','Standard_err_of_estimate'})
end



