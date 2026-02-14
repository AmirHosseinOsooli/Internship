clc
clear all
a=csvread('one.csv',1,0);
b=csvread('two.csv',1,0);
one=diff(a(:,2))-1;
two=diff(b(:,2))-1;
missdataofC = sum (one)
missdataofD=sum (two)