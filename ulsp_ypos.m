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