function A = getJacobian(x)
    global mu
    r1 = abs(mu+x);
    r2 = abs(1-mu-x);
    K = (1-mu)/r1^3 + mu/r2^3;
    Uxx = -1-2*K;
    Uyy = -1+K;
    A = [   0,    0,   1,  0;
            0,    0,   0,  1;
         -Uxx,    0,   0,  2;
            0, -Uyy,  -2,  0];
end