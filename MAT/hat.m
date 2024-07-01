%% (a)
x = [0,0.25,0.5,1,2,3,4,5,6,8,10];
y = [2.5,3.6,5.3,9.5,14.0,16.5,18.8,21.5,23.2,26.8,28.4];

p = polyfit(x,y,1) 
theoretical_y = polyval(p,x)
plot(x,y,'o',x,theoretical_y)



%% (b)

resedual=y-theoretical_y
bar(x,resedual)



%(c)

n=length(x);

% r=(n*sum(x.y)-sum(x)*sum(y))/((sqrt(n*sum(x.^2)-(sum(x))^2))*(((sqrt(n*sum(y.^2)-(sum(y))^2)));
% r^2
%
%(d)

s=polyfit(x,y,2) 
y_new=polyval(s,x)
resedual_cubic=y-y_new

y_mean=sum(y)/n

sum_squared_regression= sum(resedual_cubic)
total_sum_of_square= sum(y-y_mean)
r_square_for_cubic=1-sum_squared_regression/total_sum_of_square


q = polyfit(x,y,3) 
y_new_new = polyval(q,x)
resedual_quadratic=y-y_new_new

SSR= sum(resedual_quadratic)
SST= sum(y-y_mean)
r_square_for_quadratic= 1-abs(SSR/SST)

plot(x,y_new_new,x,y_new)