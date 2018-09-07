function A = recAreaPolygon(verts)
  n = length(verts);
  if(n == 3)
    v1 = verts(1);
    v2 = verts(2);
    v3 = verts(3);
    A = 0.5 * abs(det([1 1 1; v1.x v2.x v3.x ; v1.y v2.y v3.y]));
  else
    A = recAreaPolygon([verts(1) verts(2) verts(3)]) + recAreaPolygon([verts(1), verts(3), verts(4:end)]);
  end
end