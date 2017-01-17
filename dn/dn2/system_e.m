function x = system_e(N)
  if nargin < 1
    N = 10;
  end
  A11 = 3*eye(N);
  A21 = diag(linspace(1,N, (N-1) + 1));
  a12 = (linspace(1,2*N-1, (N-1)+1)');
  a22 = linspace(2,2*N, (N-1)+1)';
  
  A = [A11 a12
       A21 a22];
       
  AA = [A11 a12
       A21 a22];
  b = 1 + zeros(N*2, 1);
  [Q, Qb, R] = givens(A, b);
  R;
  % Answer
  Q;
  c = Qb;
  
  r22 = R(N+1:end, end);
  c2 = c(N+1:end);
  size(c2,1);
  % Todo b) part
  
  X = linspace(0,2,10000);
  Y = zeros(size(X,1));
  for j=1:10000
    Y(j) = norm(X(j)*r22 - c2);
  end
  %hold on
  plot(X,Y);
  
  % |a*r - c|; r = d*c + u; <u,c> = 0
  % used to not work properly, maybe switch c and r
  % Ok now
  alpha = dot(c2, r22)/(norm(r22)^2)
  norm(alpha*r22 - c2)
  % Answer
  alpha;
  %ddot = dot(alpha*r22 - c2, r22)
  %ddot = dot(alpha*r22 - c2, c2)
  
  minimu = fminbnd(@(x) (norm(x*r22 - c2)), 0, 1)
  norm(minimu*r22 - c2)
  %minimu*r22 - c2
  %ddot = dot(minimu*r22 - c2, r22)
  %ddot = dot(minimu*r22 - c2, c2)
  
  % Todo c) part
  % Ax = b
  % Rx = c
  % 3*10 = 30
  R;
  c;
  % Answer
  AA\b;
  
  
end