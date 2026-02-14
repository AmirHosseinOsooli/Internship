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
     sE(:,:,z)=B(((i-1)*K+1):K*i,1);
            sF(:,:)=B((n*K)+1:ra,1);
     sG(:,:,z)=rms(sE(:,:,z));
         sH(:,:)=rms(sF(:,:));
z=z+1;
end
meshgrid(:,:)=[sC(:,:),sD(:,:)];
figure(1);
grid on
hold on
                 plot(T,meshgrid(:,:));
                    title('r(Z1) one');
xlabel('time(s)');
ylabel('rms');
meshgrid(:,:)=[sG(:,:),sH(:,:)];
figure(2);
hold on
grid on
                 plot(T,meshgrid(:,:));
                  title('rms(Z1) two');
xlabel('time(s)');
ylabel('rms');






