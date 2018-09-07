N = 256;

% Next position from (i,j) position
function [q] = next(i,j,Humans,N)
    r = rand;
    nbrs = neighborlist(i,j,N);
    q = [i j];
    for index=1:8
        if(index==1)
            pr(index) = prob(i,j,Humans,nbrs(index,1), nbrs(index,2),N);
            if(r<pr(index)) 
                q(1) = nbrs(index,1);
                q(2) = nbrs(index,2);
                break;
            end
        else
            pr(index) = pr(index-1) + prob(i,j,Humans,nbrs(index,1), nbrs(index,2),N);
            if(pr(index-1)<r<pr(index))
                q(1) = nbrs(index,1);
                q(2) = nbrs(index,2);
                break;
            end
        end
    end
end
            
%Probability of moving to (k,l)th position from (i,j)
function p = prob(i,j,Humans,k,l,N)
    nbrs = neighborlist(i,j,N);
    nbrpop = 0;
    for index=1:8
        nbrpop = nbrpop + Humans(nbrs(index,1),nbrs(index,2));
    end
    p = Humans(k,l)/nbrpop;
end

%Neighbor list for (i,j)th index
function [z] = neighborlist(i,j,N)
    k = 1;
    for r=-1:1
        for c=-1:1
            if(~((r==0)&&(c==0)))
                row = i+r;
                col = j+c;
                if(row == 0)
                    row = N;
                end
                if(row == N+1)
                    row = 1;
                end
                if(col == 0)
                    col = N;
                end
                if(col == N+1)
                    col = 1;
                end
                z(k,1) = row;
                z(k,2) = col;
                k = k+1;
            end
        end
    end
end

%Next Temperature of the cell
function y = nextT(i,j,T,Humans,N)
    s = 0;
    hum = 1;
    for r =-1:1
        for c =-1:1
            row = i+r;
            col = j+c;
            if(row == 0)
                row = N;
            end
            if(row == N+1)
                row = 1;
            end
            if(col == 0)
                col = N;
            end
            if(col == N+1)
                col = 1;
            end
            s = s + T(row,col)*Humans(row,col);
            hum = hum + Humans(row,col);
        end
    end
    
    y = s/hum;
end

%Next Pressure of the cell
function y = nextP(i,j,P,Humans,N)
    s = 0;
    hum = 1;
    for r =-1:1
        for c =-1:1
            row = i+r;
            col = j+c;
            if(row == 0)
                row = N;
            end
            if(row == N+1)
                row = 1;
            end    
            if(col == 0)
                col = N;
            end
            if(col == N+1)
                col = 1;
            end
            s = s + P(row,col)/Humans(row,col);
            hum = hum + 1/Humans(row,col);
        end
    end
    
    y = s/hum;
end

%Color of the cell 
function [x] = color(i,j,T,P)
    t = T(i,j);
    p = P(i,j);
    if((t>=0.20)&&(p>=0.12)&&(p<=0.20))
        x = [34 139 34] ./ 255;  %% Tropical
    elseif((t<=0.20)&&(t>=0)&&(p>=0.05)&&(p<=0.12))
        x = [128 128 0] ./ 255;  %% Temperate
    elseif((t>=0.15)&&(t<=0.20)&&(p>=0.20))
        x = [0 191 255] ./ 255;  %% Water bodies
    else
        x = [250 250 250] ./ 255;  %%Frigid
    end
end

a = floor(N/8);
b = floor(7*N/8);

%Left side Water bodies
for i=1:N
    for j=1:a
        T(i,j) = 0.17;
        P(i,j) = 0.20;
    end
end

%Right side Water bodies
for i =1 : N
    for j =b:N
        T(i,j) = 0.17;
        P(i,j) = 0.20;
    end
end

%Bottom water bodies
for i=floor(3*N/4) :N
    for j=1 : N
        T(i,j) = 0.17;
        P(i,j) = 0.20;
    end
end

%Frigid zone
for i=1: floor(3*N/16)
    for j=a : b
        T(i,j) = -0.10;
        P(i,j) = 0.025;
    end
end

%Temperate zone
for i=floor(3*N/16): floor(3*N/8)
    for j=a : b
        T(i,j) = 0.10;
        P(i,j) = 0.08;
    end
end

%Tropical zone
for i=floor(3*N/8):floor(3*N/4)
    for j= a : b
        T(i,j) = 0.20;
        P(i,j) = 0.15;
    end
end

Humans = ones(N);
count = 1;
times = 1000;
pos = [N/2 N/2]; %start position
while(count < times)
    travelledX(count) = pos(1);
    travelledY(count) = pos(2);
    for x = 1:N
        for y = 1:N
            c = color(x,y,T,P);
            trueColor(x,y,1) = c(1); %red component
            trueColor(x,y,2) = c(2); %green component
            trueColor(x,y,3) = c(3); %blue component
        end
    end
    image(trueColor);
    hold on;
    Humans(pos(1), pos(2)) = Humans(pos(1), pos(2)) + 1;
    plot(travelledX, travelledY, 'k-');
    pos = next(pos(1), pos(2), Humans,N);
    pause(1);
    hold off;
    for x = 1:N
      for y = 1:N
        Tn(x,y) = nextT(x,y,T,Humans,N);
        Pn(x,y) = nextP(x,y,P,Humans,N);
      end
    end
    T = Tn;
    P = Pn;
    count = count + 1;
end