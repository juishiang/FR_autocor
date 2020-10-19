close all 
clear all
placesize = 20;
placeres = 0.1;
figurestep = 20;
autoC1 = Savg(4.6,15,placesize,placeres,3,0.3);
autoC2 = Savg(6.39,-15,placesize,placeres,3,0.3);
autoC3 = Savg(9.34,-9,placesize,placeres,3,0.3);
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
    f5 = contourf((i/10)*autoC11+(1-(i/10))*autoC22,figurestep);
    colormap(jet(figurestep-1))
    colorbar
    xticks(1:10:(floor(placesize/placeres)+1))
    xticklabels(gca, 0:10:(floor(placesize/placeres)+1))
    yticks(1:10:(floor(placesize/placeres)+1))
    yticklabels(gca, 0:10:(floor(placesize/placeres)+1))
    name = "two "+int2str(i)+":"+int2str(10-i);
    title(name)
    name = "two_"+int2str(i)+"_"+int2str(10-i);
    name = pwd +"\fig2\"+ name+".png";
    saveas(gcf,name)
end


for i = 0:10
    f5 = contourf((i/10)*autoC1+(1-(i/10))*autoC2,figurestep);
    colormap(jet(figurestep-1))
    colorbar
    xticks(1:20:(floor(placesize/placeres)*2+1))
    xticklabels(gca, -(floor(placesize/placeres)):20:(floor(placesize/placeres)))
    yticks(1:20:(floor(placesize/placeres)*2+1))
    yticklabels(gca, -(floor(placesize/placeres)):20:(floor(placesize/placeres)))
    name = "two "+int2str(i)+":"+int2str(10-i);
    title(name)
    name = "two_"+int2str(i)+"_"+int2str(10-i);
    name = pwd +"\fig\"+ name+".png";
    saveas(gcf,name)
end
figure(6)
for i = 0:10
    for j = 0:(10-i)
    f6 = contourf((i/10)*autoC1+(j/10)*autoC2+((10-i-j)/10)*autoC3,figurestep);
    colormap(jet(figurestep-1))
    colorbar
    xticks(1:20:(floor(placesize/placeres)*2+1))
    xticklabels(gca, -(floor(placesize/placeres)):20:(floor(placesize/placeres)))
    yticks(1:20:(floor(placesize/placeres)*2+1))
    yticklabels(gca, -(floor(placesize/placeres)):20:(floor(placesize/placeres)))
    name = "three "+int2str(i)+":"+int2str(j)+":"+int2str(10-i-j);
    title(name)
    name = "three_"+int2str(i)+"_"+int2str(j)+"_"+int2str(10-i-j);
    saveas(gcf,"./fig/"+name+".png")
    end
end
figure(7)
totalfig = 0;
totalarea =0;
for i = 0:10
    for j = 0:(10-i)
    curdata = (i/10)*autoC11+(j/10)*autoC22+((10-i-j)/10)*autoC33;
    f6 = contourf(curdata,figurestep);
    colormap(jet(figurestep-1))
    colorbar
    curdataM = curdata;
    curdataM(1:4/(2*placeres),1:4/(2*placeres)) = 0;
    ratio = max(max(curdataM))/max(max(curdata));
    area = sum(sum(curdata>max(max(curdataM)))); %%bigger than side beam max
    totalarea = totalarea + area;
    xticks(1:10:(floor(placesize/placeres)+1))
    xticklabels(gca, 0:10:(floor(placesize/placeres)+1))
    yticks(1:10:(floor(placesize/placeres)+1))
    yticklabels(gca, 0:10:(floor(placesize/placeres)+1))
    name = "three "+int2str(i)+":"+int2str(j)+":"+int2str(10-i-j) + "ratio="+ratio+",Area ="+area;
    title(name)
    name = "three_"+int2str(i)+"_"+int2str(j)+"_"+int2str(10-i-j);
    saveas(gcf,"./fig3/"+name+".png")
    totalfig = totalfig+1;
    end
end
avgarea = totalarea/totalfig;