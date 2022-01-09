function [d,B] = JACOBICLASICO (A, tol)
  d = A;
  V =eye(length(A));
  
  while norm(d-diag(diag(d)),'fro')>tol*norm(A,'fro')
    [maximos,filas] = max(abs(triu(d,1)));
    [maximo,q] = max(maximos);
    p = filas(q);
    ang = atan(2*d(p,q)/(d(q,q)-d(p,p)))/2;
    J = eye(length(d));
    J([p,q],[p,q]) = [cos(ang) sin(ang);-sin(ang) cos(ang)];
    d = J'*d*J;
    V = V*J;
    
  endwhile
  d = round(d);
  B = V;

endfunction
