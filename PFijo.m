function [res, it] = PFijo (f,x0, tol)
it = 0;
f = inline(f);
A = fopen('pfijo.xls','w');
x1 = f(x0);
E = abs(x1-x0);
y = [it x0 x1 E];
fprintf(A,'\t%d \t%6.7f \t%6.7f \t%6.7f\n',y)
while abs(x0-x1)>tol
  it = it+1;
  x0 = x1;
  x1 = f(x0);
  E = abs(x1-x0);
  y = [it x0 x1 E];
fprintf(A','\t%d \t%6.7f \t%6.7f \t%6.7f\n',y);  
endwhile
fclose(A);
res =x1;
endfunction
