## theta= [pi/3, pi/4, pi/6]
t = (0:0.1:3);
x1 = (20)*cos(pi/3)*t;
y1 = (20)*sin(pi/3)*t-(1/2)*9.81*(t.^2);
x2 = (20)*cos(pi/4)*t;
y2 = (20)*sin(pi/4)*t-(1/2)*9.81*(t.^2);
x3 = (20)*cos(pi/6)*t;
y3 = (20)*sin(pi/6)*t-(1/2)*9.81*(t.^2);

plot(x1,y1,"-sr;proy1;",x2,y2,"-;proy2;b",x3,y3,"-;proy3;g");
title("Grafica X-Y")
xlabel("Posicion X")
ylabel("Posicion Y")
text(40,5,"grafica")
grid on

t1 = (20*sin(pi/3)*2)/9.81;
t2 = (20*sin(pi/4)*2)/9.81;
t3 = (20*sin(pi/6)*2)/9.81;
X1 = 20*cos(pi/3)*t1
X2 = 20*cos(pi/4)*t2
X3 = 20*cos(pi/6)*t3