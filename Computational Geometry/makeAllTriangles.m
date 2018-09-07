function makeAllTriangles(X,Y)
    n = length(X);
    for i = 1: n
        for j = i+1:n
            for k = j+1:n
                fill([X,X(1)],[Y,Y(1)],'y');
                hold on;
                fill([X(i), X(j), X(k)],[Y(i),Y(j),Y(k)],'g');
                set(gcf,'color','k');
                hold off;
                pause(2);
            end
        end
    end
end