load co2.data
whos 
%plot(co2, '+')
x = ([1:234]');
y = [co2];

p = polyfit(x,y,1)
%fitted function, y = 0.0587x + 338.9274

plot(x,y, '+')
hold on
xm = 0:0.1:234;
ym = polyval(p,xm);
plot(xm,ym)