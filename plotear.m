##---PLOTEO DE LAS GRAFICAS---##
subplot(2,2,1)
plot(t,u(:,1),"color","K")
title("Desplazamiento-tiempo","fontsize", 15)
grid on;
xlabel('tiempo'), ylabel('Desplazamiento');

subplot(2,2,2)
plot(t,u(:,2),"color","R")
title("Velocidad-tiempo","fontsize", 15)
grid on;
xlabel('tiempo'), ylabel('Velocidad');

subplot(2,2,3)
plot(t,u(:,3),"color","G")
title("Aceleracion-tiempo","fontsize", 15)
grid on;
xlabel('tiempo'), ylabel('Aceleracion');

subplot(2,2,4)
plot(u(:,1),fs,"color","B")
title("Fuerza-Desplazamiento","fontsize", 15)
grid on;
xlabel('Desplazamiento'), ylabel('Fs');