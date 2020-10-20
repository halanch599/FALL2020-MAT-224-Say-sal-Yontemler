%% Initialization
%Anonimous function: 
f = @(x)x.^3+3;                                         
format long                                             
xl=-3 ;                
xu=3;
% stopping condition
n=100;
es=0.00001;
        
i=0;
xx= xl:0.01:xu;
figure(1);
plot(xx,f(xx));
grid on
if(f(xu)*f(xl)>0)
    disp('Root can''t be estimated');
    return;
end

%% Loop
while (i<=n)
    % Calculate Mid point 
    x_mid = (xl + xu)/2; 
    ea=abs((xl-x_mid)/xl)*100;
    
    if ( f(x_mid) == 0 )
       break;
    elseif ( f(xl)*f(x_mid) < 0 )                            %setting new mid point
       xu = x_mid;
    else
       xl = x_mid;
    end  
    if(ea<es)
        break;
    end
    i=i+1;
    figure(1);
    plot(xx,f(xx),x_mid,f(x_mid),'o');
    grid on;
    pause(0.5);
    
end

disp(x_mid)
disp(ea)
