x = (-2*pi:0.01:2*pi);
f = sqrt(abs(sin(x.-3))) + (x.*exp(-x));

plot(x,f,"r")
axis([-5,7,-20,5])
title("Grafica X-Y","fontsize", 20)
xlabel("Eje X","fontsize", 15,"fontweight", "bold")
ylabel("Eje Y","fontsize", 15,"fontweight", "bold")
grid on
