function est_bits = viterbi_decoder(xin)
num_bits= length(xin)/2;
A=0;
B=1;
C=1;
D=2;
a=[];
b=[];
c=[];
d=[];
for i=1:num_bits
   r= [xin(2*i-1), xin(2*i)];
e0= sum(abs(r-[0 0]));
e1= sum(abs(r-[0 1]));
e2= sum(abs(r-[1 0]));
e3= sum(abs(r-[1 1]));

A1 = min( A +e0 ,B+e3);
if (A+e0)<(B+e3)
    tempa=[a,0];
else
    tempa=[b,1];
end

B1 = min( C+e2 ,D+e1);
if (C+e2)<(D+e1)
    tempb=[c,1];
else
    tempb=[d,0];    
end

C1 = min( A +e3 ,B+e2);
if (A+e3)<(B+e2)
    tempc=[a,1];
else
    tempc=[b,0];
end

D1= min(C+e1,D+e2);
if (C+e1)<(D+e2)
    tempd=[c,0];
else
    tempd=[d,1];
end
A=A1;
B=B1;
C=C1;
D=D1;
a=tempa;
b=tempb;
c=tempc;
d=tempd;
x=[A,B,C,D];
end
x=[A,B,C,D];
if min(x)==A
    est_bits= a;
end
if min(x)==B
    est_bits= b;
end
if min(x)==C
    est_bits= c;
end
if min(x)==D
    est_bits= d;
end
end