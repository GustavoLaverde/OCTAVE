clc;
fprintf ("***METODO DE NEWTON RAPSHON***\n");

f = input('Escriba la f(x) entre parentesis:','s')
f = inline(f);
d = input("Escriba la f'(x) entre parentesis:",'s')
d = inline(d);

xi = input('Ingrese el Punto Inicial: ');
error = input('Ingrese el error: ');
i=1;

if d(xi) == 0
    fprintf ('no se puede hallar una raiz');
else 
    xn= xi-(f(xi)/d(xi));
    ea = abs(xn - xi);
    fprintf ("____________________________________________\n");
    fprintf("%s\t\t %s\t\t  %s\n",'I','XN','|Error|  ');
    fprintf ("____________________________________________\n");
    while ea > error
      fprintf('%.0f\t\t',i);
      fprintf('%.8f\t',xn);
      fprintf('%.8f\t',ea);
      ea = abs(xn - xi);
      fprintf ("\n");
      xi=xn;
      xn= xi-(f(xi)/d(xi));
      i++;
    endwhile
      ea = abs(xn - xi);
      fprintf('%.0f\t\t',i);
      fprintf('%.8f\t',xn);
      fprintf('%.8f\t',ea);
      fprintf ("\n");
      fprintf ("____________________________________________\n");
      fprintf('\nLA RAIZ APROXIMADA ES:  %.8f\n', xn);        
endif