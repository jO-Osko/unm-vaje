function [Q, b, R] = givens(A, b)
  [m, n] = size(A);
  if nargin < 2
    b = zeros(m, 1) + 1;
  end
  Q = eye(m);
  R = A;
  for j=1:n
    for k=j+1:m
      r = sqrt(R(j,j)**2 + R(k,j)**2);
      if r > 0
        c = R(j,j)/r;
        s = R(k,j)/r;
        gi = [c  s
              -s c];
        gim = [c -s
              s  c];      
              
        R([j k], j:n) = gi * R([j k], j:n);
        b([j k]) = gi * b([j k]);
        Q(1:m, [j k]) = Q(1:m, [j k]) * gim;
      end
    end
  end
  Q = Q';
end