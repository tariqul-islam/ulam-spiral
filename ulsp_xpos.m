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