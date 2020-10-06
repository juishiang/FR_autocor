function arr = Savg(la,rotat,Psize,Pres,rotatStd,SStd)
arr = zeros(2*(Psize/Pres)+1,2*(Psize/Pres)+1);
if SStd == 0
    arr = rotaavg(la,rotat,Psize,Pres,rotatStd);
else
    Rx = linspace(-SStd*3,SStd*3,35);
    Ry = normpdf(Rx,0,SStd);
    Ry = Ry / sum(Ry);
    Sizey = size(Ry);
    for Ridx = 1:Sizey(2)
        arr = arr + Ry(Ridx)*rotaavg(la+Rx(Ridx),rotat,Psize,Pres,rotatStd);
    end
end