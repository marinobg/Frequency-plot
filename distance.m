function d = distance(NAP)
%Finner avstandsmatrisen, d, for minste avstander mellom koblinger og
%en vektor med frekvensfordelingen, fbest
% genererer N radionodelokasjoner med posisjon (x,y) innenfor et område
% (Xmax,Ymax)meter
% 1 client in a local net (for each Access point)
% No of Access points: NAP

d = zeros(NAP);


[APx, APy, Cx, Cy, Xmin, Xmax,Ymin,Ymax ]=Building200(NAP); %Get the position of every node

% find the shortest distance between link i and j
for i=1:NAP
    for j=1:NAP
        a1=sqrt((APx(i)-Cx(j))^2+(APy(i)-Cy(j))^2);
        
        a2=sqrt((APx(j)-Cx(i))^2+(APy(j)-Cy(i))^2);
        
        a3=sqrt((APx(i)-APx(j))^2+(APy(i)-APy(j))^2);
        
        a4=sqrt((Cx(i)-Cx(j))^2+(Cy(i)-Cy(j))^2);
        
        array=[a1;a2;a3;a4];
        a=min(array);
        d(i,j)=a;
    end
end
end %function