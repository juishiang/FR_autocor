close all
clear all

lambda = 1:1:100;
lo = 10;
N = 100;
Aw = (2*pi*lo^2)*(2*pi*log(100)/N)*(exp(-1.33*pi^2*lo^2./lambda.^2)./(lambda.^2));

plot(lambda,Aw)