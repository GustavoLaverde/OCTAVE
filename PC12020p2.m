x = (-5*pi:0.05:pi);
f = 8*sin(7*x-4) + (x.*exp(x.^3));

plot(x,f,"r")
axis([-15,15,-10,200])
title("Grafica X-Y","fontsize", 20)
xlabel("Eje X","fontsize", 15,"fontweight", "bold")
ylabel("Eje Y","fontsize", 15,"fontweight", "bold")

ht = text (-12, 40, "8sin(7x-4) + xe", "fontsize", 20);
ht2 = text(-2.9,46,"x^3","fontsize", 20)
set (ht, "color", "blue","interpreter","tex");
set (ht2, "color", "blue","interpreter","tex");
grid on


