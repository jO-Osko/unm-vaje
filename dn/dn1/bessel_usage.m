x = 0.1;

bes = Bessel(x);
for alp = 0:5
  bes_orig = besselj(alp + 0.5, x);
  abs(bes(alp + 1) - bes_orig)  
end  