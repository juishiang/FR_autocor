close all 
clear all
placesize = 10;
placeres = 0.1;
autoC1 = Savg(5,-15,placesize,placeres,3,0.3);
autoC2 = Savg(4,15,placesize,placeres,3,0.3);
autoC3 = Savg(6.5,-9,placesize,placeres,3,0.3);
autoC11 = autoC1(floor(placesize/0.1)+1:end,floor(placesize/0.1)+1:end);
autoC22 = autoC2(floor(placesize/0.1)+1:end,floor(placesize/0.1)+1:end);
autoC33 = autoC3(floor(placesize/0.1)+1:end,floor(placesize/0.1)+1:end);
autoS = autoC11+autoC22;
figure(1)
f1 = contourf(autoC11);
%f1.EdgeColor = 'none';
figure(2)
f2 =contourf(autoC22);
%f2.EdgeColor = 'none';
figure(3)
f3 = contourf(autoS,10);
figure(4)
f4 = contourf(autoS+autoC33,10);
figure(5)
f5 = contourf(autoC1+autoC2,10);
figure(6)
f6 = contourf(autoC1+autoC2+autoC3,10);
%f3.EdgeColor = 'none';

