function arr = rotaavg(la,rotat,Psize,Pres,rotatStd)
arr = zeros(2*(Psize/Pres)+1,2*(Psize/Pres)+1);
if rotatStd == 0
    arr = autoFSTerm(la,rotat,Psize,Pres);
else
    Rx = linspace(-rotatStd*3,rotatStd*3,35);
    Ry = normpdf(Rx,0,rotatStd);
    Ry = Ry / sum(Ry);
    Sizey = size(Ry);
    for Ridx = 1:Sizey(2)
        arr = arr + Ry(Ridx)*autoFSTerm(la,rotat+Rx(Ridx),Psize,Pres);
    end
end