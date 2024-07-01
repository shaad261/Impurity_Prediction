T = 298;
Q = 2.5/1000;
P = 103*1000;
L = 100;
d = 46.08+9.418*T-0.0329*T^2+(4.882*1e-5*T^3)-2.895*T^4*1e-8;
u = exp(-10.547+541.69/(T-144.53));
Re = linspace(2200,9000);
f = arrayfun(@Fanning_Friction_Factor,Re);
plot(Re,f)
xlabel('Re')
ylabel('Fanning Friction Factor')
D = fzero(@findD,0.04);
sprintf('The diameter of the pipe is = %s\n', D)
function fF = Fanning_Friction_Factor(Re)
if Re<2100
fF = 16/Re;
sprintf('Flow is Laminar')
else
fx = @(f) 1/sqrt(f)-(4.0*log10(Re*sqrt(f))-0.4);
fF = fzero(fx,0.01);
sprintf('Flow is Turbulent')
end
end
function z = findD(D)
T = 298;
Q = 2.5/1000;
P = 103*1000;
L=100;
d=46.08+9.418*T-0.0329*T^2+(4.882*1e-5*T^3)-2.895*T^4*1e-8;
u=exp(-10.547+541.69/(T-144.53));
v = Q/(pi*D^2/4);
Re = D*v*d/u;
fF = Fanning_Friction_Factor(Re);
z = P - 2*fF*d*L*v^2/D;
end