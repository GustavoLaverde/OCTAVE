function [x] = NRSL (F,J,x0,tol)
  
  x = x0;
  error = tol+1;
  n=0;
  
  while error > tol
    dx = -J(x)\F(x);
    error = norm(dx,inf);
    x = x + dx;
    n = n+1;
  endwhile
  fprintf("Iteraciones: %d\n",n)
endfunction

## F = @(x)[x(1)^2-x(2)^2+2*x(2);2*x(1)+x(2)^2-6]
## J = @(x)[2*x(1),-2*x(2)+2;2,2*x(2)]
## [x] = NRSL (F,J,x0,tol)