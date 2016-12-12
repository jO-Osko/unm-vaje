function xx = getX(pol, limit, start_pos, eps)
  if nargin < 2
    limit = 100;
  end
  if nargin < 3
    start_pos = 0;
  end
  if nargin < 4
    eps = 1e-12;
  end
  r = transpose(roots(pol));
  zer_orig = r(imag(r)==0);
  zer_orig = sort([zer_orig start_pos]);
  zer_orig = [zer_orig(1) - 1000 zer_orig zer_orig(end)+100];
  sig = [];
  zer = [];
  for i=1:size(zer_orig,2)-1
    if zer_orig(i) < start_pos
      continue
    end
    zer = [zer zer_orig(i)];
    if polyval(pol, (zer_orig(i) + zer_orig(i+1))/2) < 0
      sig = [sig -1];
    else
      sig = [sig 1];
    end
  end
  su = 0;
  for i=1:size(zer,2)-1
    part = diff(polyval(polyint(pol), [zer(i) zer(i+1)])) * sig(i);
    %part2 = abs(diff(polyval(polyint(pol), [zer(i) zer(i+1)])))
    if su + part > limit
      xx = fzero(@(x_t) (su - limit + diff(polyval(polyint(pol), [zer(i) x_t])) * sig(i)), [zer(i) zer(i+1)]);
      return
    end
    su = su + part;
  end
  [zer(end) zer(end)+10000];
  xx = fzero(@(x_t) (su - limit + diff(polyval(polyint(pol), [zer(end) x_t])) * sig(end)), [zer(end) zer(end)+1000]);
end


% Usage
getX([1 -1 2 -2 -15 15], 100, 0)