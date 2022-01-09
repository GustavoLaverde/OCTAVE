## VER SI LA FUNCION DEL PUNTO FIJO CONVERGE CON UN ERROR DADO
clc
clear
funcion = input('Escriba la f(x) entre parentesis:','s')
funcion = inline(funcion);

P0 = input('Ingrese el valor de P0: ');

error1 = input('Ingrese el error: ');
i=1;
error = error1 + 1;
fprintf("%s\t%s\t\t%s\t\t%s\n", 'i','P0','error','error%')

while error > error1
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

