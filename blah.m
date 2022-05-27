N=10;
b1=zeros(1,N);
b2=zeros(1,N);
fp=zeros(1,N);
for i=1:1:N
    disp(i)
    [x,y]= test(i*0.001);
    b1(i)=x;
    b2(i)=y;
    fp(i)= 0.001+(i-1)*0.001;
end

figure;
plot(fp,b1);
hold on;
plot(fp,b2);
figure;
plot(fp*100, 10*(log(b1)-log(b2)))
title('Bit Error rate Improvement') ;
xlabel('Flip rate (in %)') ;
ylabel('Error Improvement (dB)'); % Positive value (in dB) implies improvement in BER