## Cuantas raices tiene la siguiente funcion ##
x = (-3*pi:0.02:3*pi);
f = (1/3).*x.*sin(x.^2);
f0 = x.*0
axis([-15,15,-4,4])
plot(x,f,x,f0,"r")

