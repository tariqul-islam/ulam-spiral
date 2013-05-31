function y = ulsp_prevsq(x)
    y=floor(sqrt(x));
    if mod(y,2)==0
        y=y-1;
    end
end