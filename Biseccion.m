function raiz = Biseccion(def,x0,x1,tol)
f = inline(def);
k = 0;
fprintf('%s\t%s\t\t%s\n','k','x','f(c)');
if f(x0)*f(x1)<0
  x=x0;
  while abs(f(x))>tol
    x = (x1+x0)/2;
    if f(x0)*f(x)<0
      x1 = x;
    else
      x0 = x;
    endif
    k=k+1;
    fprintf('%d\t%f\t%e\n',k,x,f(x))
  endwhile
  raiz = x;
else 
  raiz = "No hay cambios de signo";
endif
endfunction
