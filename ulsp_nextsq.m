function y = ulsp_nextsq(x)
    y=ceil(sqrt(x));
    if mod(y,2)==0
        y=y+1;
    end
end