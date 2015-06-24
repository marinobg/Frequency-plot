function frequency = findNextFreq(d, fbest, indexes, link, nFreq)
frqs = 1:nFreq;
%Finds the longest distance to a link that has been assigned with a
%frequency for the next link that are going to get a frequency assigned
relevantd = d(indexes, link);
while length(find(frqs)) > 1
    [mindist, mindex] = min(relevantd);
    [row, ~] = find(d==mindist); %Finds link that are closest (and not checked)
    row(find(row==link)) = []; %Removing the value of the link we want to find a frequency for
    frqs(fbest(row)) = 0; % Removing frequencies that are closest
    relevantd(mindex) = []; %Removing shortest distances
end
frequency = find(frqs);
end