function A = diffdivididas (A)
  # A = [3 2;-1 5; 2 -2; 4 -3; -2 3]
  [n,m] = size(A);
  for i=1:n-1;
    for j=i+1:n
      A(j,i+2)= (A(j,i+1)-A(j-1,i+1))/(A(j,1)-A(j-i,1));
    endfor
  endfor
A
endfunction
