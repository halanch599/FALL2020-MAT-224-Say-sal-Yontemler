%% Clear Data
clc;
clear;
close all;

%% Generate Data
x =  -3:0.1:3;
y =  exp(x);

figure
plot(x,y,'b-','LineWidth',2)
xlabel('X')
ylabel('f(x)')
grid on
hold on

%% Taylor sERIES eXPENSION
N=10;
ev=0;
xx=1;
yh = y*0;

for n=0:N
    ev = ev+xx^n/factorial(n);
    yh = yh + (x.^n)./factorial(n);
end

tv = exp(xx);
err = (tv-ev)/tv*100;

plot(x,yh,'r--','LineWidth',2);
plot(xx,tv,'or','MarkerSize',10,'LineWidth',2)
plot(xx,ev,'og','MarkerSize',10,'LineWidth',2)
title(['Error = ',num2str(err),'%'])

legend('True Value','Estimated Value')