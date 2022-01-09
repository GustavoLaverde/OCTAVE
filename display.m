
valor = 5.3;
dato = 10;
letra = 'a';
mensaje = 'hola';

fprintf("---Flotates---\n")
fprintf("El valor es %f en la variable - flotante\n",valor)
fprintf("El valor es %e en la variable - notacion cientifica\n",valor)
fprintf("El valor es %g en la variable - sin ceros\n",valor)
fprintf("---Enteros---\n")
fprintf("El valor es %i en la variable - entero\n")
fprintf("El dato es %i en la variable - entero\n")
fprintf("El dato es %f en la variable - flotante\n")
fprintf("---Caracteres y cadenas---\n")
fprintf("La letra es %c en la variable - caracter\n",letra)
fprintf("El mensaje es %s en la variable - string\n",mensaje)
fprintf("---Impresion de varias variables---\n")
fprintf("El valor es %f y el dato es %i \n",valor,dato)
fprintf("%f \t %i \n",valor,dato)

numero = 3.67554323;
fprintf("El numero es %5.2f\n",numero)
fprintf("El numero es %05.2f\n",numero)