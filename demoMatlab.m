%%  Section - 1
x = 10;
y = 5;
total = x+y;
disp(total)
%   NOT  ~
% & || 
% uint>=0 +
% sign  int32 +10   -10
%%%%%%%%%%%% Comments

%% Section -II If Control
clc;
x = 10;
if(mod(x,2)==0 || x>0)
    disp('Even');
elseif(x<0)
    disp('Negative')
else
    disp('Nothing')
end
%% Section-III Loops
clc;
% for i=0:3:10
%    disp(i)
% end

count =10;
while(count>=0)
    disp(count);
    count=count-1;
end


%% Section -  IV Vectors
clc;
v1 = [1 2 3 4];
v2 = [5,6,7,4];


dp = dot(v1,v2);
dif = v2-v1;
% tranponse
v3 = v1';
dif
% v = v1+v2;
% v

v4 = [1;2;3;];
v4
% v = [1,2,3,4,5,6,7,8,9,0];
% 
% [rows,cols] = size(v);
% N = length(v);
% 
% x = v-3;
% 
% for i=1:cols
%     disp(x(i))
% end
% disp(rows)
% disp(cols)
% disp(N)

%% Section - V Matrix
clc;
clear;
M = [1 2 3;4 5 6;7 8 9]
[R,C]=size(M);
d = det(M);
m = M';
%M(:)%all
%M(:,1): % show all rows from 1st col
sum(M,1); % col sum sum(M);
sum(M,2); % row sum


% for r=1:R
%     for c=1:C
%         disp(M(r,c))
%     end
% end


%% Section -  VI Graphic Displaying
clc;
clear;
close all;

x = -1:0.1:1;
% y = x.^2;

figure
% plot(x,y)
% title('Plot Test')
% xlabel('X')
% ylabel('f(x)')
% grid on

hold on
plot(0,0,'o')
% 
% x = 0:0.01:10;
y = cos(x);
plot(x, y) 
xlabel('x') 
ylabel('Sin(x)')
title('Sin(x) Graph')
grid on

y = sin(x);

plot(x,y)
grid on


hold off
























