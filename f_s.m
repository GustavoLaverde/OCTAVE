function [k,fss,cc,f_p,u_p] = f_s (uu,ddu,f_p,u_p,cc)
  
  if (ddu >= 0)
      if (cc == 2)
          f_p = -7.5;   u_p = uu-ddu;  cc = 0;
      endif
      fss = 10*uu+f_p-10*u_p;
      k=10;
      if (fss > 7.5)
          fss = 7.5;  k = 0;  cc = 1;
      endif
  else 
      if (cc == 1)
          f_p = 7.5;   u_p = uu-ddu;    cc = 0;
      endif
      fss = 10*uu+f_p-10*u_p;
      k = 10;
      if (fss<-7.5)
          fss = -7.5;   k=0;    cc = 2;
      endif
  endif
  
endfunction
