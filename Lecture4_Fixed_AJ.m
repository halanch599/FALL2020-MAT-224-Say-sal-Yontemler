function root = Fixed_AJ(g,x0,es,imax)
% Fixed Point Iteration Method
% Author: Akhtar Jamil
% g: function for which we want to estimate root
% x0: Initial point
% es: Estimated Error
% imax: Maximum number of iterations

xr = x0;
ea = 10000;
iter = 1;
totalerror = [];
while iter<=imax
    xrold = xr;
    xr = g(xrold);
    iter = iter + 1;
    if xr~=0
        ea = abs((xr-xrold)/xr)*100;
    else
        break;
    end
    
    if ea<es || iter>=imax
        break;
    end
    fprintf('%d Error = %f Root = %f \n',iter, ea,xr); 
    totalerror(iter) = ea;
end
figure, plot(totalerror,'r-'), grid on;
root = xr;

end

