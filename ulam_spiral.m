%{
ULAM_SPIRAL
get the co-ordinates of ulam spiral the points upto N*N
more on ulam spiral here: http://en.wikipedia.org/wiki/Ulam_spiral

coor = ulam_spiral(N)
will give a 2 row vector output which contains the co-ordinates of
the primes in the ulam spiral. The first row gives all the x co-ordinates
and second row gives all the y co-ordinates

[x,y] = ulam_spiral(N);
x will have the x co-ordinates, and y will have the y co-ordinates.

coor = ulam_spiral(N,fname)
[x,y] = ulam_spiral(N,fname)
Will do the same as above. Additionally it will save a JPEG file having the
name fname. The function doesn't require extension in the fname. Extension
will be automatically added.

Contact me if there is any bug or if you want to give any suggestion
-Tariqul Islam Ponir
ponir(dot)bd @ hotmail(dot)com
%}

function [xpos,ypos] = ulam_spiral(N, fname)
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
    
    if nargin == 2
        A = uint8(zeros(N));
        for i=1:1:len
            A(xpos(1,i),xpos(2,i)) = 255;
        end
        fname = [fname '.jpg'];
        imwrite(A,fname,'JPEG');
    end
    
    if nargout == 2
        ypos = xpos(2,:);
        xpos = xpos(1,:);
    end
end

function x = ulsp_xpos(number, bound)
    last = ulsp_prevsq(number);
    next = ulsp_nextsq(number);
    
    lastsq=last^2;
    
    diff=next-1;
    corners=[lastsq+diff lastsq+diff*2 lastsq+diff*3 lastsq+diff*4];
    
    pos = ceil(bound/2)-diff/2;
    if number<=corners(1) || number == corners(4)
        x = pos+diff;
    elseif number>corners(1) && number<corners(2)
        x = pos+corners(2)-number;
    elseif number>=corners(2) && number<=corners(3)
        x = pos;
    elseif number>corners(3) && number<corners(4)
        x = pos+number-corners(3);
    end
end

function y = ulsp_ypos(number, bound)
    last = ulsp_prevsq(number);
    next = ulsp_nextsq(number);
    
    lastsq=last^2;
    
    diff=next-1;
    corners=[lastsq+diff lastsq+diff*2 lastsq+diff*3 lastsq+diff*4];
    
    pos = ceil(bound/2)+diff/2;
    if number<corners(1)
        y = pos-(corners(1)-number);
    elseif number>=corners(1) && number<=corners(2)
        y = pos;
    elseif number>corners(2) && number<corners(3)
        y = pos-(number-corners(2));
    elseif number>=corners(3) && number<=corners(4)
        y = pos-diff;
    end
end

function y = ulsp_prevsq(x)
    y=floor(sqrt(x));
    if mod(y,2)==0
        y=y-1;
    end
end

function y = ulsp_nextsq(x)
    y=ceil(sqrt(x));
    if mod(y,2)==0
        y=y+1;
    end
end