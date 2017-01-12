function x = system(N)
  if nargin < 1
    N = 10;
  end
  A11 = 3*eye(N);
  A21 = diag(linspace(1,N, (N-1) + 1));
  a12 = linspace(1,2*N-1, (N-1)+1)';
  a22 = linspace(2,2*N, (N-1)+1)';
  
  A = [A11 a12
       A21 a22];
       
  AA = A;
  b = 1 + zeros(N*2, 1);
  [Q, Qb, R] = givens(A, b);
  R;
  % Answer
  Q;
  c = Qb;
  
  
  % Todo b) part
  % Todo c) part
  
end