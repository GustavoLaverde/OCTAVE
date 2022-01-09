function y = Plagrange (x, xdato, ydato)
n = length(xdato)-1;
y = 0;
  for i=0:n
    y = y + fbaselag(x,i,xdato).*ydato(i+1);
  endfor
endfunction
