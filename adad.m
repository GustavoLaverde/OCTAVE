syms a;
syms e;
x1 = a;
x2 = e;
for i=1:9
  x2 = (x1-x2)/(-2)
  x1 = a/factorial(i);
endfor
x2