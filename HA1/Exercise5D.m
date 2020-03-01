% Exercise5D.m
t = [0 25 50 75 100 125 150 175 200 225 250 275 300 325]';
y = [0 22 38 53 67 74 87 94 101 115 122 126 126 126]';
a0 = [1 ; 0.005];
[a,n] = gaussnewton(@fun,@dfun,a0,t,y,1e-5) % a är exakta värden för anpassningsfunktionen
% n är antalet iterationer
yplot = a(1)*t ./(1+a(2)*t);
maxheight = a(1)/a(2) % Exercise 5 f
plot(t,y,'o',t,yplot)
xlabel('Release height ')
ylabel('Bounce height ')
title('Table tennis ball release ')