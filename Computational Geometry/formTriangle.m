function b = formTriangle(l1,l2,l3)
    p1 = segmentsIntersect(l1,l2);
    p2 = segmentsIntersect(l2,l3);
    p3 = segmentsIntersect(l1,l3);
    if(isempty(p1) || isempty(p2) || isempty(p3) || isequal(p1,p2))
        b = [];
    else
        b = [p1;p2;p3];
    end
end