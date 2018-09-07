function b = lieInTriangle(p, lp)
  v1 = lp(1,:);
  v2 = lp(2,:);
  v3 = lp(3,:);
  b1 = sign(p,v1,v2) < 0.0;
  b2 = sign(p,v2,v3) < 0.0;
  b3 = sign(p,v3,v1) < 0.0;
  b = (b1 == b2) && (b2 == b3);
end

function s = sign(p1, v1, v2)
  s = (p1(1) - v2(1))*(v1(2) - v2(2)) - (p1(2) - v2(2))*(v1(1) - v2(1));
end
