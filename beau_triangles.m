function V = beau_triangles(n)
    if(n == 1)
        s = sqrt(3);
        V = [0 -1 1 0; 0 s s 0];
        plot(V(1,:), V(2,:),'b');
        hold on;
    else
        Vp = beau_triangles(n-1);
        i = 1;
        for j = 1: size(Vp,2)-1
            V(:,i) = Vp(:,j);
            v = make_eq_triangle([Vp(1,j); Vp(2,j)],[Vp(1,j+1); Vp(2,j+1)]);
            hold on;
            V(:,i+1) = v;
            V(:,i+2) = Vp(:,j+1);
            i = i+3;
        end
    end
end

function v3 = make_eq_triangle(v1, v2) %v1 v2 be two vertices of the triangle
    Rt = [cosd(60) -sind(60); sind(60) cosd(60)];
    v3 = v1 + Rt*(v2 - v1);
    plot([v1(1) v2(1) v3(1) v1(1)], [v1(2) v2(2) v3(2) v1(2)],'b');
end