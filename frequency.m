function fbest = frequency(d, nFreq, fbestOld)
if nFreq == length(d)
    fbest = randperm(nFreq); %Creates array with nFreq unique numbers
    return;
end

fbest = fbestOld;
maxd = 0;

%Find the pair that has the longest distance from each other that are not
%on the same frequency
for i = 1:length(d)
    for j = 1:length(d)
        if i >= j
            continue
        end
        if d(i,j) > maxd && fbestOld(i) ~= fbestOld(j)
            maxd = d(i,j);
            index = [i, j];
        end
    end
end

if (fbestOld(index(2)) == min(fbestOld) || fbestOld(index(2)) == ceil(length(fbestOld)/2)...
        || fbestOld(index(2)) == length(fbestOld)) %If the channels are one of the nonoverlappingceil
    fbest(fbest==fbestOld(index(1))) = fbestOld(index(2));
    
else
    fbest(fbest==fbestOld(index(2))) = fbestOld(index(1));
end

if length(unique(fbest)) == 3
    fbest(fbest==min(fbest)) = 1;
    fbest(fbest==max(fbest)) = 3;
    fbest((fbest ~= 1) & (fbest ~= 3)) = 2;
    
    fbest = fbest.*fbest + 2;
    fbest(fbest==3) = 1;
end

end