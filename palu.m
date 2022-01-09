function [L,U,P,X] = palu (A,b)
  n = length(A);
  P = eye(n);
  for i=1:n-1
    [aux,pos]=max(A(i:n,i:n));
    j = pos(1)+i-1;
    c = A(i,:); A(i,:)=A(j,:); A(j,:)=c;
    c = P(i,:); P(i,:)=P(j,:); P(j,:)=c;
    
    A(i+1:n,i)=A(i+1:n,i)/A(i,i);
    A(i+1:n,i+1:n)=A(i+1:n,i+1:n)-A(i+1:n,i)*A(i,i+1:n); 
  endfor
  
  L = tril(A,-1)+eye(n);
  U = triu(A);
  y = inv(L)*P*b;
  X = inv(U)*y;
  
endfunction
