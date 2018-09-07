function golden_spiral(n)
    Xmin = 0;
    Ymin = 0;
    Xmax = 1;
    Ymax = 1;
    k = 1;
    sides = [1 1];
    rectangle('Position',[0 0 1 1]);
    hold on;
    pause(0.2);
    arc([1 1], [0 1], [1 0]);
    axis equal;
    direct = [1 2 3 4];
    while(k <= n)
        pause(0.6);
        if(k > 1)
            sides(k+1) = sides(k) + sides(k-1);
        end
        a = rem(k-1,4) + 1;
        s = sides(k+1);
        switch direct(a)
            case 1
                rectangle('Position', [Xmax Ymin s s]);
                pause(0.2);
                arc([Xmax Ymax], [Xmax Ymin], [(Xmax+s) Ymax]);
                Xmax = Xmax + s;
            case 2
                rectangle('Position', [Xmin Ymax s s]);
                pause(0.2);
                arc([Xmin Ymax], [Xmax Ymax], [Xmin (Ymax + s)]);
                Ymax = Ymax + s;
            case 3
                rectangle('Position', [(Xmin-s) Ymin s s]);
                pause(0.2);
                arc([Xmin Ymin], [Xmin Ymax], [(Xmin-s) Ymin]);
                Xmin = Xmin - s;
            case 4
                rectangle('Position', [Xmin (Ymin-s) s s]);
                pause(0.2);
                arc([Xmax Ymin], [Xmin Ymin], [Xmax (Ymin - s)]);
                Ymin = Ymin - s;
        end
        k = k + 1;
    end
    disp(sides(k));
    hold off;
end

function arc(center, point1, point2)
    theta1 = atan2(point1(2) - center(2), point1(1) - center(1));
    theta2 = atan2(point2(2) - center(2), point2(1) - center(1));
    theta2 = mod(theta2 - theta1, 2*pi) + theta1;
    theta = linspace(theta1, theta2, 100);
    r = sqrt((point1(2) - center(2))^2 + (point1(1) - center(1))^2);
    X = center(1) + r*cos(theta);
    Y = center(2) + r*sin(theta);
    plot(X,Y,'b-');
end