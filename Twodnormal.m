close all
clear all 
x=0:0.05:10;
y=0:0.05:10;
[xx,yy] = meshgrid(x,y);
i = sqrt(-1);
sig = 1;
distri = exp(-((xx-5).^2+(yy-5).^2)./(2*sig^2));
figure(1)
f1 = surf(xx,yy,distri);
f1.EdgeColor = 'none';
colorbar

figure(10)
h1 = histogram(distri,100);
h1v = h1.Values;
p1 = h1v / sum(h1v);
entropy1 = -sum(p1 .*log2(p1))+log2(0.01);

z = 30:1:70;
distri2 = (1/sqrt(2*pi*3^2))*exp(-((z-65).^2./(2*3^2)));
figure(2)
plot(z,distri2)


