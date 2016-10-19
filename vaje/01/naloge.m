% 1.

n = 10;
A = zeros(n);

for i = 1:n
  for j = 1:n
    if i == j
      A(i,j) = i;
    elseif i < j    
      A(i,j) = 2;
    elseif i == j + 1
      A(i,j) = -1;
    end
  end
end

display(A)

% 2.

n = 10;
% Hm, hm hm
% A = randi(intmax, n); % Does not allow matrix multiplication
A = double(randi(intmax, n)); % Possible loss of precission (so it seems)
% Zakaj so tezave pri prevelikih stevilkah?
% A = round(intmax * rand(n));
A = round(10 * rand(n));
AA = A^2;
AAA = A.^2;




% 3.
n = 10;
m = 5;
xs = round(100*rand(n, 1));
ys = round(100*rand(m, 1));
for j=1:m
    if ys(j) == 0
        ys(j) = 1;
    end
end

A = zeros(n,m);
for i=1:n
    for j=1:m
        A(i,j) = xs(i)/ys(j);
    end
end

a = A;

% 

function rtr = inp()
  x = input("vpisi");
  if x < 2
    rtr = 2;
  elseif x <= 20
    rtr = x - 4;
  else
    rtr = -x;
   end
end

%
function rtr = vec_sum(xs)
  su = [xs(1)];
  
  for j=2:length(xs)
    su = [su su(end) + xs(j)];
  end
  
  rtr = su;
end

%xs = linspace(1,3, 1000);

%plot(xs, sin(xs).*exp(sqrt(xs)));

ts = linspace(0, 2*pi, 1000);

%plot(sin(ts), cos(ts));

xs = linspace(0,1,1000);

[xx, yy] = meshgrid(xs, xs);

%zz = (xx.*xx + yy.*yy) ./(1 + xx +yy);

mesh(xx, yy, zz);




















