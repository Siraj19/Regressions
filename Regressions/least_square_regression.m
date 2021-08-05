clear all
clc

%Given data points
x=[6 7 11 15 17 21 23 29 29 37 39];
y=[29 21 29 14 21 15 7 7 13 0 3];

%Plotting orignal points.
figure(1)
plot(x,y,'o')
hold on

%Finding Correlation Coefficient, Standard Errors, Means, and Slopes.
correlation_coefficient=(length(x)*sum(x.*y)-sum(x)*sum(y))/(((length(x)*sum(x.^2)-sum(x)^2)*(length(y)*sum(y.^2)-sum(y)^2))^0.5)
standard_error_yx=std(x)*((1-correlation_coefficient^2)^0.5)
standard_error_xy=std(y)*((1-correlation_coefficient^2)^0.5)
mean_x=mean(x);
mean_y=mean(y);
m_slope=(sum((x-mean_x).*(y-mean_y)))/(sum((x-mean_x).^2)) 

%Calculating c in y=mx+c
c=y(2)-m_slope*(x(2))

% X is new vector against which Y vector is created with regression.
x_vec=x(1):0.01:x(length(x));
y_vec=(m_slope*x_vec)+c;

%Plotting regression.
plot(x_vec,y_vec)

%Y intercept in the given data.
y_intercept_x_val=x(find(y==0))

%Y intercept of extrapolated data.
y_intercept_x_val_estimated=-c/m_slope