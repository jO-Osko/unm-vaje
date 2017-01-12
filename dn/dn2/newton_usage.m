r1 = 0.05;
r2 = 0.10;
r3 = 0.15;
p1 = 10e3;
p2 = 12e3;
p3 = 15e3;

F = inline(strcat(...
  '[ x(1)*exp(x(2) * ', num2str(r1), ')+x(3)*', num2str(r1),'-',num2str(p1),';',...
  '  x(1)*exp(x(2) * ', num2str(r2), ')+x(3)*', num2str(r2),'-',num2str(p2),';',...
  '  x(1)*exp(x(2) * ', num2str(r3), ')+x(3)*', num2str(r3),'-',num2str(p3), ']')
);

x0 = [10; 10; -20];

JF = inline(strcat(...
  '[ exp(x(2) * ', num2str(r1), '),', 'x(1)*',num2str(r1),'*exp(x(2) * ', num2str(r1), '),' ,num2str(r1),';',...
  '  exp(x(2) * ', num2str(r2), '),', 'x(1)*',num2str(r2),'*exp(x(2) * ', num2str(r2), '),' ,num2str(r2),';',...
  '  exp(x(2) * ', num2str(r3), '),', 'x(1)*',num2str(r3),'*exp(x(2) * ', num2str(r3), '),' ,num2str(r3),']')
);

JF
F(x0);
JF(x0);
newton(F, JF, x0);
