function func = gen_fun(r, p)
  func = @(k1, k2, k3) (k1 * exp(k2 * r) + k3 * r - p); 
end