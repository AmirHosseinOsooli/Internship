clc
clear
a=csvread('one.csv',1,0);
b=csvread('two.csv',1,0);
one = linspace(0,60,length(a)-1);
two = linspace(0,60,length(b)-1);
figure(1);
grid on
hold on
plot(one,a(2:end,5));
title('acceleration(Z1) one');
xlabel('time(s)');
ylabel('amplitude(g)');
figure(2);
hold on
grid on
plot(two,b(2:end,5));
title('acceleration(Z1) two');
xlabel('time(s)');
ylabel('amplitude(g)');