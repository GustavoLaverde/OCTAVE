function [expA] = exponencial (A, n)
  sum = zeros(n);
  i = 0;
  while (i<300)
    sum = sum + ((A^(i))/factorial(i));
    i++;
  endwhile
  expA = sum;
endfunction
