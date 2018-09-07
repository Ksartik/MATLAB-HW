function sides = verts2sides(verts)
  l = length(verts);
  for i = 1: l
    if(i == l)
      sides(i,:) = makeSegment(verts(i), verts(1));
    else
      sides(i,:) = makeSegment(verts(i), verts(i+1));
    end
  end
end