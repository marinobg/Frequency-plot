%Lager et plott som viser de minste avstander mellom koblinger
%d er avstandsmatrisen med korteste avstander mellom linker
%fbest er en vektor med frekvensen til de ulike linkene
clear all

%Input variables
NAP = 10;
nFreq = 3;

d = distance(NAP);
fbest = frequency(d, nFreq);

dmin = ones(1, NAP) * inf; %Vector with shortest distance for connections

%Finding the shortest distance for connection i to j with equal frequency
for i = 1:length(d)
    for j = 1:length(d)
        if i ~= j && d(i,j) < dmin(i) && fbest(i) == fbest(j)
            dmin(i) = d(i,j);
        end
    end
end

[~, index] = min(dmin);

%Changing the elements of fbest to frequency channels
if nFreq == 3
    fbest = (fbest.*fbest) + 2;
    fbest(fbest==3) = 1;
end

%Changing the channels so that the link with the shortest distance to
%another link with the same frequency get channel 6. All other links on
%that channel will also be changed to channel 6 and those links that had
%channel 6 will get the same channel that the link with the shortest
%distance had.
if fbest(index) ~= 6
    changeVar = fbest(index); %Finding the channel with shortest distance
    fbestCopy = fbest; %Creates a copy
    fbestCopy(fbestCopy==changeVar) = 6; %Changes all elements in fbestCopy that had value changeVar to 6
    fbestCopy(fbest==6) = changeVar; %Changes those elements in fbestCopy that is 6 in fbestCopy and also 6 in fbest
    fbest = fbestCopy;
end

firstAssignedPlot(d, fbest, dmin);


%Plot shortest distances on same frequency as a cross and the other
%distances as a vertical line
figure
hold on
xlabel('Distance')
ylabel('Frequencies')

%Plot shortest distances at same frequencies
for i = 1:length(dmin)
    if dmin(i) ~= 0
        col = sprintf('%s%s', color(fbest, i), 'x');
        plot(dmin(i), fbest(i), col, 'linewidth', 15)
    end
end

for i = 1:length(d) %Rows
    for j = 1:length(d) %Columns
        if j > i
            line([d(i,j), d(i,j)], [0 11])
            axis([0 max(max(d))+1 0 11])
        end
    end
end

%Fargene indikerer hvilken frekvens koblingen som er nærmest den aktuelle
%koblingen har. Her vil blå være frekvens 1, rød 6 og grønn 11