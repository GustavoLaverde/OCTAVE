function [L] = cholesky (A)
  n = size(A,1);
  L = zeros(n);
  
  for i = 1:n;
    L(i,i) = sqrt(A(i,i)-dot(L(1:i-1,i),L(1:i-1,i)));
    for j = i+1:n
      L(i,j) = (A(i,j) - dot(L(1:i-1,i),L(1:i-1,j)))/L(i,i);
    endfor
  endfor

endfunction
