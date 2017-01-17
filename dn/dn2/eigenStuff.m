function [eigenval, dst] = eigenStuff()
  N = 10;
  A = zeros(N);
  for i=1:N
    for j=1:N
      A(i,j) = abs(i-j); 
    end
  end
  orig = A;
  eigenval = zeros(1,N);
  for j=1:N
    [e,x,step] = potenc(A);
    eigenval(j) = e;
    % x is eigenvector and e is eigenvalue
    A = A - e*(x*x');
  end 
  
  eigenval = sort(eigenval);
  sort(eig(orig)');
  abs(eigenval - sort(eig(orig)'));
  dst = abs(eigenval - sort(eig(orig)'));
end