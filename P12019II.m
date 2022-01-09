x= (-10:0.2:10);

y= sin(x) - x.^2;
z= log(x.^2+1)-exp(x/2);

plot(x,y,x,z);

#a) Grafica
#b) intervalos donde se encuentran los
#   puntos de interseccion :
#   <-1;0> U <1;2> U <8;9>

