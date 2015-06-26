function fbest = frequency(d, nFreq)
fbest = zeros(1, length(d));
availableFreq = 1:nFreq;
dmin = ones(1 ,length(d))*inf;
for i = 1:length(d)
    for j = 1:length(d)
        if i ~= j && d(i,j) < dmin(i)
            dmin(i) = d(i,j);
        end
    end
end

%Finding the closest links and assign them with different channels
[~, index1] = min(dmin);
fbest(index1) = randi(nFreq);
for i = index1:length(dmin)
    if dmin(i) == dmin(index1)
        index2 = i;
    end
end
fbest(index2) = randi(nFreq);
while fbest(index1) == fbest(index2)
    fbest(index2) = randi(nFreq);
end

assignedFreq = 2; %Count number of assigned frequencies (Use this with nFreq to check if all available frequencies are used)

for freq = 3:length(fbest)
    indexes = find(fbest);
    next_link = findSmallestDist(d, indexes); %Finds next link to be assigned to a frequency
    if assignedFreq < nFreq %Check if all available frequencies have been assigned
        assignedFreq = assignedFreq + 1;
        freqToChoose = setdiff(availableFreq, fbest);
        fbest(next_link) = freqToChoose(randi(length(freqToChoose)));
        continue
    end
    
    fbest(next_link) = findNextFreq(d, fbest, indexes, next_link, nFreq); % Assign frequency to the next link
    disp(fbest)
end
end