function A = shoelaceAreaPolygon(verts)
  A = 0;
  n = length(verts);
  for i = 0: n-1
    v1 = verts(i+1);
    v2 = verts(mod(i+1,n)+1);
    A = A + v1.x * v2.y - v2.x * v1.y;
  end
  A = 0.5*abs(A);
end