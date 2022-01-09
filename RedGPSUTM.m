clear;clc;
format longG;
# RED GPS UTM 2021

# V = AX - U #

PF = input('Puntos Fijos = ');
PL = input('Puntos Libres = ');
LB = input('Lineas Bases = ');

A = zeros(2*LB,2*PL);
V = zeros(2*LB);
X = zeros(2*PL);
U = zeros(2+LB);
P = zeros(2*LB);

A = input('Matriz coeficientes = ');
U = input('Matriz de terminos independientes = ');
P = input('Matriz de pesos = ');

P = diag(P);

X = inv(A'*P*A)*A'*P*U

printf('Matriz de Residuos:\n');
V = A*X-U


S0 = sqrt((V'*P*V)/(2*LB-2*PL))
S02= S0^2

printf('Matriz Cofactor:\n');
Qx = inv(A'*P*A)

printf('Matriz Varianza - covarianza:\n');
Sum_x = S02*Qx
for i=1:2*PL
  desvS(1,i) = sqrt(Sum_x(i,i));
endfor
  
desvS

X2 = (V'*P*V)/desvS(1,1)^2
