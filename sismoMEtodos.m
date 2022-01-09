# Solucion METODO NEWMARK
clear;
clc;

# DATOS INIcIALES

#Metodo de la aceleracion promedio constante
gamma =0.5; 
beta = 0.25; 

m = 10000;         # kg
k = 250000;        # N/m
ze = 0.02;         # amortiguamiento 0.05

wn = (k/m)^0.5;    # Frec. natural (rad/s)
c = 2*ze*wn*m;     # Razon de amortiguamiento

u0 = 0;            # desplazamiento inicial
v0 = 0;            # velocidad inicial

  # P(t)=P0sen(wt)
w = 8;             # Frecuencia de exitacion (rad/s)4
p0 = 50000;         # Amplitud de la carga armonica (Newton)
  # Vector de tiempo
h = 0.01;          # Paso de integracion (s)
tf = 50;           # Duracion de la simulacion (s) 30

[datos] = lector('Sechura.txt', 1,0.01);
t = datos(:,1);       # Vector de tiempo
p = datos(:,2)*m*(-1);   # carga armonica de excitacion TIPO SENOIDAL

##---INTEGRAcION---##

# calculos iniciales
u(1) = u0;
v(1) = v0;
a(1) = (p(1)-c*v(1)-k*u(1))/m;

np = length(t);

a1 = m/(beta*h^2)+(gamma*c)/(beta*h);
a2 = m/(beta*h)+(gamma/beta-1)*c;
a3 = (1/(2*beta)-1)*m+h*(gamma/(2*beta)-1)*c;
ks = k + a1;
Ep(1) = 0;
Ec(1) = 0; 
for i = 1:np-1
   ps(1+i) = p(i+1)+a1*u(i)+a2*v(i)+a3*a(i);
   u(i+1) = ps(i+1)/ks;
   Ep(i+1) = 1/2*m*wn^2*u(i+1)^2;
   v(i+1) = (gamma/(beta*h))*(u(i+1)-u(i))+(1-gamma/beta)*v(i)+h*(1-gamma/(2*beta))*a(i);
   Ec(i+1) = 1/2*m*v(i+1)^2;
   a(i+1) = (1/(beta*h^2))*(u(i+1)-u(i))-(1/(beta*h))*v(i)-(1/(2*beta)-1)*a(i);
   E(i+1) = Ec(i+1)+Ep(i+1);
endfor

##---GRAFIcANDO LOS RESULTADOS---##
subplot(2,3,1)
plot(t,100*u);
grid on;
xlabel('t[s]'), ylabel('u[cm]');

subplot(2,3,2)
plot(t,100*v);
grid on;
xlabel('t[s]'), ylabel('v[cm/s]');

subplot(2,3,3)
plot(t,100*a);
grid on;
xlabel('t[s]'), ylabel('a[cm/s2]');

subplot(2,3,4)
plot(t,E);
grid on;
xlabel('t[s]'), ylabel('E[J]');

subplot(2,3,5)
plot(u*100,p);
grid on;
xlabel('u[cm]'), ylabel('Fs[N]');
