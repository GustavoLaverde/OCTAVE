fprintf("Matriz ");
A = [1 4 5; 5 6 7; 9 10 1] # Matriz de prueba
n = length(A); # Hallando la dimesion de A
fprintf("Matriz ");
I = eye(n)

for(i=1:n)
pivote = A(i,i);  
  for(k=1:n)
    A(i,k)=A(i,k)/pivote; # Convirtiendo toda la diagonal principal de A en 1
    I(i,k)=I(i,k)/pivote; # Convirtiendo toda la diagonal principal de I en 1
  endfor
  for(j=1:n)
    if(i!=j) #elementos que no esten en la diagonal principal
      aux = A(j,i); # Valor para hacer 0 todos los valores menos la diagonal principal
      for(k=1:n)    
        A(j,k)=A(j,k)-aux*A(i,k);  # Convertimos en ceros con ayuda del aux
        I(j,k)=I(j,k)-aux*I(i,k);
      endfor
     endif
  endfor
endfor
fprintf("Matriz Inversa ");
I
