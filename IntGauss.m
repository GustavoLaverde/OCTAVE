function I = IntGauss (f,a,b,n)
  p = legen(n);
  x = sort(roots(p));
  A = zeros(n);
  B = zeros(n,1);
  
  for i=1:n
    A(i,:) = x.^(i-1);
    B(i) = (1-(-1)^(i))/i;
  endfor
  w = linsolve(A,B);
  z = zeros(1,n);
  for i = 1:length(x)
    z(i)=((b-a)/2)*x(i)+(a+b)/2;
  endfor
  I = 0;
  for i=1:n
    I = I + w(i)*f(z(i));
  endfor
  I = I*(b-a)/2;

endfunction
