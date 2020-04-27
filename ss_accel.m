function as = ss_accel(r, bb, n)
    global mu
    r1 = [ mu+r(1),  r(2),  r(3) ];
    as = bb*(1-mu)*dot(r1,n)^2/dot(r1,r1)*n;
end