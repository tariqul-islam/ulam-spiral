%{
ULAM_SPIRAL
Creates (x,y) co-ordinates of ULAM SPIRAL in the first quadrant

[x,y] = ulam_spiral(N), outputs (x,y) co-ordinates
x = ulam_spiral(N), outputs a two row vercor, first row gives the x cordinates, second row gives y co-ordinates

Written by,
Tariqul Islam Ponir
ponir.bd @ hotmail.com
%}




function [xpos,ypos] = ulam_spiral(N)
    if length(N) ~= 1
        error('Invalid Argument');
    end
    P = primes(N*N);
    len=length(P);

    xpos=zeros(2, len);

    for i=1:1:len
       xpos(1,i)=ulsp_xpos(P(i), N);
       xpos(2,i)=ulsp_ypos(P(i), N);
    end
    
    if nargout == 2
        ypos = xpos(2,:);
        xpos = xpos(1,:);
    end
end
