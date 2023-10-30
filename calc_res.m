% st1='Groundtruth_skeleton_path';
% st2='Skeleton_results_path';

st1='E:\College\IP\HED Metric Evaluations\Results-for-IP-Models\GT for HED and SRN';
st2='E:\College\IP\HED Metric Evaluations\Results-for-IP-Models\SRn Predictions All 18K';

% st1='E:\College\IP\HED Metric Evaluations\Results-for-IP-Models\Results_Co_Skel_ep_70_lr_1e7\gt';
% st2='E:\College\IP\HED Metric Evaluations\Results-for-IP-Models\Results_Co_Skel_ep_70_lr_1e7\preds';

addpath(st1)
addpath(st2) 
% disp("ya1y")
j = 0;
disp('SRN')
for d=0:5
    [f3, j] = eval_coskelplus1(st1, st2, d);
    disp(['F' num2str(d) ' Score = ' num2str(f3)])
end
disp(['JS = ' num2str(j)])
% disp("ya2y")   

