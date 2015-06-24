function next_node = findSmallestDist(d, indexes)
minval = inf;
for i = indexes
    for j = 1:length(d)
        if i ~= j && d(i,j) < minval && ~ismember(j, indexes)
            minval = d(i,j);
            next_node = j;
        end
    end
end
end