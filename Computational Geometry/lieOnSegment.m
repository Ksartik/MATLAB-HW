function b = lieOnSegment(p, l)
  xmax = max([l(1),l(3)+l(1)]);
  xmin = min([l(1),l(3)+l(1)]);
  ymin = min([l(2),l(4)+l(2)]);
  ymax = max([l(2),l(4)+l(2)]);
  if(p(1) > xmin && p(1) < xmax && p(2) < ymin && p(2) > ymax)
    b = 1;
  else
    b = 0;
  end
end