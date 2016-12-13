function has = hasLru(matrix, eps)
  if nargin < 2
    eps = 1e-12;
  end
  has = true;
  for i=1:size(matrix,1)
    if abs(det(matrix(1:i, 1:i))) < eps
      has = false;
      break
    end
  end
end

% usage