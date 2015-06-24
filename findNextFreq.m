function frequency = findNextFreq(d, fbest, indexes, link)
maxdist = 0;
%Finds the longest distance to a link that has been assigned with a
%frequency for the next link that are going to get a frequency assigned
for i = indexes
    if d(i, link) > maxdist
        maxdist = d(i, link);
        frequency = fbest(i);
    end
end
end