function firstAssignedPlot(d, fbest, dmin)

%Set duplicates in dmin to zero. This is done in order to prevent the plot
%from plotting a circle and a cross in the same place.
for i = 1:length(dmin)
    if find(dmin==dmin(i))
        for j = 2:length(find(dmin==dmin(i)))
            dmin(j) = 0;
        end
    end
end

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

%Plot distances that are not on the same frequency
for i = 1:length(d)
    for j = 1:length(d)
        if ismember(d(i,j), dmin)
            continue
        end
        col = sprintf('%s%s', color(fbest, i), 'o');
        plot(d(i,j), fbest(i), col, 'linewidth', 4)
    end
end
axis([0 max(max(d))+1 0 11])
end