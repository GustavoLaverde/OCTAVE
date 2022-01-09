function [L,U] = lablu (a)
  n = length(a);
  for k=1:n
    L(k,k)=1;
    for j =k:n
      suma = 0;
      for s =1:k-1
        suma = suma+L(k,s)*U(s,j);
      endfor
      U(k,j)=a(k,j)-suma;
    endfor
    for i=k:n
      suma = 0;
      for s=1:k-1
        suma = suma+L(i,s)*U(s,k);
      endfor
      L(i,k)=(a(i,k)-suma)/U(k,k);
    endfor
  endfor

endfunction
