function fbest = frequency(d, nFreq)
fbest = randi(nFreq, 1, length(d));
dmin = ones(length(d))*inf;
for i = 1:length(d)
    for j = 1:length(d)
        if i ~= j && d(i,j) < dmin(i)
            dmin(i) = d(i,j);
        end
    end
end
end