function [r, i] = newraph(p, x0, c)
    q = polyder(p);
    r = x0;
    err = c+1;
    i = 0;
    while err > c
        s = r;
        r = r - polyval(p,r)/polyval(q,r);
        err = abs(r-s);
        i = i+1;
    end
end