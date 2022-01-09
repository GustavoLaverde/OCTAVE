clear;
clc;


# CALCULO DE CENTROIDE DE POLIGONOS
coords = ...
[0 5 10; 
 1 -5 10; 
 2 -5 -10;
 3 5 -10;
 4 5 10];

#[0 0 0; 
# 1 4 0; 
# 2 1.17 108;
# 3 0 108;
# 4 0 0];
 temp = size(coords);
 n = temp(1);
 
 x = coords(:,2);
 xmax = max(x);
 y = coords(:,3);
 ymax = max(y);
 
 A = 0;
 Cx = 0;
 Cy = 0;
  
 for i=1:(n-1)
   A = A + 1/2*(x(i)*y(i+1)-x(i+1)*y(i));
 endfor
 
 for i=1:(n-1)
   Cx = Cx + 1/(6*A)*(x(i)+x(i+1))*(x(i)*y(i+1)-x(i+1)*y(i));
   Cy = Cy + 1/(6*A)*(y(i)+y(i+1))*(x(i)*y(i+1)-x(i+1)*y(i));
 endfor
 
 axis([0,xmax,0,ymax])
 
 hold on;
 grid on;
 plot(x,y,"linewidth",3,"color","K")
 plot(Cx,Cy,"color","R","o","markersize",7)
 plot(Cx,Cy,"color","R","+","markersize",7)

 fprintf("Area de la figura: %f\n",A);
 fprintf("Abscisa del centroide: %f\n",Cx);
 fprintf("Ordenada del centroide: %f\n",Cy);
 
 
 
 
 
 