function arr = autoFSTerm(la,rotat,Psize,Pres)
k = (4*pi)/(sqrt(3)*la);
theta = (pi/180)*60;
theta2 = (pi/180)*120;
ori = (pi/180)*rotat;
% Getting values for x- and y-axis
x=-Psize:Pres:Psize;
y=-Psize:Pres:Psize;
[xx,yy] = meshgrid(x,y);
WaveDes1 = cos(k*xx.*sin(ori)+k*yy.*cos(ori));
WaveDes2 = cos(k*xx.*sin(ori+theta)+k*yy.*cos(ori+theta));
WaveDes3 = cos(k*xx.*sin(ori+theta2)+k*yy.*cos(ori+theta2));
WavePro = ((1+WaveDes1).*(1+WaveDes2).*(1+WaveDes3))/8;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%test part
%WavePlus = (2/3)*((1/3)*(WaveDes1+WaveDes2+WaveDes3)+0.5);
%WavePlus(WavePlus<0)=0;
%WavePro = WavePlus;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
idx_C = floor(Psize/Pres +1);
idx_s = idx_C-floor(la/(2*Pres));
idx_e = idx_C+floor(la/(2*Pres));
SmallP = WavePro(idx_s:idx_e,idx_s:idx_e);
AutoF = xcorr2(WavePro,SmallP);
arr = AutoF(floor(la/(2*Pres))+1:end-floor(la/(2*Pres)),floor(la/(2*Pres))+1:end-floor(la/(2*Pres)));
