clc
clear all

format long

A = [15, 6, 8, 11; 6, 6, 5, 3; 8, 5, 7, 6; 11, 3, 6, 9];

b = [1, 1, 1, 1]';

A2 = A * A;
A3 = A2 * A;
A4 = A3 * A;

lugauss(A2);

L = eye(columns(A2)) + tril(A2, -1);
U = triu(A2);

y = L \ b;
x = U \ y


[L, U, P] = lu(A2);

y = L \ b;
x = U \ y
x = A2 \ b


lugauss(A3);

L = eye(columns(A3)) + tril(A3, -1);
U = triu(A3);

y = L \ b;
x = U \ y


[L, U, P] = lu(A3);

y = L \ b;
x = U \ y

x = A3 \ b



lugauss(A4);

L = eye(columns(A4)) + tril(A4, -1);
U = triu(A4);

y = L \ b;
x = U \ y


[L, U, P] = lu(A4);

y = L \ b;
x = U \ y

x = A4 \ b