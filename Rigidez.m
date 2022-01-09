clear,clc;

n = input('Numero de elementos de la viga: ');
g = input('Grados de libertad de la viga: ');
p = input('# de desplazamientos desconocidos en la viga: ');

Ke = zeros(4);
Kt = zeros(g);
printf('\n');

for i=1:n
  
  printf('ELEMENTO %i \n',i);
  L = input('Longitud: ');
  E = input('Modulo de elasticidad: ');
  I = input('Inercia: ');
  Ny = input('Ny: ');
  Nz = input('Nz: ');
  Fy = input('Fy: ');
  Fz = input('Fz: ');
  
  a = 12*E*I/L^3;
  b = 6*E*I/L^2;
  c = 4*E*I/L;
  d = 2*E*I/L;
  
  printf('MATRIZ DEL ELEMENTO %i \n',i)
  Ke = [ a  b -a  b
         b  c -b  d
        -a -b  a -b
         b  d -b  c ]
 
  Kt(Ny,Ny) = Kt(Ny,Ny) +a;
  Kt(Nz,Ny) = Kt(Nz,Ny) +b;
  Kt(Fy,Ny) = Kt(Fy,Ny) -a;
  Kt(Fz,Ny) = Kt(Fz,Ny) +b;
  
  Kt(Ny,Nz) = Kt(Ny,Nz) +b;
  Kt(Nz,Nz) = Kt(Nz,Nz) +c;
  Kt(Fy,Nz) = Kt(Fy,Nz) -b;
  Kt(Fz,Nz) = Kt(Fz,Nz) +d;
  
  Kt(Ny,Fy) = Kt(Ny,Fy) -a;
  Kt(Nz,Fy) = Kt(Nz,Fy) -b;
  Kt(Fy,Fy) = Kt(Fy,Fy) +a;
  Kt(Fz,Fy) = Kt(Fz,Fy) -b;
  
  Kt(Ny,Fz) = Kt(Ny,Fz) +b;
  Kt(Nz,Fz) = Kt(Nz,Fz) +d;
  Kt(Fy,Fz) = Kt(Fy,Fz) -b;
  Kt(Fz,Fz) = Kt(Fz,Fz) +c;

  
endfor
  printf('MATRIZ DEL GLOBAL \n')
  Kt
  
  k11= Kt(1:p,1:p)
  k21= Kt(p+1:g,1:p)
  
format longG; 
  
  
  