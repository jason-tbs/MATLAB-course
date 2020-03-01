x = cos(0:0.3:2*pi);
y = sin(0:0.3:2*pi);
x = [0.01*x' ; 0.5*x' ; 1*x' ; 1.5*x' ; 2*x'];
y = [0.01*y' ; 0.5*y' ; 1*y' ; 1.5*y' ; 2*y'];
T = delaunay(x,y) %triangulering / delar upp i trianglar
trimesh(T,x,y)
f = @(x,y) exp(-x.^2 -y.^2)
I = trisum(f,x,y,T)
disp('Exakt värde'), disp(2*(0.5-exp(-4)/2)*pi)
%triangulering, inne håller x,y,t
% x - vektor som inne håller alla x-koordinater för alla pkt
% y - vektor som inne håller alla y-koordinater för alla pkt
% T matris med dimensioner n x 3, n = antal trianglar och 3 = hörnor i
% trianglarna
% Integration, I = sum från i=1 till n, (summa över trianglar) på fci * Ai
% centralpunkt, c = 1/3 (x1 + x2 + x3, y1 + y2 + y3)
% där x1x2... y1y2 är punkter i triangelns hörnor. 
% c är mitten av triangeln
% A  =1/2 abs(det(x1 x2 x3; y1 y2 y3; 1 1 1)) gunnar sparrs book