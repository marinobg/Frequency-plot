function frequency = findNextFreq(d, fbest, indexes, link, nFreq)
frqs = 1:nFreq;
%Finds the longest distance to a link that has been assigned with a
%frequency for the next link that are going to get a frequency assigned
relevantd = d(indexes, link);
while length(find(frqs)) > 1
    [mindist, mindex] = min(relevantd);
    relevantd(mindex) = []; %Removing shortest distances
    [row, ~] = find(d==mindist); %Finds link that are closest (and not checked)
    row(find(row==link)) = []; %Removing the value of the link we want to find a frequency for
    
    %If there are two links that are closest to the next link, then we
    %need to find which frequency that are second closest to the next link
    %and remove that frequency.
    if (length(row) == 2)
        mindex = find(min(relevantd));
        relevantd(mindex) = [];
        [mindist, ~] = min(relevantd);
        mindex = find(d(:,link) == mindist);
        freq = fbest(mindex);
        if frqs(fbest(row(1))) == freq
            row(2) = [];
        else
            row(1) = [];
        end
    end
    
    frqs(fbest(row)) = 0; % Removing frequencies that are closest
end
frequency = find(frqs);
end