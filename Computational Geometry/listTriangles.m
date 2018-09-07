function T = listTriangles(polyVerts)
  n = length(polyVerts);
  sides = verts2sides(polyVerts);
  t = 1;
  for i = 0: n-1
    vert1 = polyVerts(i+1);
    vert2 = polyVerts(mod(i+1,n) + 1);
    k = mod(i+1, n) + 3;
    for j = 0: n-5
      T(t) = makeTriangle(vert1, vert2, polyVerts(k+j));
      t = t + 1;
    end
  end
  
  for i = 0: n-1
    T(t) = makeTriangle(polyVerts(i+1), polyVerts(mod(i+1, n) + 1), polyVerts(mod(i+2,n) + 1));
    t = t + 1;
  end
  
end