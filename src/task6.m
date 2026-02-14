clc
clear
a=csvread('one.csv',1,0);
b=csvread('two.csv',1,0);
A=a(1:end,5);
B=b(1:end,5);
  ra=length(A);
  rb=length(B);
 t=input('enter your Time interval =');
    T = 0:t:60;
%one
y1 = fft(A);
m1 = abs(y1);
p = unwrap(angle(y1));
f1 = (0:length(y1)-1)*100/length(y1);
subplot(4,2,5)
plot(f1,m1)
title('Magnitude one')
subplot(4,2,7)
plot(f1,p*180/pi)
title('Phase one')


%two
y2 = fft(B);
m2 = abs(y2);
p = unwrap(angle(y2));
f2 = (0:length(y2)-1)*100/length(y2);
subplot(4,2,6)
plot(f2,m2)
title('Magnitude two')
subplot(4,2,8)
plot(f2,p*180/pi)
title('Phase two')


 n=floor(60/t);
       N=floor(ra/n);
       K=floor(rb/n);
sA(N,1,1)=0;
sE(K,1,1)=0;
z=1;
for i=1:n
% one
     sA(:,:,z)=A(((i-1)*N+1):N*i,1);
            sB(:,:)=A((n*N)+1:ra,1);
     sC(:,:,z)=rms(sA(:,:,z));
         sD(:,:)=rms(sB(:,:));
%two
     sE(:,:,z)=B(((i-1)*K+1):K*i,1);
            sF(:,:)=B((n*K)+1:ra,1);
     sG(:,:,z)=rms(sE(:,:,z));
         sH(:,:)=rms(sF(:,:));
z=z+1;
end
meshgrid(:,:)=[sC(:,:),sD(:,:)];
subplot(4,2,3);
grid on
hold on
                 plot(T,meshgrid(:,:));
                    title('rms(Z1) one');
xlabel('time(s)');
ylabel('rms');
meshgrid(:,:)=[sG(:,:),sH(:,:)];
subplot(4,2,4);
hold on
grid on
                 plot(T,meshgrid(:,:));
                  title('rms(Z1) two');
xlabel('time(s)');
ylabel('rms');


one=diff(a(:,2))-1;
two=diff(b(:,2))-1;
subplot(4,2,1);
grid on
hold on
plot(a(2:end,1),a(2:end,5));
title('acceleration(Z1) one');
xlabel('time(s)');
ylabel('amplitude(g)');
numberofonedata = ra;
missdataofone = sum (one);
str = {'number of one data =',ra,'missdata of one =',sum(one)};
text(1,5,str)
subplot(4,2,2);
grid on
hold on
plot(b(2:end,1),b(2:end,5));
title('acceleration(Z1) two');
xlabel('time(s)');
ylabel('amplitude(g)');
numberoftwodata = rb;
missdataoftwo = sum (two);
str = {'number of two data =',rb,'missdata of two =',sum(two)};
text(1,5,str)







