close all 
clear all
placesize = 10;
placeres = 0.1;
figurestep = 20;
autoC1 = Savg(5,-15,placesize,placeres,3,0.3);
autoC2 = Savg(4,15,placesize,placeres,3,0.3);
autoC3 = Savg(6.5,-9,placesize,placeres,3,0.3);
autoC11 = autoC1(floor(placesize/0.1)+1:end,floor(placesize/0.1)+1:end);
autoC22 = autoC2(floor(placesize/0.1)+1:end,floor(placesize/0.1)+1:end);
autoC33 = autoC3(floor(placesize/0.1)+1:end,floor(placesize/0.1)+1:end);
autoS = autoC11+autoC22;
i = 1;
figure(i)
f1 = contourf(autoC11,figurestep);
%f1.EdgeColor = 'none';
i=i+1;
figure(i)
f2 =contourf(autoC22,figurestep);
%f2.EdgeColor = 'none';
figure(3)
f3 = contourf(autoS,figurestep);
figure(4)
f4 = contourf(autoS+autoC33,figurestep);
for i = 0:10
    f5 = contourf((i/10)*autoC1+(1-(i/10))*autoC2,figurestep);
    colormap(jet(figurestep+1))
    colorbar
    xticks(1:20:201)
    xticklabels(gca, -100:20:100)
    yticks(1:20:201)
    yticklabels(gca, -100:20:100)
    name = "two_"+int2str(i)+":"+int2str(10-i);
    title(name)
    name = pwd +"\fig\"+ name+".png";
    saveas(gcf,name)
end
figure(6)
for i = 0:10
    for j = i:10
    f6 = contourf((i/10)*autoC1+(j/10)*autoC2+((10-i-j)/10)*autoC3,figurestep);
    colormap(jet(figurestep+1))
    colorbar
    xticks(1:20:201)
    xticklabels(gca, -100:20:100)
    yticks(1:20:201)
    yticklabels(gca, -100:20:100)
    name = "three_"+int2str(i)+":"+int2str(j)+":"+int2str(10-i-j);
    title(name)
    saveas(gcf,"./fig/"+name+".png")
    end
end