
% st1='E:\Desktop\CoSkel_Matlab_Codes\TransUNET_GT';
% st3='E:\Desktop\CoSkel_Matlab_Codes\Results\tnet-sa-b4-alph5-cl2-gamma0-2-v57-58\save_gts';


st1='/Users/adityarastogi/Desktop/Personal/CoSkel_Matlab_Codes-main/TransUNET_GT';
st3='/Users/adityarastogi/Desktop/Personal/CoSkel_Matlab_Codes-main/Results/TRUE_SA_WID_MSE_DL_ALPH5_B4_NUM2_GAMMA_NOT02_DC/save_gts';


addpath(st1)
addpath(st3) 

dr=dir([st3]);
numRows = numel(dr) - 2;
finalRes = cell(numRows, 8);
disp("TRUE_SA_WID_MSE_DL_ALPH5_B4_NUM2_GAMMA_NOT02_DC")
dr=dir([st3]);
for i=3:numel(dr)
    st2=fullfile(st3, dr(i).name);
    % disp(st2)
    addpath(st2) 
    j = 0;
    finalRes{i,1} = dr(i).name;
    for d=0:5
        [f3, j] = eval_coskelplus(st1, st2, d);
        disp([ dr(i).name ' : F' num2str(d) ' Score = ' num2str(f3)])
        finalRes{i,2+d} = num2str(f3);
    end
    finalRes{i,8} = num2str(j);
    disp([ dr(i).name ' : JS = ' num2str(j)])
end
disp(finalRes)
% disp("ya2y")   