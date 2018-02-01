%clc
%clear all

A = [3, 2; 2, 6];

b = [2, 8]';

x0 = [0, 0]';

nmax = 1000;

tol = 10 ^ (-8)

[x, iter] = itermeth(A,b,x0,nmax,tol, 'J')


for i = 1:iter
    [x, iteraciones] = itermeth(A, b, x0, i, tol, 'J')
end

