function q = getSailPerf(r)
    global mu
    r1 = [ mu+r(1),  r(2),  r(3) ];
    
    gU = gradU(r);
    q.dir = gU/norm(gU);
    
    q.bb = dot(r1,r1) * dot(gU,q.dir) / (1-mu) / (dot(q.dir, r1));
end