clc;
clear;
fprintf ("***METODO DE HALLEY***\n");

f = input('Escriba la f(x) entre parentesis:','s')
f1 = input("Escriba la f'(x) entre parentesis:",'s')
f2 = input("Escriba la f''(x) entre parentesis:",'s')

f = inline(f);
f1 = inline(f1);
f2 = inline(f2);

xi = input('Ingrese el Punto Inicial: ');
tol = input('Ingrese la tolerancia: ');

i=1;

#funcion que retorna el error aproximado
function ea = errora(xa, xp)
    ea = abs(((xa - xp))*100);
end

if f1(xi) == 0
    fprintf ('no se puede hallar una raiz');
else 
    xn = xi-((f(xi)/f1(xi))*((1-((f(xi)*f2(xi))/(2*(f1(xi)^2))))^(-1)));
    fprintf ("_____________________________________________________________________________________________________\n");
    fprintf("%s\t%s\t\t%s\t\t%s\t\t%s\t\t%s\t\t%s\n",'n','Xn','f(xi)',"f'(xi)","f''(xi)",'Xn+1','|Xn+1-Xn|');
    fprintf ("_____________________________________________________________________________________________________\n");
    while errora(xn, xi) > tol
      fprintf('%.0f\t',i);
      fprintf('%.8f\t',xi);
      fprintf('%.8f\t',f(xi));
      fprintf('%.8f\t',f1(xi));
      fprintf('%.8f\t',f2(xi));
      fprintf('%.8f\t',xn);
      fprintf('%.8f\t',errora(xn,xi));
      fprintf ("\n");
      xi=xn;
      xn= xi-((f(xi)/f1(xi))*((1-((f(xi)*f2(xi))/(2*(f1(xi)^2))))^(-1)));
      i++;
    endwhile
      fprintf('%.0f\t',i);
      fprintf('%.8f\t',xi);
      fprintf('%.8f\t',f(xi));
      fprintf('%.8f\t',f1(xi));
      fprintf('%.8f\t',f2(xi));
      fprintf('%.8f\t',xn);
      fprintf('%.8f\t',errora(xn, xi));
      fprintf ("\n");
      fprintf ("_____________________________________________________________________________________________________\n");
      fprintf('\nLA RAIZ APROXIMADA ES:  %.8f\n', xn);       
      fprintf('\nEL NUMERO DE ITERACIONES ES:  %d\n', i);   
endif