%doublesum.m
            
function I = doublesum(f,a,b,c,d,m,n)
x = linspace(a,b,m+1); %from a to b with m+1 points
y = linspace(c,d,n+1);
A = (b-a)*(d-c)/(m*n);
I = 0;

for i=1:m+1 %loop over x
    for j = 1:n+1 % loop over y
        if (i == 1 && j == 1) || (i == 1 && j == n+1) ||...
        (i == m+1 && j ==  1) || (i == m+1 && j == n+1)
        I = I +f(x(i),y(i));
        elseif (i == 1) || (i == m+1) || (j == 1) || (j == n+1)
            I = I + 2*f(x(i),y(j));
        else
            I = I + 4*f(x(i),y(j));
        end
    end
end
I = A * (I/4)
end
