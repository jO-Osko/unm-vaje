function bessel = Ifun(x, to_n, alpha, final, semi_final)
  if nargin < 1
    x = 0.1;
  end
  if nargin < 2
    to_n = 20;
  end
  if nargin < 3
    alpha = 1;
  end
  if nargin < 4
    final = 0;
  end
  if nargin < 4
    semi_final = 1;
  end
  bessel = [final semi_final];
  for k = 2:to_n
    next = 1/x * semi_final - final;
    final = semi_final;
    semi_final = next;
    bessel = [bessel next];
  endfor
  bessel = fliplr(bessel)./alpha;
end

% alpha = SUM(am I_2m)
