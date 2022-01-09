LL = 70; # Limite loquido
IP = 37;  # Indice Plastico
F = 80;  # % de Finos
ILL = (F-35)*(0.2 + 0.005*(LL-40));
IIP = 0.01*(F-15)*(IP-10);
IG0 = ILL +IIP;
  
fprintf("Resultados\n");
fprintf("fraccion del limite liquido: %.3f\n",ILL);
fprintf("fraccion del indice plastico: %.3f\n",IIP);
fprintf("Indice de grupo sin redondear: %.3f\n",IG0);
 if IG0 < 0
    IG0 = 0;
  endif
fprintf("Indice de grupo Final: %.0f\n",IG0);