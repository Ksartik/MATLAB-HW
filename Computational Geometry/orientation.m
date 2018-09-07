function p = orientation(l1, l2) %common tail of vectors l1, l2 --- orientation of l2 w.r.t. l1
    p0 = l1.start;
    p1 = l1.end;
    p2 = l2.end;
    c = crossProduct(vec_sub(p1,p0), vec_sub(p2, p0));
    if(c > 0)
        p = 1; % counter clockwise
    elseif(c < 0)
        p = 0; % clockwise
    else
        p = 2; % collinear
    end
end