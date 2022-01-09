%graphics_toolkit("gnuplot")
clear;
clc;
clf;
%%Opcion de ploteado. cortante = 1; Momento F.=2, Axial=3;
opcion = 2;
escala = 0.005;

fid = fopen("resultados.out");
c = textscan(fid,"%s");
data = c{1};

% se determina el número de datos guardados en data
temp = size(data);
noDatos = temp(1); 

#Empieza el bucle de reconocimiento de datos
for i=1:noDatos
  texto = data{i}; #porque data es un cell
  if strcmp(texto,"NODE") == 1
    i = i+3;
    texto = data{i};
    noNudos = str2num(texto);
   i = i+2;
   #loop para leer los datos de nudos
   #Se guarda en Nudos lo siguiente:
    #nudo/coordX/coordY/dispX/dispY/rot/reacX/reacY/reacZ   
 #  nudos = zeros( noNudos,9);
     for j = 1:noNudos
        i = i+2;
        nudos(j,1) = str2num(data{i});
        i = i+3;
        nudos(j,2) = str2num(data{i});
        i = i+1;
        nudos(j,3) = str2num(data{i});
        i = i+2;
        nudos(j,4) = str2num(data{i});
       i = i+1;
        nudos(j,5) = str2num(data{i});
        i = i+1;
        nudos(j,6) = str2num(data{i});
        i = i+7;
        nudos(j,7) = str2num(data{i});
        i = i+1;
        nudos(j,8) = str2num(data{i});
        i = i+1;
        nudos(j,9) = str2num(data{i});
        i = i+5;
      endfor
   #loop para leer los datos de elementos
   #En elementos se guarda la info en el siguiente detalle
   #NumElemento/deNudo/aNudo/P1/V1/M1/P2/V2/M2
  elseif strcmp(texto,"ELEMENT") == 1
    i = i+3;
    texto = data{i};
    noElementos = str2num(texto);
    i = i+2;
    for j = 1:noElementos
      i = i+2;
      elementos(j,1) = str2num(data{i});
      i = i+3;
      elementos(j,2) = str2num(data{i});
      i = i+1;
      elementos(j,3) = str2num(data{i});
      i = i+17;
      elementos(j,4) = -1*str2num(data{i});
      i = i+1;
      elementos(j,5) = str2num(data{i});
      i = i+1;
      elementos(j,6) = -1*str2num(data{i});
      i = i+7;
      elementos(j,7) = str2num(data{i});
      i = i+1;
      elementos(j,8) = -1*str2num(data{i});
      i = i+1;
      elementos(j,9) = str2num(data{i});
    endfor
  #elseif strcmp(texto,"Elemental") == 1
    #existe un error en el output. se debe separar la cantidad
    #de elementos cargados del tag "Beam2dUniformLoad"
    #i = i+3;
    #temp2 = data{i};
    #temp = size(temp2); #Se obtiene el tamaño del string_fill_char
    #tamanoString = temp(2);
    #noCargasDist = str2num(resize(temp2,[1 (tamanoString-17)])); #se trunca el string_fill_char
    
  endif
    
endfor


## graficación del pórtico
  for i = 1:noElementos
    nudoIni = elementos(i,2);
    nudoFin = elementos(i,3);
    xgraf(1,i) = nudos(nudoIni,2);
    xgraf(2,i) = nudos(nudoFin,2);
    ygraf(1,i) = nudos(nudoIni,3);
    ygraf(2,i) = nudos(nudoFin,3);
    L(i) = ((xgraf(2,i)-xgraf(1,i))^2+(ygraf(2,i)-ygraf(1,i))^2)^0.5;
    if (ygraf(2,i)-ygraf(1,i))<0
      angulo(i) = -acosd((xgraf(2,i)-xgraf(1,i))/L(i));
    else 
      angulo(i) = acosd((xgraf(2,i)-xgraf(1,i))/L(i));
    endif  
    endfor
  
  plot(xgraf,ygraf, 'color','K','linewidth',3);
  hold on

if opcion == 1  
## Diagrama de cortantes
  for i = 1:noElementos
    vIni = elementos(i,5)*escala;
    vFin = elementos(i,8)*escala;
    vIniRotadoX = 0*cosd(angulo(i))-vIni*sind(angulo(i));
    vIniRotadoY = 0*sind(angulo(i))+vIni*cosd(angulo(i));
    vFinRotadoX = L(i)*cosd(angulo(i))-vFin*sind(angulo(i));
    vFinRotadoY = L(i)*sind(angulo(i))+vFin*cosd(angulo(i));
    nudoIni= elementos(i,2);
    nudoFin = elementos(i,3);
    coordNudoIniX = nudos(nudoIni,2);
    coordNudoIniY = nudos(nudoIni,3);
    coordNudoFinX = nudos(nudoFin,2);
    coordNudoFinY = nudos(nudoFin,3);
    vXPlot(1,i) = coordNudoIniX;
    vXPlot(2,i) = coordNudoIniX+vIniRotadoX;
    vXPlot(3,i) = coordNudoIniX+vFinRotadoX;
    vXPlot(4,i) = coordNudoFinX;

    vYPlot(1,i) = coordNudoIniY;
    vYPlot(2,i) = coordNudoIniY+vIniRotadoY;
    vYPlot(3,i) = coordNudoIniY+vFinRotadoY;
    vYPlot(4,i) = coordNudoFinY;
  endfor
  
  plot(vXPlot,vYPlot,"linewidth",1,"color","r");
  for i = 1:noElementos
    text(vXPlot(2,i),vYPlot(2,i),num2str(elementos(i,5)),"rotation",angulo(i)) #etiquetas valores
    text(vXPlot(3,i),vYPlot(3,i),num2str(elementos(i,8)),"rotation",angulo(i)) #etiquetas valores
    endfor

  
