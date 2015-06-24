function fbest = frequency(d, nFreq)
fbest = nan(1, length(d));
dmin = ones(1 ,length(d))*inf;
for i = 1:length(d)
    for j = 1:length(d)
        if i ~= j && d(i,j) < dmin(i)
            dmin(i) = d(i,j);
        end
    end
end
[minval, index] = min(dmin);
fbest(index) = 1;
for i = index:length(dmin)
    if dmin(i) == dmin(index)
        index = i;
    end
end
fbest(index) = 2;
end