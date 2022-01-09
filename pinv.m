function [L,V] = pinv (A,X,tol,n) 
  [h,h] = size(A);              
  A = inv(A);                   
  X = A * X;                    
  [a,b] = max(abs(X));          
  L1 = X(b);
  V = ((L1))*X;
  i = 1;
  err = tol + 1;
  
  while err > tol
    X = A * V;
    [a,b] = max(abs(X));
    L = 1/X(b);
    err = abs(L-L1);
    L1 = L;
    V = ((L1))*X;
    i++;
  endwhile

printf('Numero de iteraciones = %0.0f\n',i);

endfunction