x = input('');
y = input('');

fprintf("Area of polygon using triangles : %.4f", areaTriangles(x,y));
fprintf("\n\nArea of polygon : %.4f", areaPolygon(x,y));
l = listTrias(x,y);
[s1,s2] = smallestTrias(l);
[m1,m2] = largestTrias(l);
fprintf("\n\nSmallest Triangle :\n");
fprintf("%.4f %.4f \n", s1');
fprintf("\nSecond smallest Triangles:\n");
fprintf("%.4f %.4f\n", s2');
fprintf("\nLargest Triangle :\n");
fprintf("%.4f %.4f\n", m1');
fprintf("\nSecond Largest Triangle :\n");
fprintf("%.4f %.4f\n", m2');



function A = areaTriangles(X,Y)
    n = length(X);
    A = 0;
    for i = 2: n-1
        A = A + 0.5*abs(det([1, X(1), Y(1); 1, X(i), Y(i); 1, X(i+1), Y(i+1)]));
    end
end

function A = areaPolygon(X,Y)
    A = 0;
    n = length(X);
    for i = 1:n-1
        A = A + X(i)*Y(i+1) -  X(i+1)*Y(i);
    end
    A = A + X(n)*Y(1) - X(1)*Y(n);
    A = 0.5*abs(A);
end

function l = listTrias(X,Y)
    n = length(X);
    for i = 2:n-1
        l(:,:,i-1) = [X(1), Y(1); X(i), Y(i); X(i+1), Y(i+1)];
    end
end

function [s1, s2] = smallestTrias(lt)
    s1 = lt(:,:,1);
    s2 = lt(:,:,2);
    A1 = areaTriangles(lt(:,1,1),lt(:,2,1));
    A2 = areaTriangles(lt(:,1,2),lt(:,2,2));
    if(A1 > A2)
        t = s1;
        s1 = s2;
        s2 = t;
        t = A1;
        A1 = A2;
        A2 = t;
    end
    for i = 3: size(lt,3)
        At = areaTriangles(lt(:,1,i),lt(:,2,i));
        st = lt(:,:,i);
        if(At < A1)
            A1 = At;
            s1 = st;
        elseif(At < A2)
            A2 = At;
            s2 = st;
        end
    end
    if(A1 == A2)
        s2 = s1;
    end
end

function [s1,s2] = largestTrias(lt)
    s1 = lt(:,:,1);
    s2 = lt(:,:,2);
    A1 = areaTriangles(lt(:,1,1),lt(:,2,1));
    A2 = areaTriangles(lt(:,1,2),lt(:,2,2));
    if(A1 > A2)
        t = s1;
        s1 = s2;
        s2 = t;
        t = A1;
        A1 = A2;
        A2 = t;
    end  
    for i = 3: size(lt,3)
        At = areaTriangles(lt(:,1,i),lt(:,2,i));
        st = lt(:,:,i);
        if(At > A1)
            A1 = At;
            s1 = st;
        elseif(At > A2)
            A2 = At;
            s2 = st;
        end
    end
    if(A1 == A2)
        s2 = s1;
    end
end