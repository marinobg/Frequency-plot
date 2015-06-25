%Checking what channel an AP is assigned to and give it a corresponding
%color

function col = color(fbest, j)
switch(fbest(j))
    case 1
        col = 'm';
    case 6
        col = 'r';
    case 11
        col = 'g';
    otherwise
        col = 'b';
end
end