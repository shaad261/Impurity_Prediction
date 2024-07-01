% plot(x,y)
   clc
       p1 =   0.0001703  
       p2 =     -0.0118  
       p3 =      0.8081  
       p4 =        41.3  
       
f = @(x) p1.*x.^3 + p2.*x.^2 + p3.*x + p4
% Coefficients (with 95% confidence bounds):
  fplot(f,[0 100])