function [e,x,step] = potenc (A, z0, epss)
  N = size(A,1);
  if nargin < 3
    epps = 1e-12;
  end
  if nargin < 2
    z0 = rand(N, 1);
  end
  
  z0 = z0/norm(z0); % Just to be safe
  
  A = @(x) A*x;
  
  x = A(z0);
  e = z0'*x;
  step = 0;
  
  while norm(x-e*z0) >= epps
    z0 = x/norm(x);
    x = A(z0);
    e = z0'*x;
    step = step + 1;
  end

  x = x/norm(x);
  
end
