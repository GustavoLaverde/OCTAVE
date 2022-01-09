function I = IntTrapecioC (f,a, b,n)
  h = (b-a)/n;
  I = f(a);
  
  for i = 1:n-1
    I = I+2*f(a+i*h);
  endfor
  I = (I+f(b))*h/2;
endfunction
