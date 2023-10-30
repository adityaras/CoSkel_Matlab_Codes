I=[3,5;6,7];
k=[2,5,3;6,9,1;2,7,9];
s=[1,1];
mm=zeros(size(I,1)*size(k,1)-(size(k,1)-s(1))*(size(k,1)-1),size(I,2)*size(k,2)-(size(k,2)-s(2))*(size(k,2)-1),numel(k));
% In the case of no overlap, stride must be equal to size of k. 
% In that case, output spatial size will be equal to Image size * Filter size.
% However, in the case of overlap,i.e. stride is not equal to filter size,
% the output size must reduce by a factor,
% (filter_size-stride)*(filetr_size-1), where the first part measures how
% much overlap and the second term measures how many times overlap happens. 

% mm has been intialized with 0s, and it has as many channels as number of
% matrices that will be developed, i.e., number of elelements in k. 

v=1;
for i=1:size(k,1)
    for j=1:size(k,2)
        tt=I*k(i,j);
        ii=1+(i-1)*s(1);
        jj=1+(j-1)*s(2);
        mm(ii:ii+size(I,1)-1,jj:jj+size(I,2)-1,v)=tt;
        v=v+1;
    end
end
% we place the products of matrix and kerenel element at appropriate index.
% 
fin=sum(mm,3);% then add up the channels of mm for final output of transposed convolution.