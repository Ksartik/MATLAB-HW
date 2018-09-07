n = 1;

while(n < 128)
    rules = [0,0,0,0,0,0,0,0];
    first = 1;last = 1000;
    iterations = 500;
    
    temp = n;
    j = 0;
    while n > 0 
        a = rem(n,2);
        n = floor(n/2);
        rules(8-j) = a;
        j = j+1;
    end
    
    row = zeros(1, last);
    mid = floor(last/2) + 1;
    row(mid) = 1;
    
    for k=1:iterations 
        for i = first : last
            A(k, i) = row(i);
        end
        for j = first : last
            if(j==first)
                d = (1 - A(k, last))*4 + (1- A(k, j))*2 + (1 - A(k, j+1));
            elseif(j==last)
                d = (1 - A(k, j-1))*4 + (1 - A(k, j))*2 + (1 - A(k, first));
            else
                d = (1 - A(k, j-1))*4 + (1 - A(k, j))*2 + (1 - A(k, j+1));
            end
            row(j) = rules(d + 1);
        end
    end
    
    mat2gray(A);
    imshow(A);
    title(['n = ', int2str(temp)]);
    
    pause(1);
    n = temp;
    n = n+1 ;
end