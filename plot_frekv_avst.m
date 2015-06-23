%Lager et plott som viser de minste avstander mellom koblinger
%a er avstandsmatrisen med korteste avstander mellom linker
%fbest er en vektor med frekvensen til de ulike linkene
clear all

NAP = 4;

[d, fbest] = distAndFreq(NAP);

dmin = ones(1, NAP) * inf; %Vector with shortest distance for connections

%Finding the shortest distance for connection i to j with equal frequency
for i = 1:length(d)
    for j = 1:length(d)
        if i ~= j && d(i,j) < dmin(i) && fbest(i) == fbest(j)
            dmin(i) = d(i,j);
        end
    end
end

[smallest, index] = min(dmin);

%Changing the elements of fbest to frequency channels
if fbest(index) == 1
    for i = 1:length(fbest)
        switch(fbest(i))
            case 1
                fbest(i) = 6;
            case 2
                fbest(i) = 1;
            case 3
                fbest(i) = 11;
        end
    end
    
elseif fbest(index) == 2
    for i = 1:length(fbest)
        switch(fbest(i))
            case 1
                fbest(i) = 1;
            case 2
                fbest(i) = 6;
            case 3
                fbest(i) = 11;
        end
    end
    
elseif fbest(index) == 3
    for i = 1:length(fbest)
        switch(fbest(i))
            case 1
                fbest(i) = 1;
            case 2
                fbest(i) = 11;
            case 3
                fbest(i) = 6;
        end
    end
end %if


hold on
xlabel('Distance')
ylabel('Frequencies')

for i = 1:length(d) %Rows
    for j = 1:length(d) %Columns
        if j > i
            %col = sprintf('%s%s', color(fbest, j), 'o');
            if d(i,j) == dmin(i)
                col = sprintf('%s%s', color(fbest, j), 'x');
                plot(d(i,j), fbest(i), col, 'linewidth', 15)
            end
            %plot(d(i,j), fbest(i), col)
            line([d(i,j), d(i,j)], get(gca, 'ylim'))
            axis([0 max(max(d))+1 0 11])
        end
    end
end

%Fargene indikerer hvilken frekvens koblingen som er nærmest den aktuelle
%koblingen har. Her vil blå være frekvens 1, rød 6 og grønn 11