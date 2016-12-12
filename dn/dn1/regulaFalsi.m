function x = regulaFalsi(f, a, b, eps, limit)
  if nargin < 4
    eps = 1e-9;
  end  
  if nargin < 5
    limit = 1e6
  end
  fa = f(a);
  fb = f(b);
  assert (sign(fa) ~= sign(fb)) 
  
  step = 0;
  epsilon = eps * abs(b-a)
  while abs(b-a) > epsilon & step < limit
    step += 1;
    k = (fb-fa)/(b-a);
    n = fa - k*a;
    c = -n/k;
    %c = (a+b)/2;
    fc = f(c);
    if abs(fc) < eps
      break
    end
    if sign(fa) == sign(fc)
      a = c;
      fa = fc;    
    else
      b = c;
      fb = fc;
    end
  
  end
  x = c
  step
end

% Usage
regulaFalsi(@(x)(0.5*x*x*x - 5), -100, -10)