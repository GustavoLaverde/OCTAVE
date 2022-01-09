## METODO DE LA CUATRISECCION

clc
funcion = input('Escriba la f(x) entre parentesis:','s')
funcion = inline(funcion);

x0 = input('Ingrese el valor de xi inferior: ');
x4 = input('Ingrese el valor de xu superior: ');

tol = input('Ingrese la tolerancia:');
i=1;

if funcion(x0)*funcion(x4)<0

fprintf("%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n", 'i','x0','x1','xr','x3','x4','f(x0)','f(x1)','f(x2)','f(x3)','f(x4)','f(xr)','INTERVALO','ERROR')
error = abs((x4 - x0)/2);
while error > tol
    int = (x4-x0)/4;
    xr = (x0+x4)/2;
    x1 = x0 + int;
    x2 = x1 + int;
    x3 = x2 + int;
    error = abs((x4 - x0)/2);
    fprintf("%d\t", i) 
    i++;
    fprintf("%.4f\t", x0)
    fprintf("%.4f\t", x1)
    fprintf("%.4f\t", x2)
    fprintf("%.4f\t", x3)
    fprintf("%.4f\t", x4)
    fprintf("%.4f\t", funcion(x0))
    fprintf("%.4f\t", funcion(x1))
    fprintf("%.4f\t", funcion(x2))
    fprintf("%.4f\t", funcion(x3))
    fprintf("%.4f\t", funcion(x4))
    fprintf("%.4f\t", funcion(xr))
       
 if funcion(x0)*funcion(x1)<0
    fprintf("  %s\t\t",'x0-x1')
    x4 = x1; 
 
 elseif funcion(x1)*funcion(x2)<0
    fprintf("  %s\t\t",'x1-x2')
    x0 = x1;
    x4 = x2;
    
 elseif funcion(x2)*funcion(x3)<0
    fprintf("  %s\t\t",'x2-x3')
    x0 = x2;
    x4 = x3;
    
 elseif funcion(x3)*funcion(x4)<0
    fprintf("  %s\t\t",'x3-x4')
    x0 = x3;
    
 elseif funcion(x1)==0
    fprintf(" %s\t0\n","raiz x1")
    xr = x1;
    break 
    
 elseif funcion(x2)==0
    fprintf(" %s\t0\n","raiz x2")
    xr = x2;
    break 
 
 elseif funcion(x3)==0
    fprintf(" %s\t0\n","raiz x3")
    xr = x3;
    break 
     
 endif
    fprintf("%.8f\t", error)
    fprintf("\n")   


endwhile

     fprintf(" la raiz aproximada es: %.8f \n", xr)
     fprintf(" El numero de iteraciones es: %d \n", i-1)
else
 fprintf("%s","no se puede resolver por este metodo")
endif