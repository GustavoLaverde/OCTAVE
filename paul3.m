function [L,U,P] = paul(A)
  n = length(A);
  P = eye(n);
  U = eye(n);
  for i=n:-1:2
    [aux,pos]=max(abs(A(1:i,i)))
    j = pos(1)
    
    c = A(i,:); A(i,:)=A(j,:); A(j,:)=c
    c = P(i,:); P(i,:)=P(j,:); P(j,:)=c
    
    pivote = A(i,i)
    for j =i-1:-1:1 
      f = A(j,i)/pivote
      U(j,i)=f
      A(j,:)=A(j,:)-A(i,:)*f
    endfor
  endfor
  L=A;
endfunction
