clc
a=csvread('one.csv',1,0);
b=csvread('two.csv',1,0);
figure(1);
grid on
hold on
plot(a(2:end,1),a(2:end,5));
title('acceleration(Z1)');
xlabel('time(s)');
ylabel('amplitude(g)');
figure(2);
hold on
grid on
plot(b(2:end,1),b(2:end,5));
title('acceleration(Z1)');
xlabel('time(s)');
ylabel('amplitude(g)');