clear;clc;
  xo = [1;1;0];
  pkg load symbolic
  
  ## Cargamos una libreria que nos permita usar valores sym (simbolicos)
  clc;
  syms x y a
  fname = [x-((2*a)/(a^2+1));y-(a*x);x-y+'0.5'];
  
  fprima = jacobian(fname,[x,y,a]);
  tolerancia = 0.05;
  maxiter  = 100;
  iter = 1;
  f = function_handle(fname);
  jf = function_handle(fprima);
  error = norm(f(xo(1),xo(2),xo(3)),inf);
  fprintf('error = %12.8f\n',error);
  
  while error >= tolerancia
    fxo = f(xo(1),xo(2),xo(3));
    fpxo = jf(xo(1),xo(2),xo(3));
    x1 = xo - inv(fpxo)*fxo;
    fx1 = f(x1(1),x1(2),x1(3));
    error = norm((fx1-fxo),'inf');
    fprintf('Iter %2d raiz x=(%14.9f,%14.9f,%14.9f) f(x)=(%14.9f,%14.9f,%14.9f)\n',iter,x1(1),x1(2),x1(3),fx1(1),fx1(2),fx1(3));
  if iter > maxiter
    fprintf('Número máximo de iteraciones excedido \n');
    return;
  endif
  xo = x1;
  iter = iter+1;
  fprintf('error = %12.8f\n',error);
  endwhile
