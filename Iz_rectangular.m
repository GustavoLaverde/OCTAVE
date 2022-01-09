fprintf('Cargas: puntual, rectangular, cargaLinealI, cargaLinealF, \ncircularEJE, circularNOEJE, cajaInfinita\n');
val = false;
while val==false
  carga = input('Tipo de carga: ','s');
  
    switch carga
      case('terminar')
          val = true;  
      case('rectangular')
      # m: (base)/(z)
      # z: profundidad
      # n: (altura)/(z)
          m = input('Valor de m: ');
          n = input('Valor de n: ');
          if(1+m^2+n^2-m^2*n^2<=0)
              p1 = 1/(4*pi);
              p2 = (2*m*n*sqrt(m^2+n^2+1))/(1+m^2+n^2+m^2*n^2);
              p3 = (m^2+n^2+2)/(m^2+n^2+1);
              p4 = atan((2*m*n*sqrt(m^2+n^2+1))/(1+pi+m^2+n^2-m^2*n^2));
          else
              p1 = 1/(4*pi);
              p2 = (2*m*n*sqrt(m^2+n^2+1))/(1+m^2+n^2+m^2*n^2);
              p3 = (m^2+n^2+2)/(m^2+n^2+1);
              p4 = atan((2*m*n*sqrt(m^2+n^2+1))/(1+m^2+n^2-m^2*n^2));
          endif
          I = p1*(p2*p3+p4);
          I
          im = imread('rectangular.jpg');
          imshow(im);     
      case('puntual')
      # r: distancia desde la carga puntual hasta la proyeccion
      #    en la superficie del punto en cuestion.
      # z: profundidad del punto en cuestion
          r = input('Valor de r/z: ');
          p1 = 1/((r^2+1)^(5/2));
          p2 = 3/(2*pi);
          I = p1*p2;
          I  
      case('cargaLinealI')
      # x: distancia perpendicular a la carga lineal
      # z: profundidad del punto en cuestion
          r = input('Valor de x/z: ');
          p1 = 1/((r^2+1)^(2));
          p2 = 2/pi;
          I = p1*p2;
          I  
      case('cargaLinealF')
      # m: x(dist. perp. al punto)/z(profundidad)
      # n: y(longitud de la carga)/z(profundidad)
          m = input('Valor de m: ');
          n = input('Valor de n: ');
          p1 = 1/(2*pi);
          p2 = n/((m^2+1)*((m^2+n^2+1)^(1/2)));
          p3 = 1/(m^2+n^2+1);
          p4 = 2/(m^2+1);
          I = p1*p2*(p3+p4);
          I  
          im = imread('cargaLinealF.jpg');
          imshow(im);
      case('circularEJE')
      # R: radio de la carga circular
      # z: profundidad del punto en cuestion
          r = input('Valor de R/z: ');
          p1 = 1/((r^2+1)^(3/2));
          p2 = 1;
          I = (p2-p1);
          I
          im = imread('circularEJE.jpg');
          imshow(im);
       case('circularNOEJE')
      # s: Distancia horizontal desde el eje central del circulo
      # b: radio del circulo
      # z: Profundidad
          im = imread('CircularNOEJE.jpg');
          imshow(im);
       case('cajaInfinita')
      # z: Profundidad
      # x: Distancia horizontal desde el eje central de la cajaInfinita
      # b: mitad de la medida del ancho de la caja
          x = input('Valor de x: ');
          z = input('Valor de z: ');
          b = input('Valor de b: ');
          p1 = 1/pi;
          p2 = atan(z/(x-b));
          p3 = atan(z/(x+b));
          p4 = 2*b*z*(x^2-z^2-b^2);
          p5 = (x^2+z^2-b^2)^2+((2*b)^2*z^2);
          I = p1*(p2-p3-(p4/p5));
          I
          im = imread('cajaInfinita.jpg');
          imshow(im);
          
    otherwise
        fprintf('Opcion no valida, intenta de nuevo\n');      
    endswitch
    
endwhile