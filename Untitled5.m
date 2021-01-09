N = 4;
k = 2;
eps = 0.001;
D = 1.e1000;
%% Codebook Creation
codebook = cell({[45 50],[80 180],[45 117]});
out_src = [44 41 59 117 60 110 72 180 64 180 80 182];
out_src = transpose(out_src);
out_src_rhs = reshape(out_src,2,[])';
arr = zeros(1,3);
cb_mat = cell2mat(codebook);
cb_mat_rhs = reshape(cb_mat,2,[])';
%% Distance Measurement
for j=1:(length(out_src)/2)
    for i=1:length(codebook)
        diff(i) = (cb_mat_rhs(i,1) - out_src_rhs(j,1))^2+(cb_mat_rhs(i,2) - out_src_rhs(j,2))^2;
        diff_tot(j,i) = diff(i);
    end
    indexes(j)=find(diff_tot(j,:) == min(diff_tot(j,:))); 
end
%% Distortion Calculation

for m = 1:(length(out_src)/2)
    D(m) = min(diff_tot(m,:));
end
distortion = sum(D)/(length(out_src)/2);
%% Index Matching
cdb_idx = horzcat(out_src_rhs,indexes');
for h=1:length(cdb_idx)
    for hh=1:max(indexes)
        if(cdb_idx(h,3)==hh)
            updt(h,hh)=cdb_idx(hh:end-1);
        else
            updt= 0;
        end
    end
end
% for z=1:length(
%% Updating Codebook
while distortion < eps 
    
end

