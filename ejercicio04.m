A = [2, 1; 1, 3];

b = [1, 0]';

x0 = [1, 1/2]';

m1 = [];

m2 = [];

maxit = 1000;
tol = 10 ^ (-8);

[x, flag, relres, iter, resvec, eigest] = pcg(A, b, tol, maxit, m1, m2, x0)


[xJ, iterJ] = itermeth(A, b, x0, maxit, tol, 'J')


[xG, iterG] = itermeth(A, b, x0, maxit, tol, 'G')