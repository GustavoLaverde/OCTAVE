function [mi, di]= menor(i, A)
  
  mi = A(1:i,1:i);
  di = det(mi);
  if (abs(di)<0.0005)
    fprintf("di = \n\t0\n")
  else
    fprintf("di = \n\t%.2f\n",di)
  endif
  
endfunction
