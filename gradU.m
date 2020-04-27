function gU = gradU(r)
    global mu
    x = r(1);
    y = r(2);
    z = r(3);
    r1 = norm([      mu+x,  y,  z ]);
    r2 = norm([ -(1-mu-x),  y,  z ]);
    
    gU = [ -x + (1-mu)*(mu+x)/r1^3 + mu*(x-1+mu)/r2^3   ;...
           -y + (1-mu)*y/r1^3      + mu*y/r2^3          ;...
                (1-mu)*z/r1^3      + mu*z/r2^3          ];
end