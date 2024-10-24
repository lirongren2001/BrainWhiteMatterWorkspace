clear;
clc;
close all;

%% add path
addpath(genpath([pwd,'\add2path\']));

%% preprocessing
path1=pwd;
list=dir([pwd,'\preprocess\']);
if length(list)>2
    rmdir([pwd,'\preprocess\*.*'],'s');
end
copyfile([pwd,'\data_FunImg_T1Img\*.*'],[pwd,'\preprocess\']);
load([pwd,'\prepro_saved.mat']);
Cfg.WorkingDir=[pwd,'\preprocess'];
Cfg.DataProcessDir=[pwd,'\preprocess'];
list=dir([pwd,'\preprocess\FunImg\']);
Cfg.SubjectID={};
for i=3:length(list)
    Cfg.SubjectID{i-2,1}=list(i).name;
end
%######################## set parameters #######################%
Cfg.TimePoints=240; % set number of TRs
Cfg.TR=2.01; % set TR
Cfg.SliceTiming.SliceNumber=32; % set number of slices
Cfg.SliceTiming.SliceOrder=[2:2:32 1:2:32]; % set slice order
Cfg.SliceTiming.ReferenceSlice=1; % set reference slice
wmthresh=0.80; % set white matter mask thresheold
Cfg.IsNeedConvertFunDCM2IMG = 0;
Cfg.IsNeedConvertT1DCM2IMG = 0;
Cfg.IsNeedReorientFunImgInteractively = 1;
Cfg.IsNeedReorientT1ImgInteractively = 1;
Cfg.RemoveFirstTimePoints = 10;
%###############################################################%
save prepro_saved.mat Cfg;
DPARSFA_run('prepro_saved.mat');
cd(path1);
disp('dpabi run succes');
%% gen matrix
list=dir([pwd,'\result1_corrmatrix\']);
if length(list)>2
    delete([pwd,'\result1_corrmatrix\*.*']);
end
list=dir([pwd,'\result1_corrmatrix\']);
if length(list)>2
    rmdir([pwd,'\result1_corrmatrix\*.*'],'s');
end
copyfile([pwd,'\preprocess\FunImgARWDF\'],[pwd,'\result1_corrmatrix\FunImgARWDF\']);
copyfile([pwd,'\preprocess\T1ImgNewSegment\'],[pwd,'\result1_corrmatrix\T1ImgNewSegment\']);
nii=load_nii([pwd,'\atlas\Brodmann\Brodmann_YCG_fl.nii']);
Brd=nii.img;
load([pwd,'\atlas\Brodmann\Brodmann_YCG_Labels.mat']);
label=cell2mat(Reference(:,2));
Brd_label=label([2:2:82,83:-2:3]);
nii=load_nii([pwd,'\atlas\EVE\Eve_MNI152_Seg2.hdr']);
Eve=nii.img;
Eve_label=[8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 ...
           1 2 3 4 5 6 ... 
           47 45 43 41 39 37 35 33 31 29 27 25 23 21 19 17 15 13 11 9 7];
list=dir([pwd,'\result1_corrmatrix\FunImgARWDF\']);
list(1:2)=[];
for i=1:length(list)
    name=[pwd,'\result1_corrmatrix\FunImgARWDF\',list(i).name,'\Filtered_4DVolume.nii'];
    newname=[pwd,'\result1_corrmatrix\FunImgARWDF\',list(i).name,'\image.nii'];
    reslice_nii(name,newname,[1 1 1]);
    nii=load_nii([pwd,'\result1_corrmatrix\FunImgARWDF\',list(i).name,'\image.nii']);
    img=nii.img;
    img=img(end:-1:1,:,:,:);
    nii.img=img;
    save_nii(nii,[pwd,'\result1_corrmatrix\FunImgARWDF\',list(i).name,'\image.nii']);
    tmp=dir([pwd,'\result1_corrmatrix\T1ImgNewSegment\',list(i).name,'\wc2*.nii']);
    name=[pwd,'\result1_corrmatrix\T1ImgNewSegment\',list(i).name,'\',tmp(1).name];
    newname=[pwd,'\result1_corrmatrix\T1ImgNewSegment\',list(i).name,'\image.nii'];
    reslice_nii(name,newname,[1 1 1]);
    nii=load_nii([pwd,'\result1_corrmatrix\T1ImgNewSegment\',list(i).name,'\image.nii']);
    img=nii.img;
    img=img(end:-1:1,:,:,:);
    nii.img=img;
    save_nii(nii,[pwd,'\result1_corrmatrix\T1ImgNewSegment\',list(i).name,'\image.nii']);
    
    matr=zeros(length(Brd_label),length(Eve_label));
    Brd_time=zeros(length(Brd_label),Cfg.TimePoints-Cfg.RemoveFirstTimePoints);
    Eve_time=zeros(length(Eve_label),Cfg.TimePoints-Cfg.RemoveFirstTimePoints);
    
    nii=load_nii([pwd,'\result1_corrmatrix\FunImgARWDF\',list(i).name,'\image.nii']);
    img=nii.img;
    nii=load_nii([pwd,'\result1_corrmatrix\T1ImgNewSegment\',list(i).name,'\image.nii']);
    wm=nii.img;
    
    img=reshape(img,181*217*181,Cfg.TimePoints-Cfg.RemoveFirstTimePoints);
    imgstd=repmat(std(img,[],2),1,Cfg.TimePoints-Cfg.RemoveFirstTimePoints);
    imgmean=repmat(mean(img,2),1,Cfg.TimePoints-Cfg.RemoveFirstTimePoints);
    img=(img-imgmean)./(imgstd+eps);
    img=reshape(img,181,217,181,Cfg.TimePoints-Cfg.RemoveFirstTimePoints);
    
    for j=1:length(Brd_label)
        roi=logical(Brd==Brd_label(j));
        roi=repmat(roi,1,1,1,Cfg.TimePoints-Cfg.RemoveFirstTimePoints);
        tmp=img.*roi;
        tmp=reshape(tmp,181*217*181,Cfg.TimePoints-Cfg.RemoveFirstTimePoints);
        roi=reshape(roi,181*217*181,Cfg.TimePoints-Cfg.RemoveFirstTimePoints);
        Brd_time(j,:)=sum(tmp,1)./sum(roi,1);
    end
    
    for j=1:length(Eve_label)
        roi=logical(Eve==Eve_label(j)).*logical(wm>wmthresh);
        roi=repmat(roi,1,1,1,Cfg.TimePoints-Cfg.RemoveFirstTimePoints);
        tmp=img.*roi;
        tmp=reshape(tmp,181*217*181,Cfg.TimePoints-Cfg.RemoveFirstTimePoints);
        roi=reshape(roi,181*217*181,Cfg.TimePoints-Cfg.RemoveFirstTimePoints);
        Eve_time(j,:)=sum(tmp,1)./sum(roi,1);
    end
    
    for j=1:length(Brd_label)
        for k=1:length(Eve_label)
            tmp=corrcoef(Brd_time(j,:),Eve_time(k,:));
            matr(j,k)=tmp(1,2);
        end
    end
    matr=matr';
    matr=mapminmax(matr(:)');
    matr=reshape(matr,length(Eve_label),length(Brd_label));

    matr_WW=zeros(length(Eve_label),length(Eve_label));
    for j=1:length(Eve_label)
        for k=1:length(Eve_label)
            tmp=corrcoef(Eve_time(j,:),Eve_time(k,:));
            matr_WW(j,k)=tmp(1,2);
        end
    end
    matr_WW=matr_WW';
    matr_WW=mapminmax(matr_WW(:)');
    matr_WW=reshape(matr_WW,length(Eve_label),length(Eve_label));

    matr_GG=zeros(length(Brd_label),length(Brd_label));
    for j=1:length(Brd_label)
        for k=1:length(Brd_label)
            tmp=corrcoef(Brd_time(j,:),Brd_time(k,:));
            matr_GG(j,k)=tmp(1,2);
        end
    end
    matr_GG=matr_GG';
    matr_GG=mapminmax(matr_GG(:)');
    matr_GG=reshape(matr_GG,length(Brd_label),length(Brd_label));

    save([pwd,'\result1_corrmatrix\matr_',list(i).name,'.mat'],'matr','matr_WW','matr_GG','Eve_time','Brd_time');
end
list1=list;

%% gen wm alff
list=dir([pwd,'\result2_wm_alff\']);
if length(list)>2
    delete([pwd,'\result2_wm_alff\*.*']);
end
list=dir([pwd,'\result2_wm_alff\']);
if length(list)>2
    rmdir([pwd,'\result2_wm_alff\*.*'],'s');
end
copyfile([pwd,'\preprocess\Results\ALFF_FunImgARWD'],[pwd,'\result2_wm_alff\ALFF_FunImgARWD']);
list=dir([pwd,'\result2_wm_alff\ALFF_FunImgARWD\zALFF*.nii']);
for i=1:length(list)
    name=[pwd,'\result2_wm_alff\ALFF_FunImgARWD\',list(i).name];
    tmpname=list(i).name(8:end);
    newname=[pwd,'\result2_wm_alff\ALFF_FunImgARWD\image',tmpname];
    reslice_nii(name,newname,[1 1 1]);
    nii=load_nii([pwd,'\result2_wm_alff\ALFF_FunImgARWD\image',tmpname]);
    img=nii.img;
    img=img(end:-1:1,:,:,:);
    nii.img=img;
    save_nii(nii,[pwd,'\result2_wm_alff\ALFF_FunImgARWD\image',tmpname]);
    nii=load_nii([pwd,'\result2_wm_alff\ALFF_FunImgARWD\image',tmpname]);
    img=nii.img;
    nii=load_nii([pwd,'\result1_corrmatrix\T1ImgNewSegment\',list1(i).name,'\image.nii']);
    wm=nii.img;
    alff=zeros(1,length(Eve_label));
    for j=1:length(Eve_label)
        roi=logical(Eve==Eve_label(j)).*logical(wm>wmthresh);
        tmp=img.*roi;
        alff(j)=sum(tmp(:))./sum(roi(:));
    end
    tmpname2=tmpname(1:end-4);
    save([pwd,'\result2_wm_alff\alff',tmpname2,'.mat'],'alff');
end

%% gen wm falff
list=dir([pwd,'\result3_wm_falff\']);
if length(list)>2
    delete([pwd,'\result3_wm_falff\*.*']);
end
list=dir([pwd,'\result3_wm_falff\']);
if length(list)>2
    rmdir([pwd,'\result3_wm_falff\*.*'],'s');
end
copyfile([pwd,'\preprocess\Results\fALFF_FunImgARWD'],[pwd,'\result3_wm_falff\fALFF_FunImgARWD']);
list=dir([pwd,'\result3_wm_falff\fALFF_FunImgARWD\zfALFF*.nii']);
for i=1:length(list)
    name=[pwd,'\result3_wm_falff\fALFF_FunImgARWD\',list(i).name];
    tmpname=list(i).name(9:end);
    newname=[pwd,'\result3_wm_falff\fALFF_FunImgARWD\image',tmpname];
    reslice_nii(name,newname,[1 1 1]);
    nii=load_nii([pwd,'\result3_wm_falff\fALFF_FunImgARWD\image',tmpname]);
    img=nii.img;
    img=img(end:-1:1,:,:,:);
    nii.img=img;
    save_nii(nii,[pwd,'\result3_wm_falff\fALFF_FunImgARWD\image',tmpname]);
    nii=load_nii([pwd,'\result3_wm_falff\fALFF_FunImgARWD\image',tmpname]);
    img=nii.img;
    nii=load_nii([pwd,'\result1_corrmatrix\T1ImgNewSegment\',list1(i).name,'\image.nii']);
    wm=nii.img;
    falff=zeros(1,length(Eve_label));
    for j=1:length(Eve_label)
        roi=logical(Eve==Eve_label(j)).*logical(wm>wmthresh);
        tmp=img.*roi;
        falff(j)=sum(tmp(:))./sum(roi(:));
    end
    tmpname2=tmpname(1:end-4);
    save([pwd,'\result3_wm_falff\falff',tmpname2,'.mat'],'falff');
end

%% gen wm reho
list=dir([pwd,'\result4_wm_reho\']);
if length(list)>2
    delete([pwd,'\result4_wm_reho\*.*']);
end
list=dir([pwd,'\result4_wm_reho\']);
if length(list)>2
    rmdir([pwd,'\result4_wm_reho\*.*'],'s');
end
copyfile([pwd,'\preprocess\Results\ReHo_FunImgARWDF'],[pwd,'\result4_wm_reho\ReHo_FunImgARWDF']);
list=dir([pwd,'\result4_wm_reho\ReHo_FunImgARWDF\zReHo*.nii']);
for i=1:length(list)
    name=[pwd,'\result4_wm_reho\ReHo_FunImgARWDF\',list(i).name];
    tmpname=list(i).name(8:end);
    newname=[pwd,'\result4_wm_reho\ReHo_FunImgARWDF\image',tmpname];
    reslice_nii(name,newname,[1 1 1]);
    nii=load_nii([pwd,'\result4_wm_reho\ReHo_FunImgARWDF\image',tmpname]);
    img=nii.img;
    img=img(end:-1:1,:,:,:);
    nii.img=img;
    save_nii(nii,[pwd,'\result4_wm_reho\ReHo_FunImgARWDF\image',tmpname]);
    nii=load_nii([pwd,'\result4_wm_reho\ReHo_FunImgARWDF\image',tmpname]);
    img=nii.img;
    nii=load_nii([pwd,'\result1_corrmatrix\T1ImgNewSegment\',list1(i).name,'\image.nii']);
    wm=nii.img;
    reho=zeros(1,length(Eve_label));
    for j=1:length(Eve_label)
        roi=logical(Eve==Eve_label(j)).*logical(wm>wmthresh);
        tmp=img.*roi;
        reho(j)=sum(tmp(:))./sum(roi(:));
    end
    tmpname2=tmpname(1:end-4);
    save([pwd,'\result4_wm_reho\reho',tmpname2,'.mat'],'reho');
end

%% gen wm degree_centrality
list=dir([pwd,'\result5_wm_degree_centrality\']);
if length(list)>2
    delete([pwd,'\result5_wm_degree_centrality\*.*']);
end
list=dir([pwd,'\result5_wm_degree_centrality\']);
if length(list)>2
    rmdir([pwd,'\result5_wm_degree_centrality\*.*'],'s');
end
copyfile([pwd,'\preprocess\Results\DegreeCentrality_FunImgARWDF'],[pwd,'\result5_wm_degree_centrality\DegreeCentrality_FunImgARWDF']);
list=dir([pwd,'\result5_wm_degree_centrality\DegreeCentrality_FunImgARWDF\zDegreeCentrality_PositiveWeighted*.nii']);
for i=1:length(list)
    name=[pwd,'\result5_wm_degree_centrality\DegreeCentrality_FunImgARWDF\',list(i).name];
    tmpname=list(i).name(45:end);
    newname=[pwd,'\result5_wm_degree_centrality\DegreeCentrality_FunImgARWDF\image',tmpname];
    reslice_nii(name,newname,[1 1 1]);
    nii=load_nii([pwd,'\result5_wm_degree_centrality\DegreeCentrality_FunImgARWDF\image',tmpname]);
    img=nii.img;
    img=img(end:-1:1,:,:,:);
    nii.img=img;
    save_nii(nii,[pwd,'\result5_wm_degree_centrality\DegreeCentrality_FunImgARWDF\image',tmpname]);
    nii=load_nii([pwd,'\result5_wm_degree_centrality\DegreeCentrality_FunImgARWDF\image',tmpname]);
    img=nii.img;
    nii=load_nii([pwd,'\result1_corrmatrix\T1ImgNewSegment\',list1(i).name,'\image.nii']);
    wm=nii.img;
    degree=zeros(1,length(Eve_label));
    for j=1:length(Eve_label)
        roi=logical(Eve==Eve_label(j)).*logical(wm>wmthresh);
        tmp=img.*roi;
        degree(j)=sum(tmp(:))./sum(roi(:));
    end
    tmpname2=tmpname(1:end-4);
    save([pwd,'\result5_wm_degree_centrality\degree',tmpname2,'.mat'],'degree');
end
disp('main batch success!!');