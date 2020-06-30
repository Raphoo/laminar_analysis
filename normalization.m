
% from 1/f fitting data exported from fooof,
% normalizes exponents & offsets, and finds R^2 avg per person
% 
% Args:
%     dpth: 1xtotal_count matrix of channel depth
%     h_exps: 1xtotal_count matrix of fooof-returned exponents from fitting 1/f
%     offset_unlogged: 1xtotal_count matrix of 10^[foof-returned offsets from fitting 1/f]
%     r2: 1xtotal_count matrix of R^2 of fooof fitting
%     
% Returns:
%     expsnormalized = 1xtotal_count matrix of exponents normalized by subject
%     offsetnormalized = 1xtotal_count matrix of offsets normalized by subject
%     r2avg_byperson = 1xsub_count matrix of R^2 avg per person
%     
    
start_ind = 1
recent_depth = 1
col_number = 1
row_number = 1

expsnormalized = []
biggest_exp = h_exps(1,1)

r2avg_byperson = []

offsetnormalized = []
offset_unlogged = []
for k = 1:length(h_offset)
    offset_unlogged(1,k) = 10^(h_offset(1,k))
end
biggest_offset = offset_unlogged(1,1)


for i = 2:length(dpth)
   
    %if i has moved onto a new subject, use the biggest_exp thus far to divide start_ind -> now_ind and add to matrix.
    if dpth(1,i)<recent_depth
        %use biggest_exp and divide.
        for j = start_ind:(i-1)
            expsnormalized(1,j) = h_exps(1,j)/biggest_exp
            offsetnormalized(1,j) = offset_unlogged(1,j)/biggest_offset
            
            r2avg_byperson(row_number,col_number) = h_r2(1,j)
            row_number = row_number+1
        end
        col_number = col_number + 1
        row_number = 1
        
        biggest_exp = h_exps(1,i)
        biggest_offset = offset_unlogged(1,i)
        
        start_ind = i
        recent_depth = 1
    else
        if biggest_exp<h_exps(1,i)
            %if current exp is bigger in sub than biggest thus far in sub, update to reflect.
            biggest_exp = h_exps(1,i) 
        end
        if biggest_offset<offset_unlogged(1,i)
            biggest_offset = offset_unlogged(1,i)
        end
        recent_depth = dpth(1,i)
    end 
end


for j = start_ind:length(dpth)
   expsnormalized(1,j) = h_exps(1,j)/biggest_exp
   offsetnormalized(1,j) = offset_unlogged(1,j)/biggest_offset
   r2avg_byperson(row_number,col_number) = h_r2(1,j)
end
        