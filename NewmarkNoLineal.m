function [u,p,t,fs] = NewmarkNoLineal (gamma,beta,m,c,k,registro,escala,d_t,tol)
  
  [datos] = lector(registro,escala,d_t);      ##---LECTURA DE DATOS DEL SISMO---###
  
  ##---INICIALIZAMOS---##
  p = datos(:,2);   n = length(p);
  fs = zeros(n,1);  u = zeros(n,3);
  u(1,3) = p(1);
  fs(1,1) = k*u(1,1);
  cc = 0;   f_p=7.5;   u_p=0.75;
  t = datos(:,1);
  a1 = gamma*c/(beta*d_t)+m/(beta*d_t^2);
  a2 = 1/(beta*d_t)*m+gamma*c/beta;
  a3 = 1/(2*beta)*m+d_t*c*(gamma/(2*beta)-1);
  
  for i=2:n-1
    dp_e = -m*(p(i+1)-p(i))+a2*u(i,2)+a3*u(i,3);
    k_e = k + a1;
    [k,fs,u,du,cc,f_p,u_p]=Newton_N(u,k_e,fs,dp_e,i,cc,tol,f_p,u_p,gamma,beta,c,d_t,m);
    dv = gamma/(beta*d_t)*du-gamma/beta*u(i,2)+d_t*(1-0.5*gamma/beta)*u(i,3);
    u(i+1,2) = u(i,2)+dv;
    dacel = 1/(beta*d_t^2)*du-1/(beta*d_t)*u(i,2)-0.5/beta*u(i,3);
    u(i+1,3)=u(i,3)+dacel;
  endfor  
endfunction #[u,p,t,fs] = NewmarkNoLineal (0.5,0.25,0.5,0.2,10,'Sechura.txt',5000,0.01,0.001);