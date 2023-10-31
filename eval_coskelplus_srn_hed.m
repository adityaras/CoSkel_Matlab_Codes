function [scx,jmx] = eval_coskelplus1(st1,st2,tresm)

    fxx=0;
    scx=0;jmx=0;
    dr=dir([st2]);
    for i=3:numel(dr)
        % dr = dir(fullfile(st2, categs(j).name));
        % disp(fullfile(st2, categs(j).name))
        % break
        % for i=3:numel(dr)            
            % if exist(fullfile(st1, categs(j).name, dr(i).name),'file')            
            %     gt=double(imread(fullfile(st1, categs(j).name, dr(i).name)));
            %     rs=double(imread(fullfile(st2, categs(j).name, dr(i).name)));
            %     rs=double(im2bw(mat2gray(rs),graythresh(mat2gray(rs))));
            if exist(fullfile(st1, dr(i).name),'file')            
                gt=double(imread(fullfile(st1, dr(i).name)));
                rs=double(imread(fullfile(st2, dr(i).name)));
                rs=double(im2bw(mat2gray(rs),graythresh(mat2gray(rs))));


                Mp=size(rs,1);Np=size(rs,2);
                gt=double(im2bw(mat2gray(imresize(gt,[Mp,Np],'nearest')),0.5));
                
                mask2=[0 1 1 1 0
                    1 1 1 1 1
                    1 1 1 1 1
                    1 1 1 1 1
                    0 1 1 1 0];
                mask3=[0 0 1 1 1 0 0
                    0 1 1 1 1 1 0
                    1 1 1 1 1 1 1
                    1 1 1 1 1 1 1
                    1 1 1 1 1 1 1
                    0 1 1 1 1 1 0
                    0 0 1 1 1 0 0];
                mask4=[0 0 0 1 1 1 0 0 0
                    0 0 1 1 1 1 1 0 0
                    0 1 1 1 1 1 1 1 0
                    1 1 1 1 1 1 1 1 1
                    1 1 1 1 1 1 1 1 1
                    1 1 1 1 1 1 1 1 1
                    0 0 0 1 1 1 0 0 0
                    0 0 1 1 1 1 1 0 0
                    0 1 1 1 1 1 1 1 0];
                mask5=[0 0 0 0 1 1 1 0 0 0 0
                    0 0 0 1 1 1 1 1 0 0 0
                    0 0 1 1 1 1 1 1 1 0 0
                    0 1 1 1 1 1 1 1 1 1 0
                    1 1 1 1 1 1 1 1 1 1 1
                    1 1 1 1 1 1 1 1 1 1 1
                    1 1 1 1 1 1 1 1 1 1 1
                    0 1 1 1 1 1 1 1 1 1 0
                    0 0 1 1 1 1 1 1 1 0 0
                    0 0 0 1 1 1 1 1 0 0 0
                    0 0 0 0 1 1 1 0 0 0 0];
                
                m2=gt+rs;
            
                jm=j_measure(gt,rs);
                list1=find(m2==2);
                scr=0;
                [M,N]=find(gt==1);
                for k=1:numel(M)
                    if tresm==1||M(k)-tresm<1||M(k)+tresm>Mp||N(k)-tresm<1||N(k)+tresm>Np
                        trf=sum(sum(rs(max(1,M(k)-tresm):min(M(k)+tresm,Mp),max(1,N(k)-tresm):min(Np,N(k)+tresm))));
                    elseif tresm==2
                        trf=sum(sum(rs(max(1,M(k)-tresm):min(M(k)+tresm,Mp),max(1,N(k)-tresm):min(Np,N(k)+tresm)).*mask2));
                    elseif tresm==4
                        trf=sum(sum(rs(max(1,M(k)-tresm):min(M(k)+tresm,Mp),max(1,N(k)-tresm):min(Np,N(k)+tresm)).*mask4));
                    elseif tresm==5
                        trf=sum(sum(rs(max(1,M(k)-tresm):min(M(k)+tresm,Mp),max(1,N(k)-tresm):min(Np,N(k)+tresm)).*mask5));
                    else
                        trf=sum(sum(rs(max(1,M(k)-tresm):min(M(k)+tresm,Mp),max(1,N(k)-tresm):min(Np,N(k)+tresm)).*mask3));
                    end
                    
                    if trf>0
                        scr=scr+1;
                    end
                end
                
                scr=scr/(numel(M)+eps);
                
                scr2=0;
                [M2,N2]=find(rs==1);
                for k=1:numel(M2)
                    if tresm==1||M2(k)-tresm<1||M2(k)+tresm>Mp||N2(k)-tresm<1||N2(k)+tresm>Np
                        trf=sum(sum(gt(max(1,M2(k)-tresm):min(M2(k)+tresm,Mp),max(1,N2(k)-tresm):min(Np,N2(k)+tresm))));
                    elseif tresm==2
                        trf=sum(sum(gt(max(1,M2(k)-tresm):min(M2(k)+tresm,Mp),max(1,N2(k)-tresm):min(Np,N2(k)+tresm)).*mask2));
                    elseif tresm==4
                        trf=sum(sum(gt(max(1,M2(k)-tresm):min(M2(k)+tresm,Mp),max(1,N2(k)-tresm):min(Np,N2(k)+tresm)).*mask4));
                    elseif tresm==5
                        trf=sum(sum(gt(max(1,M2(k)-tresm):min(M2(k)+tresm,Mp),max(1,N2(k)-tresm):min(Np,N2(k)+tresm)).*mask5));
                    else
                        trf=sum(sum(gt(max(1,M2(k)-tresm):min(M2(k)+tresm,Mp),max(1,N2(k)-tresm):min(Np,N2(k)+tresm)).*mask3));
                    end
                    if trf>0
                        scr2=scr2+1;
                    end
                end
                
                scr2=scr2/(numel(M2)+eps);
                
                list2=find(rs==1);
                list3=find(gt==1);
            
                pre=numel(list1)/(numel(list2)+eps);
                rec=numel(list1)/(numel(list3)+eps);
                fx=2*pre*rec/(pre+rec+eps);
                fxx=fxx+fx;
                scx=scx+2*scr2*scr/(scr+scr2+eps);
                jmx=jmx+jm;
            end
        % end
        if i
            fxx=fxx/i;
            scx=scx/i;
            jmx=jmx/i;
        else
            i=1;
            scx=scx/i;
            jmx=jmx/i;
            i=0;
        end
    end
end
    
    