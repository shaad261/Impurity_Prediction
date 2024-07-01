%Belal Khan
%20PKB359
%GL9733

%% Q1 a)
y=randn(2,3,40,12);
x=y(:,:,1); %first page
z=y(:,:,:,1); %first chapter
whos
%% Q1 b)
y=randn(2,3,40,12);
m=y(:,:,:,1:4); %all pages chapter 1:4
n=y(:,:,1:20,5); %pages 1:20 of chapter 5
whos
%% Q1 c)
y=randn(2,3,40,12);
for a=1:10
 for b=3:5
   for c=1:2
      for d=1
      y(a,b,c,c)=exp(1);
      end
   end
 end
end
%% Q1 d)
y=randn(2,3,40,12);
for e=1:40
  for f=12
    for g=1:3
      for h=2
      try
        y(e,f,g,h) = ones(3,40);
        catch exception
        display(exception);
      end
      end
    end
  end
end
%% Q1 e)
y=randn(2,3,40,12);
for a=15
 for b=1
 for c=1:3
 for d=1:2
 try
 y(d,c,a,b) = eye(3);
 catch exception;
 display(exception);
 end
 end
 end
 end
end
%% Q2
Series=0;
for i=1:50
 y=1/(i)+1/((i+2)*(i+3));
 Series=Series+y;
end
disp(Series)
%% Q3
Hmatrix=zeros(8,8);
for i=1:8
 for j=1:8
 Hmatrix(i,j)=1/(i+j-1);
 end
end
disp(Hmatrix)
%% Q4
x1=-5:0.1:0;
y1=0*x1;
x2=0:0.1:1;
y2=x2;
x3=1:0.1:2;
y3=2-x3;
x4=2:0.1:5;
y4=0*x4;
x=[x1 x2 x3 x4];
fx=[y1 y2 y3 y4];
figure
plot(x,fx)
%% Q5
Tc = 25;
Tf = convtemp(Tc,'C','F')
%% Q6
Pc=4.46; %MPa
Vc=99; %cm^3/mol
Tc=190.6; %K
R=8.314; %J/mol*k
a=3*Pc*Vc^2;
b=Vc/3;
V=linspace(115,600,500);
T=linspace(140,250,500);
[m,n]=meshgrid(T,V);
P=R*T./(V-b)-(a./V.^2);
P=R*m./(n-b)-(a./n.^2);
surfc(m,n,P) %with this we plot 3D surface with contour
xlabel('V')
ylabel('T')
zlabel('P')
% At T=100K
P1=R*100./(V-b)-(a./V.^2);
% At T=190K
P2=R*190./(V-b)-(a./V.^2);
% At T=250K
P3=R*250./(V-b)-(a./V.^2);
% At T=400K
P4=R*400./(V-b)-(a./V.^2);
figure
plot(V,P1,V,P2,V,P3,V,P4) %plotting Isotherms
ylabel('V');
ylabel('P')