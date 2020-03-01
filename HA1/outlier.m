% outlier.m
load tsoutlier.mat
n = length(y);
k = input('Value for k ');
plot(y)
hold on
for i = 1:n
    n1 = max(1,i-k);
    n2 = min(n,i+k);
    Tm(i) = mean(y(n1:n2));
    
end
ol = isoutlier(y)
plot(Tm,'r')
xlim([0 n])