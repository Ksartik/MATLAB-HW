P = input('');

function b = segmentsIntersect(l1,l2)
  d = l1(3)*l2(4) - l2(3)*l1(4);
  b = [];
  if(d ~= 0)
    s = ((l2(1) - l1(1))*l2(4) - (l2(2) - l1(2))*l2(3))/d;
    t = ((l2(1) - l1(1))*l1(4) - (l2(2) - l1(2))*l1(3))/d;
    if(s >= 0 && s <= 1 && t >= 0 && t <= 1)
      x = l1(1) + s*l1(3);
      y = l1(2) + s*l1(4);
      b = [x, y];
    end
  end
end
  
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

function T = listTrias(P)
    l = size(P,1);
    r = 1;
    for i = 1: l
        for j = i+1: l
            for k = j+1:l
                p = formTriangle(P(i,:), P(j,:),P(k,:));
                if(~isempty(p))
                    T(:,:,r) = p;
                    r = r + 1;
                end
            end
        end
    end
end

function A = areaT(T)
    A = 0;
    for n = 1: size(T,3)
        A = A + polyarea(T(:,1,n), T(:,2,n));
    end
end

function t = nonOverlapTrias(T)
    t = 0;
    n = size(T,3);
    for i = 1: n
        p = 1;
        for j = 1: n
            if(i~=j)
              if(lieInTriangle(T(1,:,i),T(:,:,j)) && lieInTriangle(T(2,:,i),T(:,:,j)) && lieInTriangle(T(3,:,i),T(:,:,j)))
                p = 0;
                break;
              else
                for a =1:3
                    for b = 1:3
                        if(isequal(T(a,:,i),T(b,:,j)))
                            p = 0;
                            break;
                        end
                    end
                end
              end
            end
        end
        if(p == 1)
            t = t + 1;
        end
    end
end

function s = sign(p1, v1, v2)
  s = (p1(1) - v2(1))*(v1(2) - v2(2)) - (p1(2) - v2(2))*(v1(1) - v2(1));
end

function b = lieInTriangle(p, lp)
  v1 = lp(1,:);
  v2 = lp(2,:);
  v3 = lp(3,:);
  b1 = sign(p,v1,v2) < 0.0;
  b2 = sign(p,v2,v3) < 0.0;
  b3 = sign(p,v3,v1) < 0.0;
  b = (b1 == b2) && (b2 == b3);
end

T = listTrias(P);
C = size(T,3); % No. of triangles formed by the vertices
A = areaT(T);
nover = nonOverlapTrias(T);
fprintf("%d %.4f %d", C, A, nover);