clc
clear
a=csvread('one.csv',1,0);
b=csvread('two.csv',1,0);
one=diff(a(:,2))-1;
two=diff(b(:,2))-1;
subplot(1,2,1);
grid on
hold on
plot(a(2:end,1),a(2:end,5));
title('acceleration(Z1) one');
xlabel('time(s)');
ylabel('amplitude(g)');
numberofonedata = length(a)
missdataofone = sum (one)
str = {'number of one data =',length(a),'missdata of one =',sum(one)};
text(1,3,1,str)
subplot(1,2,2);
grid on
hold on
plot(b(2:end,1),b(2:end,5));
title('acceleration(Z1) two');
xlabel('time(s)');
ylabel('amplitude(g)');
numberoftwodata = length(b)
missdataoftwo = sum (two)
str = {'number of two data =',length(b),'missdata of two =',sum(two)};
text(1,4,1,str)