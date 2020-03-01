function df = dfun1(a,t)
dfa1 = a(1);
dfa2 =  ;
dfa1 = exp(-a(2)*t); 
dfa2 = -a(1)*t.*exp(-a(2)*t); 
dfa3 = exp(-a(3)*t); 
dfa4 = -a(3)*t.*exp(-a(4)*t);
df = [dfa1 dfa2 dfa3 dfa4]