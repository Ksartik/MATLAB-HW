function drawSegments(s, c)
    for i = 1: length(s)
        plot([s(i).start.x, s(i).end.x], [s(i).start.y, s(i).end.y], c);
        hold on;
    end
end