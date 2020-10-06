     t = 0:0.01:(2*pi);
     x = 0.5*(cos(t)+1);
     y = sin(t);
     z = x.*x.*x;
     plot(t,x,'k'); hold on;
     plot(t,y,'r-.'); hold on;
     plot(t,z,'k-');
     axis([0 2*pi -1.5 1.5])
     legend('cos(t)','sin(t)','Location','NorthEast')