%bfrq_gen
% 
% 
% %actually, just iterate through m_bfrq_centers and use ind= m_frq==value to
% %find all the problematic values, and those values populate bad_ranges.


%BIG RIP, DID NOT SAVE bfrq_centers :-(

bad_ranges = []

for i=1:length(m_bfrq_centers)
    ind = find(m_frq == m_bfrq_centers(1,i));
    bad_ranges(i) = ind;
end

m_bfrq2 = []
count = 1
for i=1:length(bad_ranges)
    for j=bad_ranges(1,i)-5:bad_ranges(1,i)+5
        m_bfrq2(count) = j
        count = count + 1
    end
end
        
