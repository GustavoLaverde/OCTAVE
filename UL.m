function [U,L] = UL(A)
  n = length(A);
  U = eye(n);
  L = A;
  
  for i = n:-1:2
    pivote = L(i,i);
    for j =i-1:-1:1 
      f = L(j,i)/pivote;
      U(j,i)=f;
      L(j,:)=L(j,:)-L(i,:)*f;
    endfor
  endfor

endfunction
