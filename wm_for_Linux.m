function varargout = wm_for_Linux(varargin)
% WM_FOR_LINUX MATLAB code for wm_for_Linux.fig
%      WM_FOR_LINUX, by itself, creates a new WM_FOR_LINUX or raises the existing
%      singleton*.
%
%      H = WM_FOR_LINUX returns the handle to a new WM_FOR_LINUX or the handle to
%      the existing singleton*.
%
%      WM_FOR_LINUX('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WM_FOR_LINUX.M with the given input arguments.
%
%      WM_FOR_LINUX('Property','Value',...) creates a new WM_FOR_LINUX or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before wm_for_Linux_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to wm_for_Linux_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help wm_for_Linux

% Last Modified by GUIDE v2.5 20-Jul-2024 14:33:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @wm_for_Linux_OpeningFcn, ...
                   'gui_OutputFcn',  @wm_for_Linux_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
end


% --- Executes just before wm_for_Linux is made visible.
function wm_for_Linux_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to wm_for_Linux (see VARARGIN)

% Choose default command line output for wm_for_Linux
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes wm_for_Linux wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end

% --- Outputs from this function are returned to the command line.
function varargout = wm_for_Linux_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global tmpTimePoints; % set number of TRs
tmpTimePoints=240;
global tmpTR; % set TR
tmpTR=2.01;
global tmpSliceNumber; % set number of slices
tmpSliceNumber=32;
global tmpSliceOrder;
tmpSliceOrder=1;
global tmpReferenceSlice; % set reference slice
tmpReferenceSlice=1;
global tmpwmthresh; % set white matter mask thresheold
tmpwmthresh=0.80;
global tmpIsNeedConvertDCM2IMG;
tmpIsNeedConvertDCM2IMG=0;
global tmpIsNeedReorientImgInteractively;
tmpIsNeedReorientImgInteractively=0;
global tmpRemoveFirstTimePoints;
tmpRemoveFirstTimePoints=10;

end

function Time_Point_Callback(hObject, eventdata, handles)
% hObject    handle to Time_Point (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Time_Point as text
%        str2double(get(hObject,'String')) returns contents of Time_Point as a double
global tmpTimePoints;
tmpTimePoints = str2double(get(hObject, 'String'));
% --- Executes during object creation, after setting all properties.
end

% --- Executes during object creation, after setting all properties.
function Time_Point_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Time_Point (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function TR__Callback(hObject, eventdata, handles)
% hObject    handle to TR_ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TR_ as text
%        str2double(get(hObject,'String')) returns contents of TR_ as a double
global tmpTR;
tmpTR = str2double(get(hObject, 'String'));
end

% --- Executes during object creation, after setting all properties.
function TR__CreateFcn(hObject, eventdata, handles)
% hObject    handle to TR_ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function Slice_number_Callback(hObject, eventdata, handles)
% hObject    handle to Slice_number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Slice_number as text
%        str2double(get(hObject,'String')) returns contents of Slice_number as a double
global tmpSliceNumber;
tmpSliceNumber = str2double(get(hObject, 'String'));
end

% --- Executes during object creation, after setting all properties.
function Slice_number_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Slice_number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
end

% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function Reference_Slice_Callback(hObject, eventdata, handles)
% hObject    handle to Reference_Slice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Reference_Slice as text
%        str2double(get(hObject,'String')) returns contents of Reference_Slice as a double
global tmpReferenceSlice;
tmpReferenceSlice = str2double(get(hObject, 'String'));
end


% --- Executes during object creation, after setting all properties.
function Reference_Slice_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Reference_Slice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function wm_Thresh_Callback(hObject, eventdata, handles)
% hObject    handle to wm_Thresh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wm_Thresh as text
%        str2double(get(hObject,'String')) returns contents of wm_Thresh as a double
global tmpwmThresh;
tmpwmThresh = str2double(get(hObject, 'String'));
end

% --- Executes during object creation, after setting all properties.
function wm_Thresh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wm_Thresh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function RemoveFirstTimePoints_Callback(hObject, eventdata, handles)
% hObject    handle to RemoveFirstTimePoints (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RemoveFirstTimePoints as text
%        str2double(get(hObject,'String')) returns contents of RemoveFirstTimePoints as a double
global tmpRemoveFirstTimePoints;
tmpRemoveFirstTimePoints = str2double(get(hObject, 'String'));
end


% --- Executes during object creation, after setting all properties.
function RemoveFirstTimePoints_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RemoveFirstTimePoints (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on button press in is_Nii.
function is_Nii_Callback(hObject, eventdata, handles)
% hObject    handle to is_Nii (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of is_Nii
global tmpIsNeedConvertDCM2IMG;
if ( get(hObject,'Value') )
    tmpIsNeedConvertDCM2IMG = 0;
else
    tmpIsNeedConvertDCM2IMG = 1;
end
end

% --- Executes on button press in is_DICOM.
function is_DICOM_Callback(hObject, eventdata, handles)
% hObject    handle to is_DICOM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of is_DICOM
global tmpIsNeedConvertDCM2IMG;
if ( get(hObject,'Value') )
    tmpIsNeedConvertDCM2IMG = 1;
else
    tmpIsNeedConvertDCM2IMG = 0;
end
end

% --- Executes on button press in IsNeedReorientImgInteractively.
function IsNeedReorientImgInteractively_Callback(hObject, eventdata, handles)
% hObject    handle to IsNeedReorientImgInteractively (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tmpIsNeedReorientImgInteractively;
if ( get(hObject,'Value') )
    tmpIsNeedReorientImgInteractively = 1;
else
    tmpIsNeedReorientImgInteractively = 0;
end
end
% Hint: get(hObject,'Value') returns toggle state of IsNeedReorientImgInteractively
% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tmpSliceOrder;
tmpSliceOrder = get(hObject, 'value');
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
end

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
% --- Executes on button press in run.
function run_Callback(hObject, eventdata, handles)
% hObject    handle to run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA
    uiwait(msgbox('开始处理！', '提示', 'modal'));
    clear;
    clc;
    close all;
    
    %% add path
    addpath(genpath([pwd,'/add2path/']));
    
    
    %% preprocessing
    path1=pwd;
    list=dir([pwd,'/preprocess/']);
    if length(list)>2
        rmdir([pwd,'/preprocess/*'],'s');
    end
    copyfile([pwd,'/data_Funraw_T1raw/*'],[pwd,'/preprocess/']);
    load([pwd,'/prepro_saved.mat']);
    Cfg.WorkingDir=[pwd,'/preprocess'];
    Cfg.DataProcessDir=[pwd,'/preprocess'];
    list=dir([pwd,'/preprocess/FunRaw/']);
    Cfg.SubjectID={};
    for i=3:length(list)
        Cfg.SubjectID{i-2,1}=list(i).name;
    end
    %######################## set parameters #######################%
    global tmpTimePoints; % set number of TRs
    global tmpTR; % set TR
    global tmpSliceNumber; % set number of slices
    global tmpSliceOrder;
    global tmpReferenceSlice; % set reference slice
    global tmpwmthresh; % set white matter mask thresheold
    global tmpIsNeedConvertDCM2IMG;
    global tmpIsNeedReorientImgInteractively;
    global tmpRemoveFirstTimePoints;
    
    Cfg.TimePoints=tmpTimePoints; % set number of TRs
    Cfg.TR=tmpTR; % set TR
    Cfg.SliceTiming.SliceNumber=tmpSliceNumber; % set number of slices
    Cfg.SliceTiming.SliceOrder=[2:2:tmpSliceNumber 1:2:tmpSliceNumber]; % set slice order
    Cfg.SliceTiming.ReferenceSlice=tmpReferenceSlice; % set reference slice
    wmthresh=tmpwmthresh; % set white matter mask thresheold
    Cfg.IsNeedConvertFunDCM2IMG = tmpIsNeedConvertDCM2IMG;
    Cfg.IsNeedConvertT1DCM2IMG = tmpIsNeedConvertDCM2IMG;
    Cfg.IsNeedReorientFunImgInteractively = tmpIsNeedReorientImgInteractively;
    Cfg.IsNeedReorientT1ImgInteractively = tmpIsNeedReorientImgInteractively;
    Cfg.RemoveFirstTimePoints = tmpRemoveFirstTimePoints;
    switch tmpSliceOrder
        case 1
            Cfg.SliceTiming.SliceOrder=[2:2:tmpSliceNumber 1:2:tmpSliceNumber]; % set slice order
        case 2
            Cfg.SliceTiming.SliceOrder=[1:1:tmpSliceNumber]; % set slice order
        case 3
            Cfg.SliceTiming.SliceOrder=[tmpSliceNumber:-2:2 tmpSliceNumber-1:-2:1]; % set slice order
        case 4
            Cfg.SliceTiming.SliceOrder=[tmpSliceNumber:-1:1]; % set slice order
    end
    %###############################################################%
    save prepro_saved.mat Cfg;
    DPARSFA_run('prepro_saved.mat');
    cd(path1);
    disp('dpabi run success');
    %% gen matrix
    list=dir([pwd,'/result1_corrmatrix/']);
    if length(list)>2
        delete([pwd,'/result1_corrmatrix/*']);
    end
    list=dir([pwd,'/result1_corrmatrix/']);
    if length(list)>2
        rmdir([pwd,'/result1_corrmatrix/*'],'s');
    end
    copyfile([pwd,'/preprocess/FunImgARWDF/'],[pwd,'/result1_corrmatrix/FunImgARWDF/']);
    copyfile([pwd,'/preprocess/T1ImgNewSegment/'],[pwd,'/result1_corrmatrix/T1ImgNewSegment/']);
    nii=load_nii([pwd,'/atlas/Brodmann/Brodmann_YCG_fl.nii']);
    Brd=nii.img;
    load([pwd,'/atlas/Brodmann/Brodmann_YCG_Labels.mat']);
    label=cell2mat(Reference(:,2));
    Brd_label=label([2:2:82,83:-2:3]);
    nii=load_nii([pwd,'/atlas/EVE/Eve_MNI152_Seg2.hdr']);
    Eve=nii.img;
    Eve_label=[8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 ...
               1 2 3 4 5 6 ... 
               47 45 43 41 39 37 35 33 31 29 27 25 23 21 19 17 15 13 11 9 7];
    list=dir([pwd,'/result1_corrmatrix/FunImgARWDF/']);
    list(1:2)=[];
    for i=1:length(list)
        name=[pwd,'/result1_corrmatrix/FunImgARWDF/',list(i).name,'/Filtered_4DVolume.nii'];
        newname=[pwd,'/result1_corrmatrix/FunImgARWDF/',list(i).name,'/image.nii'];
        reslice_nii(name,newname,[1 1 1]);
        nii=load_nii([pwd,'/result1_corrmatrix/FunImgARWDF/',list(i).name,'/image.nii']);
        img=nii.img;
        img=img(end:-1:1,:,:,:);
        nii.img=img;
        save_nii(nii,[pwd,'/result1_corrmatrix/FunImgARWDF/',list(i).name,'/image.nii']);
        tmp=dir([pwd,'/result1_corrmatrix/T1ImgNewSegment/',list(i).name,'/wc2*.nii']);
        name=[pwd,'/result1_corrmatrix/T1ImgNewSegment/',list(i).name,'/',tmp(1).name];
        newname=[pwd,'/result1_corrmatrix/T1ImgNewSegment/',list(i).name,'/image.nii'];
        reslice_nii(name,newname,[1 1 1]);
        nii=load_nii([pwd,'/result1_corrmatrix/T1ImgNewSegment/',list(i).name,'/image.nii']);
        img=nii.img;
        img=img(end:-1:1,:,:,:);
        nii.img=img;
        save_nii(nii,[pwd,'/result1_corrmatrix/T1ImgNewSegment/',list(i).name,'/image.nii']);
        
        matr=zeros(length(Brd_label),length(Eve_label));
        Brd_time=zeros(length(Brd_label),Cfg.TimePoints-Cfg.RemoveFirstTimePoints);
        Eve_time=zeros(length(Eve_label),Cfg.TimePoints-Cfg.RemoveFirstTimePoints);
        
        nii=load_nii([pwd,'/result1_corrmatrix/FunImgARWDF/',list(i).name,'/image.nii']);
        img=nii.img;
        nii=load_nii([pwd,'/result1_corrmatrix/T1ImgNewSegment/',list(i).name,'/image.nii']);
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
        
        save([pwd,'/result1_corrmatrix/matr_',list(i).name,'.mat'],'matr','matr_WW','matr_GG','Eve_time','Brd_time');
    end
    list1=list;
    
    %% gen wm alff
    list=dir([pwd,'/result2_wm_alff/']);
    if length(list)>2
        delete([pwd,'/result2_wm_alff/*']);
    end
    list=dir([pwd,'/result2_wm_alff/']);
    if length(list)>2
        rmdir([pwd,'/result2_wm_alff/*'],'s');
    end
    copyfile([pwd,'/preprocess/Results/ALFF_FunImgARWD'],[pwd,'/result2_wm_alff/ALFF_FunImgARWD']);
    list=dir([pwd,'/result2_wm_alff/ALFF_FunImgARWD/zALFF*.nii']);
    for i=1:length(list)
        name=[pwd,'/result2_wm_alff/ALFF_FunImgARWD/',list(i).name];
        tmpname=list(i).name(8:end);
        newname=[pwd,'/result2_wm_alff/ALFF_FunImgARWD/image',tmpname];
        reslice_nii(name,newname,[1 1 1]);
        nii=load_nii([pwd,'/result2_wm_alff/ALFF_FunImgARWD/image',tmpname]);
        img=nii.img;
        img=img(end:-1:1,:,:,:);
        nii.img=img;
        save_nii(nii,[pwd,'/result2_wm_alff/ALFF_FunImgARWD/image',tmpname]);
        nii=load_nii([pwd,'/result2_wm_alff/ALFF_FunImgARWD/image',tmpname]);
        img=nii.img;
        nii=load_nii([pwd,'/result1_corrmatrix/T1ImgNewSegment/',list1(i).name,'/image.nii']);
        wm=nii.img;
        alff=zeros(1,length(Eve_label));
        for j=1:length(Eve_label)
            roi=logical(Eve==Eve_label(j)).*logical(wm>wmthresh);
            tmp=img.*roi;
            alff(j)=sum(tmp(:))./sum(roi(:));
        end
        tmpname2=tmpname(1:end-4);
        save([pwd,'/result2_wm_alff/alff',tmpname2,'.mat'],'alff');
    end
    
    %% gen wm falff
    list=dir([pwd,'/result3_wm_falff/']);
    if length(list)>2
        delete([pwd,'/result3_wm_falff/*']);
    end
    list=dir([pwd,'/result3_wm_falff/']);
    if length(list)>2
        rmdir([pwd,'/result3_wm_falff/*'],'s');
    end
    copyfile([pwd,'/preprocess/Results/fALFF_FunImgARWD'],[pwd,'/result3_wm_falff/fALFF_FunImgARWD']);
    list=dir([pwd,'/result3_wm_falff/fALFF_FunImgARWD/zfALFF*.nii']);
    for i=1:length(list)
        name=[pwd,'/result3_wm_falff/fALFF_FunImgARWD/',list(i).name];
        tmpname=list(i).name(9:end);
        newname=[pwd,'/result3_wm_falff/fALFF_FunImgARWD/image',tmpname];
        reslice_nii(name,newname,[1 1 1]);
        nii=load_nii([pwd,'/result3_wm_falff/fALFF_FunImgARWD/image',tmpname]);
        img=nii.img;
        img=img(end:-1:1,:,:,:);
        nii.img=img;
        save_nii(nii,[pwd,'/result3_wm_falff/fALFF_FunImgARWD/image',tmpname]);
        nii=load_nii([pwd,'/result3_wm_falff/fALFF_FunImgARWD/image',tmpname]);
        img=nii.img;
        nii=load_nii([pwd,'/result1_corrmatrix/T1ImgNewSegment/',list1(i).name,'/image.nii']);
        wm=nii.img;
        falff=zeros(1,length(Eve_label));
        for j=1:length(Eve_label)
            roi=logical(Eve==Eve_label(j)).*logical(wm>wmthresh);
            tmp=img.*roi;
            falff(j)=sum(tmp(:))./sum(roi(:));
        end
        tmpname2=tmpname(1:end-4);
        save([pwd,'/result3_wm_falff/falff',tmpname2,'.mat'],'falff');
    end
    
    %% gen wm reho
    list=dir([pwd,'/result4_wm_reho/']);
    if length(list)>2
        delete([pwd,'/result4_wm_reho/*']);
    end
    list=dir([pwd,'/result4_wm_reho/']);
    if length(list)>2
        rmdir([pwd,'/result4_wm_reho/*'],'s');
    end
    copyfile([pwd,'/preprocess/Results/ReHo_FunImgARWDF'],[pwd,'/result4_wm_reho/ReHo_FunImgARWDF']);
    list=dir([pwd,'/result4_wm_reho/ReHo_FunImgARWDF/zReHo*.nii']);
    for i=1:length(list)
        name=[pwd,'/result4_wm_reho/ReHo_FunImgARWDF/',list(i).name];
        tmpname=list(i).name(8:end);
        newname=[pwd,'/result4_wm_reho/ReHo_FunImgARWDF/image',tmpname];
        reslice_nii(name,newname,[1 1 1]);
        nii=load_nii([pwd,'/result4_wm_reho/ReHo_FunImgARWDF/image',tmpname]);
        img=nii.img;
        img=img(end:-1:1,:,:,:);
        nii.img=img;
        save_nii(nii,[pwd,'/result4_wm_reho/ReHo_FunImgARWDF/image',tmpname]);
        nii=load_nii([pwd,'/result4_wm_reho/ReHo_FunImgARWDF/image',tmpname]);
        img=nii.img;
        nii=load_nii([pwd,'/result1_corrmatrix/T1ImgNewSegment/',list1(i).name,'/image.nii']);
        wm=nii.img;
        reho=zeros(1,length(Eve_label));
        for j=1:length(Eve_label)
            roi=logical(Eve==Eve_label(j)).*logical(wm>wmthresh);
            tmp=img.*roi;
            reho(j)=sum(tmp(:))./sum(roi(:));
        end
        tmpname2=tmpname(1:end-4);
        save([pwd,'/result4_wm_reho/reho',tmpname2,'.mat'],'reho');
    end
    
    %% gen wm degree_centrality
    list=dir([pwd,'/result5_wm_degree_centrality/']);
    if length(list)>2
        delete([pwd,'/result5_wm_degree_centrality/*']);
    end
    list=dir([pwd,'/result5_wm_degree_centrality/']);
    if length(list)>2
        rmdir([pwd,'/result5_wm_degree_centrality/*'],'s');
    end
    copyfile([pwd,'/preprocess/Results/DegreeCentrality_FunImgARWDF'],[pwd,'/result5_wm_degree_centrality/DegreeCentrality_FunImgARWDF']);
    list=dir([pwd,'/result5_wm_degree_centrality/DegreeCentrality_FunImgARWDF/zDegreeCentrality_PositiveWeighted*.nii']);
    for i=1:length(list)
        name=[pwd,'/result5_wm_degree_centrality/DegreeCentrality_FunImgARWDF/',list(i).name];
        tmpname=list(i).name(45:end);
        newname=[pwd,'/result5_wm_degree_centrality/DegreeCentrality_FunImgARWDF/image',tmpname];
        reslice_nii(name,newname,[1 1 1]);
        nii=load_nii([pwd,'/result5_wm_degree_centrality/DegreeCentrality_FunImgARWDF/image',tmpname]);
        img=nii.img;
        img=img(end:-1:1,:,:,:);
        nii.img=img;
        save_nii(nii,[pwd,'/result5_wm_degree_centrality/DegreeCentrality_FunImgARWDF/image',tmpname]);
        nii=load_nii([pwd,'/result5_wm_degree_centrality/DegreeCentrality_FunImgARWDF/image',tmpname]);
        img=nii.img;
        nii=load_nii([pwd,'/result1_corrmatrix/T1ImgNewSegment/',list1(i).name,'/image.nii']);
        wm=nii.img;
        degree=zeros(1,length(Eve_label));
        for j=1:length(Eve_label)
            roi=logical(Eve==Eve_label(j)).*logical(wm>wmthresh);
            tmp=img.*roi;
            degree(j)=sum(tmp(:))./sum(roi(:));
        end
        tmpname2=tmpname(1:end-4);
        save([pwd,'/result5_wm_degree_centrality/degree',tmpname2,'.mat'],'degree');
    end
    disp('main batch success!!');
end
