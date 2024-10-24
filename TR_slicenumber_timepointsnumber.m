FunImg_dir='../../temp/FunImg';
T1Img_dir='../../temp/T1Img';
T1_dir='../T1Img';
cd('./data_FunImg_T1Img/FunImg')
nii_dir='./';
dirs=dir([nii_dir,'*']);
dirs=dirs(3:length(dirs));
len=length(dirs);
filelist=[''];
number=[];
total=0;
flag=zeros(1,length(dirs));
for i = 1:length(dirs)
    if isdir(dirs(i).name)
        cd (dirs(i).name);
        niis=dir([nii_dir,'*']);
        nii=niis(3);
        fmri_data=spm_vol(nii.name);
        timepoints=length(fmri_data);
        timepoints=num2str(timepoints);
        slicenumber=fmri_data(1).dim(3);
        slicenumber=num2str(slicenumber);
        TR=num2str(fmri_data(1).private.timing.tspace);
        number(end+1)=0;
        filelist(end+1:end+length(dirs(i).name))=dirs(i).name;
        number(end)=number(end)+length(dirs(i).name);
        filelist(end+1)=',';
        number(end)=number(end)+1;
        filelist(end+1:end+3)='TR:';
        number(end)=number(end)+3;
        filelist(end+1:end+length(TR))=TR;
        number(end)=number(end)+length(TR);
        filelist(end+1)=',';
        number(end)=number(end)+1;
        filelist(end+1:end+12)='slicenumber:';
        number(end)=number(end)+12;
        filelist(end+1:end+length(slicenumber))=slicenumber;
        number(end)=number(end)+length(slicenumber);
        filelist(end+1:end+20)=',time points number:';
        number(end)=number(end)+20;
        filelist(end+1:end+length(timepoints))=timepoints;
        number(end)=number(end)+length(timepoints);
        if i ~= length(dirs)
            filelist(end+1:end+5)=',    ';
            number(end)=number(end)+5;
        end
        cd ('../');
        if i==1
            parameter_TR=TR;
            parameter_slicenumber=slicenumber;
            parameter_timepoints=timepoints;
            total=1;
        else
            if any(TR~=parameter_TR)||any(slicenumber~=parameter_slicenumber)||any(timepoints~=parameter_timepoints)
               flag(i)=1;
               if exist(FunImg_dir)==0
                   mkdir(FunImg_dir);
               end
               movefile(fullfile(dirs(i).folder,dirs(i).name),FunImg_dir);
               movefile(fullfile(T1_dir,dirs(i).name),T1Img_dir);
            else
                total=total+1;
            end
        end
    end
end
cd ('../../');