function [datos] = lector (archivo, escala,d_t)
  
  a = fopen(archivo,'r');        ##---Abrimos el archivo .TXT---##
  c = fscanf(a,'%f',[1 inf]);    ##---Introducimos los datos en una matriz---##
  datos(:,2) = escala*c';        ##---En la columna 2 estaran los valores del sismo---##
  n = length(c);                
  datos(:,1)=[0:d_t:d_t*(n-1)]'; ##---En la columna 1 estaran los tiempos---## 
  fclose(a);
  
endfunction



