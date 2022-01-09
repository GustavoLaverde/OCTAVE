function f = legen (n)
  if n==0
    f=1;
  elseif n==1
    f=poly(0);
  else
    f=((2*n-1)/n)*conv(poly(0),legen(n-1))-[0 0 ((n-1)/n)*legen(n-2)];
  endif

endfunction
