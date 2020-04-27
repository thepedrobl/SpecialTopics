function x = getLagrangePoint(point,conv)
    global mu
    switch point
        case 'L1'
            df = @df1;
            x = 0.5;
        case 'L2'
            df = @df2;
            x = 1;
        case 'L3'
            df = @df3;
            x = -mu-0.1;
    end
    err = conv+1;
    while err > conv
        s = x;
        x = x - f(x,mu)/df(x,mu);
        err = abs(x-s);
    end
end

function r = f(xx,muu)
    r = xx - (1-muu)*(muu+xx)/abs(muu+xx)^3 + muu*(1-muu-xx)/abs(1-muu-xx)^3;
end

function r = df1(xx,muu)
    r = 1 + 2*(1-muu)/(muu+xx)^3 + 2*muu/(1-muu-xx)^3;
end

function r = df2(xx,muu)
    r = 1 + 2*(1-muu)/(muu+xx)^3 - 2*muu/(1-muu-xx)^3;
end

function r = df3(xx,muu)
    r = 1 - 2*(1-muu)/(muu+xx)^3 + 2*muu/(1-muu-xx)^3;
end
















