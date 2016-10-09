function rtr = matrika(xs, ys, zs)
   A = zeros(length(xs), length(ys));
   
   
   if nargin < 2
    l_z = length(z);
   else
    l_z = 0;
   end
   
   for i = 1:length(xs)
    for j = 1: length(ys)
      if l_z >= i+j
        A(i, j) = z(i+j);
      elseif xs(i) ~= 0 || ys(j) ~= 0
        A(i,j) = (xs(i) + ys(j))/(xs(i)^2 + ys(j)^2);
      end
    end
   end
  rtr = A;
end