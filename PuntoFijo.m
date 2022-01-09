clc;
clear;
funcion = input('Escriba la f(x) entre parentesis:','s')
funcion = inline(funcion);

P0 = input('Ingrese el valor de P0 inferior: ');

cantidad = input('Ingrese el numero de iteraciones:');
i=1;

fprintf("%s\t%s\t\t%s\t\t%s\n", 'i','P0','error','error%')

while i <= cantidad
    fprintf("%d\t", i) 
    fprintf("%.8f\t", P0)
    if(i==1)
      fprintf("-\t\t-")
    else
      fprintf("%.8f\t", error)
      fprintf("%.3f\t", errorPorc)
    endif
    Pr = funcion(P0);
    error = abs(Pr-P0);
    errorPorc = abs(error/Pr)*100;
    P0 = Pr;
    fprintf("\n") 
    i++;
endwhile

