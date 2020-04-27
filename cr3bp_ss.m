function dydt = cr3bp_ss(t,y,bb,aa,dd)
    global mu    
    rr1 = [     mu+y(1) ;    y(2);   y(3) ];
    rr2 = [ -(1-mu-y(1));    y(2);   y(3) ];
    r1 = norm(rr1);
    r2 = norm(rr2);
    
    n2 = [cos(aa); sin(aa)*sin(dd); sin(aa)*cos(dd)];
    r1_hat = rr1/r1;
    th_hat = cross([0;0;1], r1_hat)/norm(cross([0;0;1], r1_hat));
    hh_hat = cross(r1_hat, th_hat)/norm(cross(r1_hat, th_hat));
    sailToSyn = [r1_hat, th_hat, hh_hat];
    n = sailToSyn * n2;
    
    as = bb*(1-mu) * dot(r1_hat,n)^2 / r1^2 * n;
    
    dydt=[y(4)                                                               ;...
          y(5)                                                               ;...
          y(6)                                                               ;...
          y(1) - (1-mu)*(mu+y(1))/r1^3 + mu*(1-mu-y(1))/r2^3 + 2*y(5) + as(1);...
          y(2) - (1-mu)*    y(2) /r1^3 - mu*      y(2) /r2^3 - 2*y(4) + as(2);...
               - (1-mu)*    y(3) /r1^3 - mu*      y(3) /r2^3          + as(3)];
end