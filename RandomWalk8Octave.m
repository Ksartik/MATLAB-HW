N = 50;
size = 2*N + 1;

function y = next(i,j)
k = rand;
if(rand < 0.125)
    y = [i-1, j-1];
elseif(rand < 0.25)
    y = [i-1, j];
elseif(rand < 0.375)
    y = [i-1, j+1];
elseif(rand < 0.5)
    y = [i, j+1];
elseif(rand < 0.625)
    y = [i+1,j+1];
elseif(rand < 0.75)
    y = [i+1,j];
elseif(rand < 0.875)
    y = [i+1, j-1];
else
    y = [i, j-1];
end
end

i = N+1;
j = N+1;
k = 1;

set(gca, 'XTick', -(N+1):1:(N+1));
set(gca, 'YTick', -(N+1):1:(N+1));

while((i>1) && (j>1) && (i<size) && (j<size))
    X(k) = i - N -1;
    Y(k) = j - N -1;
    pause(1);
    plot(X,Y, 'b');
    xlim([-(N+1) (N+1)]);
    ylim([-(N+1) (N+1)]);
    hold on;
    grid on;
    z = next(i,j);
    i = z(1);
    j = z(2);
    k = k+1;
end

X(k) = i - N -1;
Y(k) = j - N -1;
plot(X,Y,'b');

hold off;
grid off;