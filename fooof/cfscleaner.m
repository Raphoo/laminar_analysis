%cfs cleaner
person = 1
recent_depth =1
row_number = 1
tempmatty = []

%so per person, ideally I would store their depth AS WELL AS their CF at
%that depth.

out = {}; %there are 15 people so 15 matrices in big cell. bon appetit
%each matrix has 1 col of depths and 1 col of cfs
for i=1:length(cfs) %so cfs(i,1) = peak freq, 
    %cfs(i,2) = gives value VAL, where dpth(1,VAL+1) = depth.
    x = (cfs(i,2)+1)
    if dpth(1,x)<recent_depth % if u've begun a new person
        out{person} = tempmatty(:,:)
        person = person + 1
        row_number = 1
        tempmatty = []
        recent_depth = 1
    else
        recent_depth = dpth(1,x)
        tempmatty(row_number,1) = recent_depth
        tempmatty(row_number,2) = cfs(i,1)
        row_number = row_number + 1
    end
    
end
    
