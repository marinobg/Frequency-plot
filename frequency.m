function fbest = frequency(d, nFreq)
fbest = zeros(1, length(d));
dmin = ones(1 ,length(d))*inf;
for i = 1:length(d)
    for j = 1:length(d)
        if i ~= j && d(i,j) < dmin(i)
            dmin(i) = d(i,j);
        end
    end
end

%Finding the closest links and assign them with different channels
[~, index] = min(dmin);
fbest(index) = 1;
for i = index:length(dmin)
    if dmin(i) == dmin(index)
        index = i;
    end
end
fbest(index) = 2;

assignedFreq = 2; %Count number of assigned frequencies (Use this with nFreq to check if all available frequencies are used)

for freq = 3:length(fbest)
    indexes = find(fbest);
    %next_node = findSmallestDist(d, indexes)
    %TODO: create a function that find the node with the shortest longest
    %dist. to nodes that has a frequency assigned
end
end