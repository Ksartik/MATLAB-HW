function m = slope(l)
    p1 = l.start;
    p2 = l.end;
    m = (p1.y - p2.y)/(p1.x - p2.x);
end