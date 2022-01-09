function [detOrdenados]= menorPrincipal (A)  
  n=length(A)
 for(i=1:n)
  mi = A(1:i,1:i);
  di(i) = det(mi);
endfor
  
for(i=1:n-1)
  for(j=1:n-1)
    if(di(j)<di(j+1))
      aux = di(j);
      di(j) = di(j+1);
      di(j+1)= aux;
    endif
  endfor
endfor
  detOrdenados = di;
endfunction
