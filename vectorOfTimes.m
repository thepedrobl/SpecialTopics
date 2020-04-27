function d = vectorOfTimes(tu, ts)
    [A,B] = meshgrid(ts,tu);
    c = cat(2,A',B');
    d = reshape(c,[],2);
    d = d(:,[2 1]);
end