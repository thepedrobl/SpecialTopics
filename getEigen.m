function r = getEigen(x)
    global mu
    r1 = abs(mu+x);
    r2 = abs(1-mu-x);
    K = (1-mu)/r1^3 + mu/r2^3;
    aa = 1 - K/2;
    bb2 = (2*K+1)*(K-1);
    LL1 = -aa + sqrt(aa^2 + bb2);
    LL2 = -aa - sqrt(aa^2 + bb2);
    r = [sqrt(LL1) -sqrt(LL1) sqrt(LL2) -sqrt(LL2)]';
end