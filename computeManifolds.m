function r = computeManifolds(Lp, tspan, epsi)
    A = getJacobian(Lp);
    [V, D] = eig(A);
    D = diag(D)
    V = [V(1:2,:); zeros(1,4); V(3:4,:); zeros(1,4)]
    
    st_ev = V(:,real(D)<0&imag(D)==0)
    un_ev = V(:,real(D)>0&imag(D)==0)
    ev = [st_ev, -st_ev, un_ev, -un_ev]
    
    X0 = [Lp; 0; 0; 0; 0; 0];
    opts = odeset('RelTol',1e-12,'AbsTol',1e-12);
    tspan = -tspan;
    
    for i = 1:4
        Xi = X0 + epsi * ev(:,i);
        tspan = tspan*(-1)^(i==3);
        [r(i).t, r(i).X] = ode45(@cr3bp, tspan, Xi, opts);
        r(i).x = r(i).X(:,1);
        r(i).y = r(i).X(:,2);
        r(i).z = r(i).X(:,3);
    end
end