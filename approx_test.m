close all
clear all
placesize = 10;
Psize = placesize;
placeres = 0.1;
Pres = placeres;
figurestep = 20;
la = 4;
oridegree = 0;
autoC1 = Savg(la,15,placesize,placeres,3,0.3);
%autoC1 = (autoC1-min(min(autoC1)))./(max(max(autoC1))-min(min(autoC1)));
autoC2 = Savg(5,-15,placesize,placeres,3,0.3);
%autoC2 = (autoC2-min(min(autoC2)))./(max(max(autoC2))-min(min(autoC2)));
theta = (pi/180)*60;
theta2 = (pi/180)*120;
ori = (pi/180)*oridegree;
k = 4*pi/(sqrt(3)*la);
x=-placesize:placeres:placesize;
y=-placesize:placeres:placesize;
[xx,yy] = meshgrid(x,y);
i = sqrt(-1);
WaveDes1 = cos(k*xx.*sin(ori)+k*yy.*cos(ori));
WaveDes2 = cos(k*xx.*sin(ori+theta)+k*yy.*cos(ori+theta));
WaveDes3 = cos(k*xx.*sin(ori+theta2)+k*yy.*cos(ori+theta2));
WavePro = ((1+WaveDes1).*(1+WaveDes2).*(1+WaveDes3))/8;
WavePlus = (2/3)*((1/3)*(WaveDes1+WaveDes2+WaveDes3)+0.5);
WavePlus(WavePlus<0)=0;
figure 
f1 = contourf(autoC1);
colormap(jet(figurestep))
colorbar
xticks(1:20:(floor(placesize/placeres)*2+1))
xticklabels(gca, -(floor(placesize/placeres)):20:(floor(placesize/placeres)))
yticks(1:20:(floor(placesize/placeres)*2+1))
yticklabels(gca, -(floor(placesize/placeres)):20:(floor(placesize/placeres)))
name = "two "+int2str(i)+":"+int2str(10-i);
title(name)
figure
f2 = contourf(WavePlus);
colormap(jet(figurestep))
colorbar
figure
f3 = contourf(WavePro);
colormap(jet(figurestep))
colorbar
figure 
f4 = surf(xx,yy,(WavePlus-autoC1));
f4.EdgeColor = 'none';
colormap(jet(figurestep))
colorbar
figure 
f5 = contourf((0.5*autoC1+0.5*autoC2),figurestep);
colormap(jet(figurestep))
colorbar
idx_C = floor(Psize/Pres +1);
idx_s = idx_C-floor(la/(2*Pres));
idx_e = idx_C+floor(la/(2*Pres));
SmallP = WavePro(idx_s:idx_e,idx_s:idx_e);
SmallPlus = WavePlus(idx_s:idx_e,idx_s:idx_e);
figure 
f6 = contourf(SmallP);
colormap(jet(figurestep))
colorbar
figure 
f7 = contourf(SmallPlus);
colormap(jet(figurestep))
colorbar
figure 
f8 = contourf(SmallPlus*0.5+SmallP*0.5);
colormap(jet(figurestep))
colorbar
