function [d, fbest] = distAndFreq(NAP)
%Finner avstandsmatrisen, d, for minste avstander mellom koblinger og
%en vektor med frekvensfordelingen, fbest
% genererer N radionodelokasjoner med posisjon (x,y) innenfor et område
% (Xmax,Ymax)meter
% 1 client in a local net (for each Access point)
% No of Access points: NAP

d = zeros(NAP);


[APx, APy, Cx, Cy, Xmin, Xmax,Ymin,Ymax ]=Building200(NAP);

% find the shortest distance between nett i and j
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

% assignment random of frequencies
% antall tilfeldige frevenssett Mmax
Mmax=20000;
dbest=0;

for  m=1:Mmax
    f=randi(3,1,NAP);
    
    dm(1:3)=Xmax;
    
    for i=1:NAP
        for j=1:NAP
            if  j~=i
                if f(i)==f(j)
                    dm(f(i))=min(d(i,j), dm(f(i)));
                end %if
            end
        end
    end
    dmmin=min(dm);
    
    if dbest<dmmin
        
        fbest=f;
        dbest=dmmin;
    end
end %m

end %function