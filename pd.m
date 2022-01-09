function [L,V] = pd (A,X,tol)
  [h,h] = size(A);             #Hallamos el orden de A
  X = A * X;                   #Hallamos la primera iteracion x1
  [a,b] = max(abs(X));         #Hallamos la mayor componente del vector (Este sera el valor propio en la primera iteracion)
                               #en este caso b indica el orden de la fila en la que se encuentra el mayor componente
  L = X(b);                   #Hallamos el factor  para luego dividir a x1
  V1 = (1/(L))*X;              #Hallamos el vector propio asociado al valor propio
  i = 1;                    
  err = tol + 1;               #Para que entre al bucle hacemos que el error sea la tolerancia mas 1
  
  while err > tol              #Repetimos los pasos hasta que el error sea menor a la tolerancia
    X = A * V1;                    
    [a,b] = max(abs(X));
    L = X(b);
    V = (1/(L))*X;
    err = norm((V-V1),2);      #Hallamos el error con la norma '2' entre
                               #el vector propio hallado en esa iteracion y el vector propio hallado una iteracion anterior 
    V1 = V;
    i++;
  endwhile                     #El valor propio dominante aproximado sera L, y se dara cuando se termine el bucle 
                               #El vector propio respectivo sera V                  
printf('Numero de iteraciones = %0.0f\n',i);
endfunction