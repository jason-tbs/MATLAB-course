%trisum.m
% x,y,T �r traingulering
% resten �r integranden


function I = trisum(f,x,y,T) % finita element metoden
[m,n] = size(T); %m antal rader ; n antal kolloner(3)
I = 0;
for i = 1:m
    xv = x(T(i,:));
    yv = y(T(i,:));
    cx = (1/3)*sum(xv)
    cy = (1/3)*sum(yv)
    matrix = [xv' ; yv' ; 1 1 1]; %kommer som kolonner f�r delaunay
    A = 0.5 * abs(det(matrix))
    I = I + f(cx,cy)*A
end
end