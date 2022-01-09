function [L,U] = LU(A)
  n = length(A);
  L = eye(n);
  U = eye(n);
  for k=1:n
    L(k,k)=1;
    U(1,k)=A(1,k);
    for i=k:n
      U(k,i)= A(k,i)-L(k,1:k-1)*U(1:k-1,i);
    endfor
    for i=k+1:n
      L(i,k)= (A(i,k)-L(i,1:k-1)*U(1:k-1,k))/U(k,k);
    endfor
  endfor
endfunction
