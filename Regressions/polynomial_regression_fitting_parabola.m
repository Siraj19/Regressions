clear all
clc
%Given data points.
x=[1 2 3 4 5 6 7 8 9];
y=[1 1.5 2 3 4 5 8 10 13];

%Order of function.
m=2;

%Number of data points.
n=length(y);

%Computing required data.
x_mean=mean(x);
y_mean=mean(y);
sum_x=sum(x);
sum_x2=sum(x.^2);
sum_x3=sum(x.^3);
sum_x4=sum(x.^4);
sum_y=sum(y);
sum_y2=sum(y.^2);
sum_y3=sum(y.^3);
sum_xy=sum(x.*y);
sum_x2y=sum((x.^2).*y);

a=[n sum_x sum_x2; sum_x sum_x2 sum_x3; sum_x2 sum_x3 sum_x4];
c=[sum_y; sum_xy; sum_x2y];
b=(a^-1)*c;
b=vpa(b);
syms x_eq
y_eq=b(1);
x_vec=x(1):0.01:x(length(x));
y_vec=zeros(1,length(x_vec));
y_vec=y_vec+b(1);

for i=1:1:m
y_eq=y_eq+b(i+1).*(x_eq.^i);
y_vec=y_vec+b(i+1).*(x_vec.^i);
end
y_eq

% let's plot our orignal points and extrapolated data points.
figure(1)
plot(x,y,'o')
hold on
plot(x_vec,y_vec)
y_intercept = vpa(solve(y_eq,x_eq,'MaxDegree',m))