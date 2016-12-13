function [A, B, C, D] = matrika(n)
  if nargin < 1
    n = 10;
  end
  A = zeros(n);
  B = zeros(n);
  C = zeros(n);
  D = zeros(n);
  for i=1:n
    for j=1:n
      A(i,j) = sin(i*i + j*j);
      B(i,j) = cos(i*j);
      C(i,j) = A(i,j) + B(i,j);
      k = C(i,j);
      if abs(k) <= 1
        D(i,j) = k; 
      else
        D(i,j) = 1;
      end 
    end 
  end

end





