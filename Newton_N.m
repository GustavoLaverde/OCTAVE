function [k,fs,u,du,cc,f_p,u_p]= Newton_N(u,k_e,fs,dp_e,i,cc,tol,f_p,u_p,gamma,beta,c,d_t,m)
  u(i+1,1) = u(i,1);
  fs(i+1,1)=fs(i,1);
  d_r = dp_e;
  k_t = k_e;
  du = 0;
  ddu = 0;
  eps = tol+1;
  
  while eps>tol
    ddu = d_r/k_t;
    u(i+1,1)=u(i+1,1)+ddu;
    du = du+ddu;
    [k,fs1,cc,f_p,u_p] = f_s(u(i+1,1)-ddu,ddu,f_p,u_p,cc);
    [k,fs2,cc,f_p,u_p] = f_s(u(i+1,1),ddu,f_p,u_p,cc);
    d_f = fs2-fs1+(k_t-k)*ddu;
    d_r = d_r-d_f;
    eps = abs(ddu)/abs(du);  
  endwhile
  
  fs(i+1,1)=fs2;
endfunction