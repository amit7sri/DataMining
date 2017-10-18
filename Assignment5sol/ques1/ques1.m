load seeds.txt;

finalSSE = 0;
random = randperm(size(seeds,1));
K = 3;
[rows, cols] = size(seeds);


while K<=7
    temp = zeros(rows,1);
    for i = 1 : K
        initCentroid(i,:) = seeds(random(i),:);
    end
    
    while true
        distance = zeros(rows,K);
        SSE = 0;
        %distance = pdist2(initCentroid, seeds);
        for i = 1 : rows 
        	mindistance(1,:) = seeds(i,:);
            for j = 1 : K
                mindistance(j+1,:) = initCentroid(j,:);
            end
            Dist = pdist(mindistance);
            for j = 1 : K
                distance(i,j) = Dist(1,j);
            end
        end
        
        [minCentroid, clusterIdx] = min(distance, [], 2);
        if clusterIdx == temp & finalSSE>0
            break;
        else
            temp = clusterIdx;
            finalSSE = SSE;
        end
    
        for i=1:K
            idx = find(clusterIdx == i);
            if idx
                initCentroid(i,:) = mean(seeds(find(clusterIdx==i),:),1);
            end
        end
    
        for j = 1 : K
            for i = 1 : rows
                idx = find(clusterIdx(i,1) == j);
                if idx
                    finalSSE = finalSSE + sum(( seeds(i,:) - initCentroid(j,:)) .^ 2);
                end
            end
        end
    end
    
    Y = sprintf('K = %d SSE = %d ', K, finalSSE);
    disp(Y);
    %disp(finalSSE);
    K=K+2;
end