elseif opcion == 2
## Diagrama de momentos

  for i = 1:noElementos
    vIni = elementos(i,5);
    vFin = elementos(i,8);
    mIni = elementos(i,6);
    mFin = elementos(i,9);
    % Se calculará la carga a partir de los cortantes
    q(i) = (vFin-vIni)/L(i);
    %Se calculan las constantes de integración de la ec de M
    c2 = mIni;
    c1 = (mFin-q(i)*L(i)^2/2-mIni)/L(i);
    %Se calculan 8 puntos de M y 8 puntos de L en locales
    xLocal = linspace(0,1,9)*L(i);
    yLocalBarra = zeros(1,9);
    %se calculan los momentos para los 9 puntos -8 divisiones
    %la ecuacion de momento es M = q*x^2/2+C1*x+C2
    for j=1:9
      mLocal(j) = q(i)*xLocal(j)^2/2+c1*xLocal(j)+c2;
      mLocalEsc(j) = mLocal(j)*escala*-1;
    endfor
    %se rotan las coordenadas X de los 9 puntos y se transportan
    %y los 9 puntos de división sobre la barra
    for j=1:9
    xRotado(j) = xLocal(j)*cosd(angulo(i))-mLocalEsc(j)*sind(angulo(i));
    mRotado(j) = xLocal(j)*sind(angulo(i))+mLocalEsc(j)*cosd(angulo(i));
    xBarraRot(j) = xLocal(j)*cosd(angulo(i))-yLocalBarra(j)*sind(angulo(i));
    yBarraRot(j) = xLocal(j)*sind(angulo(i))+yLocalBarra(j)*cosd(angulo(i));
     
    endfor
    nudoIni= elementos(i,2);
    coordNudoIniX = nudos(nudoIni,2);
    coordNudoIniY = nudos(nudoIni,3);
    for j=1:9
    xRotTras(j)=xRotado(j)+coordNudoIniX;
    mRotTras(j)=mRotado(j)+coordNudoIniY;
    xRTBarra(j)=xBarraRot(j)+coordNudoIniX;
    yRTBarra(j)=yBarraRot(j)+coordNudoIniY;
    
    endfor
    %Arreglo en columnas de todos los puntos listos para ploteo
    mXPlot(:,i) = xRotTras';
    mYPlot(:,i) = mRotTras';
    barrotesX(:,:,i) = [xRotTras;xRTBarra];
    barrotesY(:,:,i) = [mRotTras;yRTBarra];
   %Cálculo de momentos máximos en centros de tramos
    if vIni*vFin<0
      xMax(i) =vIni*L(i)/(vIni-vFin);
      mMax(i) =q(i)*xMax(i)^2/2+c1*xMax(i)+c2;
      mMaxEsc(i) = -mMax(i)*escala;
      %rotando
      xMaxRot(i) = xMax(i)*cosd(angulo(i))-mMaxEsc(i)*sind(angulo(i));
      mMaxRot(i) = xMax(i)*sind(angulo(i))+mMaxEsc(i)*cosd(angulo(i));
      xMaxRotTras(i) = xMaxRot(i)+coordNudoIniX;
      mMaxRotTras(i) = mMaxRot(i)+coordNudoIniY;
      
    else
      xMax(i) = 0;
      mMax(i) = 0;
    endif 
   
  endfor
  %ploteo de lineas de momento
  plot(mXPlot,mYPlot,"linewidth",1,"color","b");
  for k = 1:noElementos
    plot(barrotesX(:,:,k),barrotesY(:,:,k),"color","b");
  endfor
  %ploteo de valores
  
  for i = 1:noElementos
    text(mXPlot(1,i),mYPlot(1,i),num2str(elementos(i,6)),'rotation',angulo(i));
    text(mXPlot(9,i),mYPlot(9,i),num2str(elementos(i,9)),'rotation'...
    ,angulo(i),'horizontalalignment','right');
    if xMax(i)~=0
      text(xMaxRotTras(i),mMaxRotTras(i),num2str(mMax(i)),'rotation'...
      ,angulo(i),'horizontalalignment','center','verticalalignment','top');
    endif
  endfor

elseif opcion == 3
  
endif;


 
 
