function next_link = findSmallestDist(d, indexes)
minval = inf;
%Finds the link with shortest distance longest distance to other links with
%assigned frequency
for i = indexes
    for j = 1:length(d)
        if i ~= j && d(i,j) < minval && ~ismember(j, indexes)
            minval = d(i,j);
            next_link = j;
        end
    end
end
end