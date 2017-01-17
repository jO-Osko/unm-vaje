r1 = 0.05;
r2 = 0.10;
r3 = 0.15;

p1 = 10e3;
p2 = 12e3;
p3 = 15e3;

if 0
  r1 = r1 * 100;
  r2 = r2 * 100;
  r3 = r3 * 100;
end
if 1
  p1 = p1 * 0.001;
  p2 = p2 * 0.001;
  p3 = p3 * 0.001;
end

F = inline(strcat(...
  '[ x(1)*exp(x(2) * ', num2str(r1), ')+x(3)*', num2str(r1),'-',num2str(p1),';',...
  '  x(1)*exp(x(2) * ', num2str(r2), ')+x(3)*', num2str(r2),'-',num2str(p2),';',...
  '  x(1)*exp(x(2) * ', num2str(r3), ')+x(3)*', num2str(r3),'-',num2str(p3),']'));

x0 = [10; 10; -20];

JF = inline(strcat(...
  '[ exp(x(2) * ', num2str(r1), '),', 'x(1)*',num2str(r1),'*exp(x(2) * ', num2str(r1), '),' ,num2str(r1),';',...
  '  exp(x(2) * ', num2str(r2), '),', 'x(1)*',num2str(r2),'*exp(x(2) * ', num2str(r2), '),' ,num2str(r2),';',...
  '  exp(x(2) * ', num2str(r3), '),', 'x(1)*',num2str(r3),'*exp(x(2) * ', num2str(r3), '),' ,num2str(r3),']'));


F(x0);
JF(x0);
y = newton(F, JF, x0)

p = 500; % in kN
d = 0.5;

F_min = @(x) (y(1)*exp(y(2)*x) + y(3)*x - p);

sol = fzero(F_min, 0.15)

