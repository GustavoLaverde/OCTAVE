gamma =0.5;
beta = 0.25;
m = 0.0008122;     #ton-s2/mm
k = 1.18191546;    #ton/mm
w = 4;    #rad/s
e = 0.05;          #amortiguamiento
wD = 38.0994026;   #rad/s
var_t = 0.02; #s
g = 9810;          #mm/s2
x0 = 0;            #mm
v0 = 0;            #mm/s
C = 0.00309831;    #ton-s/mm

T = 0.16470931;    #s

#Calculos iniciales
a1 = (m/(beta*(var_t^2)))+((gamma*C)/(beta*var_t));
a2 = (m/(beta*var_t))+((gamma/beta)-1)*C;
a3 = ((1/(2*beta)-1)*m)+var_t*((gamma/(2*beta))-1)*C;
k2 = k + a1