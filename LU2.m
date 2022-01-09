function [L,U] = LU2(A)
  n = length(A);
  L = eye(n);
  U = A;
  
  for i = 1:n-1
    pivote = U(i,i);
    for j =i+1:n 
      f = U(j,i)/pivote;
      L(j,i)=f;
      U(j,:)=U(j,:)-U(i,:)*f;
    endfor
  endfor

endfunction

