x = linspace(-10,10,1000);

y=x;

[X,Y]=meshgrid(x,y);
Z=X.^2 + Y.^2;
figure
surf(X,Y,Z,'Edgecolor', 'none')
