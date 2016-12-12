function alpha_ = getAlpha(x, to_zero_m)
  if nargin < 1
    x = 0.1;
  end
  if nargin < 2
    to_zero_m = 10;
  end
  prev = 1/2 * sqrt(2*pi/x);
  a = [prev];
  for m = 1:to_zero_m
    next = ((2*m-1)*(4*m+1)/(2*m*(4*m-3))) * prev;
    a = [a next];
    prev = next;
  end
  bes = Ifun(x, 20, 1);
  a;
  su = 0;
  for m = 0:10
    su += a(m+1) * bes(2*m+1);
  end
  alpha_ = su;
end