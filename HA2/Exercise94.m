f = @(x,y) x.^2.*cos(y)
a = 0;
b = 1;
c = 0;
d = 2;
m = 1000;
n = 2000;

Area = doublesum(f,a,b,c,d,m,n)
Test = dblquad(f, a,b,c,d)