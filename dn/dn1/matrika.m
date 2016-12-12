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
  
  C_1 = norm(C, 1)
  D_1 = norm(D, 1)
  
  C_fro = norm(C, "fro")
  D_fro = norm(D, "fro")
  
  C_inf = norm(C, inf)
  D_inf = norm(D, inf)

  C_vec_inf = max(abs(C(:))) % not a matrix norm
  D_vec_inf = max(abs(D(:))) % not a matrix norm

  sq = sqrt(size(C,1))
  sq = sqrt(size(C,1))

  minc2 = max([C_fro/sq C_inf/sq C_1/sq C_vec_inf])
  maxc2 = min([C_fro C_inf*sq C_1*sq sqrt(C_1 * C_vec_inf)])

  mind2 = max([D_fro/sq D_inf/sq D_1/sq D_vec_inf])
  maxd2 = min([D_fro D_inf*sq D_1*sq sqrt(D_1 * D_vec_inf)])
  
  C_2_norm = norm(C,2) % max(eig(F*transpose (F)))
  D_2_norm = norm(D,2) % max(eig(F*transpose (F)))



  D_1 = norm(D, 1)
  D_fro = norm(D, "fro")
  D_inf = norm(D, inf)

  D_vec_inf = max(abs(D(:))) % not a matrix norm

  sq = sqrt(size(D,1))

  mind2 = max([D_fro/sq D_inf/sq D_1/sq D_vec_inf])
  maxd2 = min([D_fro D_inf*sq D_1*sq sqrt(D_1 * D_vec_inf)])

  D_2_norm = norm(D,2) % max(eig(F*transpose (F)))
  
  
  
end

[A, B, C, D] = matrika(n)

C_1 = norm(C, 1)
C_fro = norm(C, "fro")
C_inf = norm(C, inf)

C_vec_inf = max(abs(C(:))) % not a matrix norm

sq = sqrt(size(C,1))

minc2 = max([C_fro/sq C_inf/sq C_1/sq C_vec_inf])
maxc2 = min([C_fro C_inf*sq C_1*sq sqrt(C_1 * C_vec_inf)])

C_2_norm = norm(C,2); % max(eig(F*transpose (F)))



D_1 = norm(D, 1)
D_fro = norm(D, "fro")
D_inf = norm(D, inf)

D_vec_inf = max(abs(D(:))) % not a matrix norm

sq = sqrt(size(D,1))

mind2 = max([D_fro/sq D_inf/sq D_1/sq D_vec_inf])
maxd2 = min([D_fro D_inf*sq D_1*sq sqrt(D_1 * D_vec_inf)])

D_2_norm = norm(D,2); % max(eig(F*transpose (F)))

[L_c, U_c, P_c] = lu(C)
[L_d, U_d, P_d] = lu(D)

cond(C) % 1,2,inf, "fro"
cond(D) % 1,2,inf, "fro"

hasLru(C);
hasLru(D);



