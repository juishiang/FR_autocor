close all 
clear all
la = 6;
k = 2*pi/la;
% k1 = [1,0];
% k2 = [-0.5,(-sqrt(3)/2)];
% k3 = [0.5,(-sqrt(3)/2)];
theta = (pi/180)*60;
theta2 = (pi/180)*120;
ori = (pi/180)*0;
% Getting values for x- and y-axis
x=-10:0.05:10;
y=-10:0.05:10;
[xx,yy] = meshgrid(x,y);
i = sqrt(-1);
% WaveDes1 = (1+real(exp(i*k*xx.*sin(0)+i*k*yy.*cos(0))))*0.5;
% WaveDes2 = (1+real(exp(i*k*xx.*sin(theta)+i*k*yy.*cos(theta))))*0.5;
% WaveDes3 = (1+real(exp(i*k*xx.*sin(theta2)+i*k*yy.*cos(theta2))))*0.5;
WaveDes1 = (1+cos(k*xx.*sin(ori)+k*yy.*cos(ori)))*0.5;
WaveDes2 = (1+cos(k*xx.*sin(ori+theta)+k*yy.*cos(ori+theta)))*0.5;
WaveDes3 = (1+cos(k*xx.*sin(ori+theta2)+k*yy.*cos(ori+theta2)))*0.5;
WavePro =  WaveDes1.*WaveDes2.*WaveDes3;

figure(1)
f1 = surf(xx,yy,WavePro);
f1.EdgeColor = 'none';
colorbar
figure(2)
contour(xx,yy,WavePro,20);
colorbar
grid on
WaveDes11 = cos((k/sqrt(2))*((cos(0)+sin(0))*xx+(cos(0)-sin(0))*yy));
WaveDes22 = cos((k/sqrt(2))*((cos(theta)+sin(theta))*xx+(cos(theta)-sin(theta))*yy));
WaveDes33 = cos((k/sqrt(2))*((cos(theta2)+sin(theta2))*xx+(cos(theta2)-sin(theta2))*yy));
% 
% figure(5)
% f5 = surf(xx,yy,WaveDes11);
% f5.EdgeColor = 'none';
% colorbar
% figure(6)
% f6 = surf(xx,yy,WaveDes22);
% f6.EdgeColor = 'none';
% colorbar
% figure(7)
% f7 = surf(xx,yy,WaveDes33);
% f7.EdgeColor = 'none';
% colorbar



WavePro2 =  ((WaveDes1+WaveDes2+WaveDes3-1))/2;%
%WavePro2 = (2/3)*((WaveDes1+WaveDes2+WaveDes3)*(1/3)+0.5);
WavePro2(WavePro2<0)=0;
figure(3)
f1 = surf(xx,yy,WavePro2);
f1.EdgeColor = 'none';
colorbar
figure(4)
contour(xx,yy,WavePro2,20);
colorbar
grid on
figure(123)
f123 = surf(xx,yy,WavePro2); hold on;
f1231 = surf(xx,yy,WavePro);
f123.EdgeColor = 'none';
f1231.EdgeColor = 'none';

%%%slice 
slice1 = WavePro(1,:);
slice2 = WavePro2(1,:);
figure(124)
plot(x,slice1,x,slice2);
% SNR = 20;
% grid on
% ANW1 = awgn(WaveDes1,SNR);
% ANW2 = awgn(WaveDes2,SNR);
% ANW3 = awgn(WaveDes3,SNR);
% figure(6)
% f6 = surf(xx,yy,ANW1);
% f6.EdgeColor = 'none';
% figure(7)
% f7 = surf(xx,yy,ANW2);
% f7.EdgeColor = 'none';
% figure(8)
% f8 = surf(xx,yy,ANW3);
% f8.EdgeColor = 'none';
% ANWT = ANW1.*ANW2.*ANW3;
% figure(9)
% f9 = surf(xx,yy,ANWT);
% f9.EdgeColor = 'none';
figure(10)
h1 = histogram(WavePro,100)
figure(11)
h2 = histogram(WavePro2,100)
h1v = h1.Values;
p1 = h1v / sum(h1v);
entropy1 = -sum(p1 .*log2(p1))+log2(0.01);
h2v = h2.Values;
p2 = h2v / sum(h2v);
entropy2 = -sum(p2 .*log2(p2))+log2(0.01);
different= entropy2-entropy1



