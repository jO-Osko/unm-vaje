function ma = interpolation (x, n, N)
  if nargin < 1
    x = [0, pi/4, pi/3, pi/2];
  end
  if nargin < 2 || n == 0
    n = size(x,2) - 1;
  end
  if nargin < 3
    N = 50;
  end
  y = cos(x);
  pol_i = polyfit(x,y,n);
  xx = x;
  f = @(x) (pi*x / 100) ;
  
  ma = 0;
  for j=0:N
    dst = polyval(pol_i, f(j)) - cos(f(j));
    if dst > ma
      ma = dst;
    end
  end
  % Answer
  ma = ma
  
  % For arccos
  y = x;
  x = cos(x);
  pol_i2 = polyfit(x,y,n);
  
  a = sqrt(3)/2;
  
  % Answer
  dst = abs(polyval(pol_i2, a) - acos(a))
  polyval(pol_i2, a)
  acos(a)
  
  % graph for second part
  if 0
    t = linspace(0, xx(end), 1000);
    xx(end)
    hold on
    plot(t, acos(t));
    plot(t, polyval(pol_i2, t), 'g'); 
    hold off
  else  
    t = linspace(0, 50, 1000);
    hold on
    plot(t, cos(f(t)));
    plot(t, polyval(pol_i, f(t)), 'g'); 
    hold off
  end
end
