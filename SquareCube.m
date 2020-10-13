function [s,c] = SquareCube(x)
    s= MySquare1(x);
    c = x*x*x;
end

function out = MySquare1(x)
out = x*x;
end

