##HALLANDO LA NORMA EUCLIDEANA##

 C = [10 0 0 2;0 5 4 0; 0 15 14 0; 1 0 0 1]
 X = [1;1;1;1];
 tol = 1;
 n = 40;
 [h,h] = size(C);
 X = C * X;
 [a,b] = max(abs(X));
 L1 = X(b);
 V = (1/(L1))*X;
 i = 1;
 err = tol + 1;
  
  while err > tol
    X = C * V;
    [a,b] = max(abs(X));
    L = X(b);
    err = abs(L-L1);
    L1 = L;
    V = (1/(L1))*X;
    i++;
  endwhile
  
valorDOM = L
normaEuclideana = sqrt(L)
i