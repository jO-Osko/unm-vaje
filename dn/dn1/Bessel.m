function bessel = Bessel(x, to_n, alpha, final, semi_final)
  if nargin < 1
    x = 0.1;
  end
  if nargin < 2
    to_n = 20;
  end
  if nargin < 3 | alpha == 0
    alpha = getAlpha();
  end
  if nargin < 4
    final = 0;
  end
  if nargin < 4
    semi_final = 1;
  end
  bessel = [final semi_final];
  for k = 2:to_n
    next = semi_final/x - final;
    final = semi_final;
    semi_final = next;
    bessel = [bessel next];
  endfor
  bessel = fliplr(bessel)./alpha;
end

% alpha = SUM(am I_2m)

%usage

x = 0.1;

bes = Bessel(x);
for alp = 0:5
  bes_orig = besselj(alp + 0.5, x);
  abs(bes(alp + 1) - bes_orig)  
end  
  
  
 