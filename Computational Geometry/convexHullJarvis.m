function res = convexHullJarvis(points)
    n = length(points);
    if n < 3
        res = -1;
        return;
    else
        minp = points(1);
        for i = 2:n
            if(points(i).x < minp.x)
                minp = points;
            end
        end
        res(1) = minp;
        for i = 1: n
            if(