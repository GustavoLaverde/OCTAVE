clear;clc;

#Norma Unitaria'
#Viene dada por la mayoria de todas las cantidades 
#que se obtienen al sumar los modulos de los elementos 
#de cada COLUMNA
A = [3 -5 7; -2 6 -4; 0 -2 8]
normaUnitaria = norm(A,1)

#Norma Infinita'
#Viene dada por la mayoria de todas las cantidades 
#que se obtienen al sumar los modulos de los elementos 
#de cada FILA
A = [3 -5 7; -2 6 -4; 0 -2 8]
normaUnitaria = norm(A,'inf')

#Norma Frobenius'
#Viene dada por la raiz cuadrada de la suma de 
#cuadrados de cada elemento
A = [2 1 -4; 5 0 -1]
normaUnitaria = norm(A,'fro')

#Norma Euclideana'
#Viene dada por raiz del mayor valor propio del producto de (A traspuesta) por (A)
A = [0 1 0; 0 0 1; 14 12 5]
A_traspuesta = A'
At_x_A = A'*A
normaEuclidiana = norm(A,2)

