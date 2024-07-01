%Belal Khan
%20PKB359
%GL9733

%% Q1

k1=2; 
k2=1;
t_inter = [0 1/3];
init_cond = [2 0 0];

[t,y] = ode45(@odefnc ,t_inter ,init_cond);
plot(t,y(:,1),t,y(:,2),t,y(:,3))
xlabel('Time t');
ylabel('Concentration C');
legend('Ca','Cd','Cu')

Ca_final = y(57,1)
Cd_final = y(57,2)
Cu_final = y(57,3)


%% Q2 
syms y1(t) k1 y2(t) k2; 

cond1 = y1(0) == 'Cao';
cond2 = y2(0) == 0;
eqn1 = diff(y1,t) == (-k1)*y1;
eqn2 = diff(y2,t) ==  k1*y1 - k2*(y2)^2;

eqn = [eqn1, eqn2];
init_cond = [cond1, cond2];
S = dsolve(eqn,init_cond);

Ca = S.y1
Cb = S.y2


%% Q3

syms y(r) Co De k R;
% r=0:0.01:1;
eqn = De*diff(y,r,2)==k*y;
Dy = diff(y,r);
init_cond = [y(R)==Co, Dy(0)==0];
sol = dsolve(eqn,init_cond);

s= simplify(sol)

%% Q4
clc 
clear

L = 1;
x = linspace(0,L,20);
t = [linspace(0,0.05,20), linspace(0.5,5,10)];

m = 0;
sol = pdepe(m,@heatpde,@heatic,@heatbc,x,t);

u = sol(:,:,1);
surf(x,t,u)
xlabel('x')
ylabel('t')
zlabel('u(x,t)')
view([150 25])

%% Functions

function dydt = odefnc(t,y)

dydt = [-2*y(1) - y(1)^2
        2*y(1)
        y(1)^2] ;
 
end

function [c,f,s] = heatpde(x,t,u,dudx)
c = pi^2;
f = dudx;
s = 0;
end

function u0 = heatic(x)
u0 = sin(pi*x);
end
function [pl,ql,pr,qr] = heatbc(xl,ul,xr,ur,t)
pl = ul;
ql = 0;
pr = ur - pi*exp(-t);
qr = 0;
end