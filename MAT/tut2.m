z=linspace(0,1,10)
a=zeros(1,numel(z));
for i=1:numel(a)
    
if (a(i)<0.3)
    a=a*2;
elseif(a(i)>=0.3 && a(i)<0.6)
    a(i)=a(i)*3;
    
else
    a(i)=a(i)*4;
end

end
