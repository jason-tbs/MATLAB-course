function n = tsfun(yrensad)
%load tsoutlier.mat
y = randn(1,20)
n = length(y);
k = input('Give half window, k ');
figure(1)
plot(y,'b');
hold on
%ber�kna median v�rden ymed i f�nster
for i = 1:n
    n1 = max(1,i-k);
    n2 = min(n,i+k);
    ymed(i) = median(y(n1:n2));
    %ymed(i) = mean(y(n1:n2))
    
end
%ber�kna MAD(i)
outlier = zeros(1,n);
for i = 1:n
    n1 = max(1,i-k);
    n2 = min(n,i+k);
    mad(i) = 1.486 * median(abs(y(n1:n2)-ymed(i)));
    if (abs(y(i)-ymed(i))) > 3*mad(i)
        outlier(i) = 1;
        
    end
end

yrensad = y;
yrensad(outlier(:) == 1) = []; %outlier(:) alla element i outlier
%plot outlier med r�tt kryss.
for i = 1:n %n:-1:1
    %b�rja bakl�nges, annars tar man bort i och i+1 ers�tter i., dvs man kan bara ta bort ett element.
    if outlier(i) == 1
        plot(i,y(i),'xr')
        
    end
end
figure(2)
plot(yrensad,'k')
%ylim([-20 25]) % for tsoutlier
ylim([-2 2])
%xlim([0 n])
title('Outliers removed')



