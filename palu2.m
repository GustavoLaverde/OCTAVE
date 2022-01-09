function [L,U,P] = palu2(A)
  n = length(A);
  P = eye(n);
  L = eye(n);
  for i=1:n-1
    [aux,pos]=max(abs(A(i:n,i)));
    j = pos(1)+i-1;
    
    c = A(i,:); A(i,:)=A(j,:); A(j,:)=c;
    c = P(i,:); P(i,:)=P(j,:); P(j,:)=c;
    
    pivote = A(i,i);
    for j =i+1:n 
      f = A(j,i)/pivote;
      L(j,i)=f;
      A(j,:)=A(j,:)-A(i,:)*f;
    endfor
  endfor
  U=A;
endfunction
