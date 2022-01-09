function y = fbaselag (x, i, nodos)
n = length(nodos)-1;
y = 1;
for j = 0:n;
  if i~=j
    y = y.*(x-nodos(j+1))./(nodos(i+1)-nodos(j+1));  
  endif
endfor
endfunction
