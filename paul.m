function [U,L,P,X] = paul(A,b)
  n = length(A);
  P = eye(n);
  for i=n:-1:2
    [aux,pos]=max(A(1:i,1:i));
    j = pos(1);
    c = A(i,:); A(i,:)=A(j,:); A(j,:)=c;
    c = P(i,:); P(i,:)=P(j,:); P(j,:)=c;
    
    A(i-1:-1:1,i)=A(i-1:-1:1,i)/A(i,i);
    A(i-1:-1:1,i-1:-1:1)=A(i-1:-1:1,i-1:-1:1)-A(i-1:-1:1,i)*A(i,i-1:-1:1); 
  endfor
  
  U = triu(A,+1)+eye(n);
  L = tril(A);
  y = inv(U)*P*b;
  X = inv(L)*y;
  
endfunction