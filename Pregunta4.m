function retval = Pregunta4(matriz, n)
  if (n == 0);
    rest = 1;
  else
    rest = matriz*Pregunta4(matriz,n-1);
  endif
  retval = rest;
return
endfunction



