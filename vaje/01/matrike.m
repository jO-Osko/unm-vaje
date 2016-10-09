% 1.

A = [3 1 6; 
     5 2 7];
x = [1 4 8];
y = [2 1 5];

x + y;        % Deluje
x + A;        % Deluje (x po vrsticah pristeje A)
A + x;        % Deluje (x po vrsticah pristeje A)
x' + y;       % Dopristeje matriko
% x * y       % Ne deluje
x' * y;       % Dopomnozi po vrsticah
[x; y];       % Definira po vrsticah
% [x; y']     % Ne deluje (dimenzije se ne ujemajo)
[x y];        % Appenda
% A - [x' y'] % Ne deluje (dimenzije se ne ujemajo)
A - [x' y']'  % Odsteje matriki
% A - [x y]   % Ne deluje (dimenzije se ne ujemajo)

% 2.
A = [3 2 8 1;
     7 2 5 6;
     0 7 3 5];

A';
A(2,3);
A(:,[1,4]);
A(:,2:4);
A([2 3], [3 1]);
A(:, 1:2:end);
A(:);
[A, A(:, end)];
A + eye(3,4);
A - 3;

diag(A);
diag(diag(A));
% A^2         % ne deluje
A.^2;
exp(A);
size(A);
A == 2;
max(A);
max(max(A));

% 3.

A_1 = ceil(10*rand(5));
A_2 = floor(10*rand(3));

A = [A_1         zeros(5,3);
     zeros(3,5)  A_2 ];

display(A(:, 3));
display(A(7, :));

A(6,5) = 7;

A(8,4) = A(8,4) + 1;

A(6:end, 1:3) = eye(3);

A(1:5, 6:end) = 3;

B = [A          fliplr(A);
     flipud(A)  A'];

C = A;
C(:, [4 5 6]) = [];
C(1:3, :) = [];

D = cat(3, A, A, A);























































     