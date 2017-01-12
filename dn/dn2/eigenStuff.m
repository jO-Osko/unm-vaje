function [val, dst, data] = eigenStuff()
  N = 10;
  A = zeros(N);
  for i=1:N
    for j=1:N
      A(i,j) = abs(i-j); 
    end
  end
  orig = A;
  val = zeros(1,N);
  for j=1:N
    [e,x,step] = potenc(A);
    val(j) = e;
    A = A - e*(x*x');
  end 
  
  val = sort(val);
  sort(eig(orig)');
  abs(val - sort(eig(orig)'));
  dst = abs(val - sort(eig(orig)'));
end