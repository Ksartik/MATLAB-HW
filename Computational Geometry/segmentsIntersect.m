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