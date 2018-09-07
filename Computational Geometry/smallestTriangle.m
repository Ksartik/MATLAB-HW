function s = smallestTriangle(polyVerts)
  L = listTriangles(polyVerts);
  k = 1;
  a = shoelaceAreaPolygon([L(1).v1, L(1).v2, L(1).v3]);
  for i = 2: length(L)
    at = shoelaceAreaPolygon([L(i).v1, L(i).v2, L(i).v3]);
    if(at < a)
      a = at;
      k = i;
    end
  end
  s = L(k);
end