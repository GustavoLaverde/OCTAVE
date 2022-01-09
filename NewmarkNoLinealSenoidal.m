function [u,p,t,fs] = NewmarkNoLinealSenoidal(gamma,beta,m,c,k,p0,d_t,tol)
  
  ##---INICIALIZAMOS---##  
  tf = 50;                       # Duracion de la simulacion (s) 
  t = 0:d_t:tf;                  # Vector de tiempo
  w=10;   p = p0*sin(w*t);       # Carga Armonica de excitacion TIPO SENOIDAL
  n = length(p);  fs = zeros(n,1);   u = zeros(n,3);
  u(1,3) = (p(1)-c*u(1,2)-k*u(1,1))/m; 
  fs(1,1) = k*u(1,1);
  cc = 0; f_p =7.5; u_p =0.75;
  a1 = gamma*c/(beta*d_t)+m/(beta*d_t^2);
  a2 = 1/(beta*d_t)*m+gamma*c/beta;   
  a3 = 1/(2*beta)*m+d_t*c*(gamma/(2*beta)-1);
  
  for i=2:n-1   
    dp_e = -m*(p(i+1)-p(i))+a2*u(i,2)+a3*u(i,3);
    k_e = k + a1;
    [k,fs,u,du,cc,f_p,u_p]=Newton_N(u,k_e,fs,dp_e,i,cc,tol,f_p,u_p,gamma,beta,c,d_t,m);
    
  ##---Velocidades y aceleraciones---##
    dv = gamma/(beta*d_t)*du-gamma/beta*u(i,2)+d_t*(1-0.5*gamma/beta)*u(i,3);
    u(i+1,2) = u(i,2)+dv;
    dacel = 1/(beta*d_t^2)*du-1/(beta*d_t)*u(i,2)-0.5/beta*u(i,3);
    u(i+1,3)=u(i,3)+dacel;   
  endfor  
endfunction #[u,p,t,fs] = NewmarkNoLinealSenoidal (0.5,0.25,0.5,0.2,10,80,0.01,0.001);