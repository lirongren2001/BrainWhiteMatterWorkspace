function varargout = wm_for_Windows(varargin)
% wm_for_Windows MATLAB code for wm_for_Windows.fig
%      wm_for_Windows, by itself, creates a new wm_for_Windows or raises the existing
%      singleton*.
%
%      H = wm_for_Windows returns the handle to a new wm_for_Windows or the handle to
%      the existing singleton*.
%
%      wm_for_Windows('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in wm_for_Windows.M with the given input arguments.
%
%      wm_for_Windows('Property','Value',...) creates a new wm_for_Windows or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before wm_for_Windows_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to wm_for_Windows_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help wm_for_Windows

% Last Modified by GUIDE v2.5 20-Nov-2024 16:46:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @wm_for_Windows_OpeningFcn, ...
                   'gui_OutputFcn',  @wm_for_Windows_OutputFcn, ...
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

% --- Executes just before wm_for_Windows is made visible.
function wm_for_Windows_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to wm_for_Windows (see VARARGIN)

% Choose default command line output for wm_for_Windows
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes wm_for_Windows wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end

% --- Outputs from this function are returned to the command line.
function varargout = wm_for_Windows_OutputFcn(hObject, eventdata, handles) 
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
global grayMatterTemplate;
grayMatterTemplate=1;
global tmpReferenceSlice; % set reference slice
tmpReferenceSlice=1;
global tmpwmthresh; % set white matter mask thresheold
tmpwmthresh=0.80;
global tmpIsNeedConvertDCM2IMG;
tmpIsNeedConvertDCM2IMG=0;
global tmpIsNeedReorientImgInteractively;
tmpIsNeedReorientImgInteractively=1;
global tmpRemoveFirstTimePoints;
tmpRemoveFirstTimePoints=10;
global ifresult1;
global ifresult2;
global ifresult3;
global ifresult4;
global ifresult5;
ifresult1=1;
ifresult2=0;
ifresult3=0;
ifresult4=0;
ifresult5=0;
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
TR_slicenumber_timepointsnumber
set(handles.Timepoint,'String',num2str(parameter_timepoints));
set(handles.SliceNumber,'String',num2str(parameter_slicenumber));
set(handles.TR,'String',num2str(parameter_TR));
guidata(hObject, handles);
global tmpTimePoints; % set number of TRs
tmpTimePoints=str2double(parameter_timepoints);
global tmpTR; % set TR
tmpTR=str2double(parameter_TR);
global tmpSliceNumber; % set number of slices
tmpSliceNumber=str2double(parameter_slicenumber);
end

function Timepoint_Callback(hObject, eventdata, handles)
% hObject    handle to Timepoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Timepoint as text
%        str2double(get(hObject,'String')) returns contents of Timepoint as a double
global tmpTimePoints;
tmpTimePoints = str2double(get(hObject, 'String'));
% --- Executes during object creation, after setting all properties.
end

function Timepoint_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Timepoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function TR_Callback(hObject, eventdata, handles)
% hObject    handle to TR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TR as text
%        str2double(get(hObject,'String')) returns contents of TR as a double
global tmpTR;
tmpTR = str2double(get(hObject, 'String'));
end

% --- Executes during object creation, after setting all properties.
function TR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function SliceNumber_Callback(hObject, eventdata, handles)
% hObject    handle to SliceNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SliceNumber as text
%        str2double(get(hObject,'String')) returns contents of SliceNumber as a double
global tmpSliceNumber;
tmpSliceNumber = str2double(get(hObject, 'String'));
end

% --- Executes during object creation, after setting all properties.
function SliceNumber_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SliceNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function SliceOrder_Callback(hObject, eventdata, handles)
% hObject    handle to SliceOrder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SliceOrder as text
%        str2double(get(hObject,'String')) returns contents of SliceOrder as a double
end

% --- Executes during object creation, after setting all properties.
function SliceOrder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SliceOrder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function ReferenceSlice_Callback(hObject, eventdata, handles)
% hObject    handle to ReferenceSlice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ReferenceSlice as text
%        str2double(get(hObject,'String')) returns contents of ReferenceSlice as a double
global tmpReferenceSlice;
tmpReferenceSlice = str2double(get(hObject, 'String'));
end

% --- Executes during object creation, after setting all properties.
function ReferenceSlice_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ReferenceSlice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function wmThresh_Callback(hObject, eventdata, handles)
% hObject    handle to wmThresh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wmThresh as text
%        str2double(get(hObject,'String')) returns contents of wmThresh as a double
global tmpwmThresh;
tmpwmThresh = str2double(get(hObject, 'String'));
end

% --- Executes during object creation, after setting all properties.
function wmThresh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wmThresh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function RemoveFirst_Callback(hObject, eventdata, handles)
% hObject    handle to RemoveFirst (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RemoveFirst as text
%        str2double(get(hObject,'String')) returns contents of RemoveFirst as a double
global tmpRemoveFirstTimePoints;
tmpRemoveFirstTimePoints = str2double(get(hObject, 'String'));
end

% --- Executes during object creation, after setting all properties.
function RemoveFirst_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RemoveFirst (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = uigetdir; %进入文件夹选框
global directory
if a == 0 
else
    set(handles.edit9,'String',a);
    directory = get(handles.edit9,'String');
    %把选择内容放入文本框中
end
% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double
end

% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end

% --- Executes on selection change in data.
function data_Callback(hObject, eventdata, handles)
% hObject    handle to data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tmpIsNeedConvertDCM2IMG;
tmpIsNeedConvertDCM2IMG = get(hObject,'Value');

% Hints: contents = cellstr(get(hObject,'String')) returns data contents as cell array
%        contents{get(hObject,'Value')} returns selected item from data
end

% --- Executes during object creation, after setting all properties.
function data_CreateFcn(hObject, eventdata, handles)
% hObject    handle to data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
global tmpSliceOrder;
tmpSliceOrder = get(hObject, 'value');
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

% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
end

% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ifresult1;
ifresult1 = get(hObject,'Value');
% Hint: get(hObject,'Value') returns toggle state of radiobutton4
end


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ifresult2;
ifresult2 = get(hObject,'Value');
% Hint: get(hObject,'Value') returns toggle state of radiobutton5
end

% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ifresult3;
ifresult3 = get(hObject,'Value');
% Hint: get(hObject,'Value') returns toggle state of radiobutton6
end

% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ifresult4;
ifresult4 = get(hObject,'Value');
% Hint: get(hObject,'Value') returns toggle state of radiobutton7
end

% --- Executes on button press in radiobutton8.
function radiobutton8_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ifresult5;
ifresult5 = get(hObject,'Value');
% Hint: get(hObject,'Value') returns toggle state of radiobutton8
end
% --- Executes on button press in begin.
function begin_Callback(hObject, eventdata, handles)
% hObject    handle to begin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    uiwait(msgbox('开始处理！', '提示', 'modal'));
    
    %原代码内容
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
    global directory
    copyfile([directory],[pwd,'\preprocess\']);
    load([pwd,'\prepro_saved.mat']);
    Cfg.WorkingDir=[pwd,'\preprocess'];
    Cfg.DataProcessDir=[pwd,'\preprocess'];
    list=dir([pwd,'\preprocess\FunImg\']);
    Cfg.SubjectID={};
    for i=3:length(list)
        Cfg.SubjectID{i-2,1}=list(i).name;
    end
    
    %######################## set parameters #######################%
    global tmpTimePoints; % set number of TRs
    global tmpTR; % set TR
    global tmpSliceNumber; % set number of slices
    global tmpSliceOrder;
    global grayMatterTemplate;
    global tmpReferenceSlice; % set reference slice
    global tmpwmthresh; % set white matter mask thresheold
    global tmpIsNeedConvertDCM2IMG;
    global tmpIsNeedReorientImgInteractively;
    global tmpRemoveFirstTimePoints;
    global GM_label;

    
    Cfg.TimePoints=240; 
    Cfg.TR=2.01; 
    Cfg.SliceTiming.SliceNumber=32;
    Cfg.SliceTiming.ReferenceSlice=1; 
    wmthresh=0.80; 
    Cfg.RemoveFirstTimePoints = 10;

    Cfg.TimePoints=tmpTimePoints; % set number of TRs
    Cfg.TR=tmpTR; % set TR
    Cfg.SliceTiming.SliceNumber=tmpSliceNumber; % set number of slices
    
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
    
    Cfg.SliceTiming.ReferenceSlice=tmpReferenceSlice; % set reference slice
    wmthresh=tmpwmthresh; % set white matter mask thresheold

    switch tmpIsNeedConvertDCM2IMG
        case 1
            Cfg.IsNeedConvertFunDCM2IMG = 0;
            Cfg.IsNeedConvertT1DCM2IMG = 0;
        case 2
            Cfg.IsNeedConvertFunDCM2IMG = 1;
            Cfg.IsNeedConvertT1DCM2IMG = 1;
    end
    
    Cfg.IsNeedReorientFunImgInteractively = tmpIsNeedReorientImgInteractively;
    Cfg.IsNeedReorientT1ImgInteractively = tmpIsNeedReorientImgInteractively;
    Cfg.RemoveFirstTimePoints = tmpRemoveFirstTimePoints; 


    %###############################################################%
    save prepro_saved.mat Cfg;
    DPARSFA_run('prepro_saved.mat');
    cd(path1);
    disp('dpabi run success');
    uiwait(msgbox('预处理已完成','提示','help'));

    global ifresult1;
    if ifresult1 == 1
        %% gen matrix
        uiwait(msgbox('corrmatrix开始计算','提示','help'));
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

        % grayMatterTemplate: Brodmann(1) AAL(2)


        switch grayMatterTemplate
        case 1
            nii=load_nii([pwd,'\atlas\Brodmann\Brodmann_YCG_fl.nii']);
        case 2
            nii=load_nii([pwd,'\atlas\AAL\AAL.nii']);
        end
        
        GM=nii.img;
        
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
            
            matr=zeros(length(GM_label),length(Eve_label));
            GM_time=zeros(length(GM_label),Cfg.TimePoints-Cfg.RemoveFirstTimePoints);
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
            
            for j=1:length(GM_label)
                roi=logical(GM==GM_label(j));
                roi=repmat(roi,1,1,1,Cfg.TimePoints-Cfg.RemoveFirstTimePoints);
                tmp=img.*roi;
                tmp=reshape(tmp,181*217*181,Cfg.TimePoints-Cfg.RemoveFirstTimePoints);
                roi=reshape(roi,181*217*181,Cfg.TimePoints-Cfg.RemoveFirstTimePoints);
                GM_time(j,:)=sum(tmp,1)./sum(roi,1);
            end
            
            for j=1:length(Eve_label)
                roi=logical(Eve==Eve_label(j)).*logical(wm>wmthresh);
                roi=repmat(roi,1,1,1,Cfg.TimePoints-Cfg.RemoveFirstTimePoints);
                tmp=img.*roi;
                tmp=reshape(tmp,181*217*181,Cfg.TimePoints-Cfg.RemoveFirstTimePoints);
                roi=reshape(roi,181*217*181,Cfg.TimePoints-Cfg.RemoveFirstTimePoints);
                Eve_time(j,:)=sum(tmp,1)./sum(roi,1);
            end
            
            for j=1:length(GM_label)
                for k=1:length(Eve_label)
                    tmp=corrcoef(GM_time(j,:),Eve_time(k,:));
                    matr(j,k)=tmp(1,2);
                end
            end
            matr=matr';
            matr=mapminmax(matr(:)');
            matr=reshape(matr,length(Eve_label),length(GM_label));
        
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
        
            matr_GG=zeros(length(GM_label),length(GM_label));
            for j=1:length(GM_label)
                for k=1:length(GM_label)
                    tmp=corrcoef(GM_time(j,:),GM_time(k,:));
                    matr_GG(j,k)=tmp(1,2);
                end
            end
            matr_GG=matr_GG';
            matr_GG=mapminmax(matr_GG(:)');
            matr_GG=reshape(matr_GG,length(GM_label),length(GM_label));
        
            save([pwd,'\result1_corrmatrix\matr_',list(i).name,'.mat'],'matr','matr_WW','matr_GG','Eve_time','GM_time');
        end
        list1=list;
        uiwait(msgbox('corrmatrix已完成计算','提示','help'));
    end

    global ifresult2;
    if ifresult2 == 1
        %% gen wm alff
        uiwait(msgbox('alff开始计算','提示','help'));
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
        uiwait(msgbox('alff已完成计算','提示','help'));
    end
    
    global ifresult3;
    if ifresult3 == 1
        %% gen wm falff
        uiwait(msgbox('falff开始计算','提示','help'));
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
        uiwait(msgbox('falff已完成计算','提示','help'));
    end

    global ifresult4;
    if ifresult4 == 1
        %% gen wm reho
        uiwait(msgbox('reho开始计算','提示','help'));
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
        uiwait(msgbox('reho已完成计算','提示','help'));
    end

    global ifresult5;
    if ifresult5 == 1
        %% gen wm degree_centrality
        uiwait(msgbox('degree_centrality开始计算','提示','help'));
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
        uiwait(msgbox('degree_centrality已完成计算','提示','help'));
    end

    end
    disp('main batch success!!');
end


% --- Executes on selection change in GMTemplate.
function GMTemplate_Callback(hObject, eventdata, handles)
% hObject    handle to GMTemplate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns GMTemplate contents as cell array
%        contents{get(hObject,'Value')} returns selected item from GMTemplate
global grayMatterTemplate;
grayMatterTemplate = get(hObject, 'value');


% 清空表格
set(handles.tableROI, 'Data', {});

% 根据选择的模板更新 ROI 表格
switch grayMatterTemplate
    case 1 % Brodmann
        load([pwd,'/atlas/Brodmann/Brodmann_YCG_Labels.mat']);
        ROINames = Reference(:,1);
        ROIValues = cell2mat(Reference(:,2));
        Brd_label = ROIValues([2:2:82,83:-2:3]);
        set(handles.tableROI, 'Data', num2cell(Brd_label), 'ColumnName', {'Value'});
        numLabels = length(Brd_label);
        allLabels = 1:numLabels;
        set(handles.editROILabel, 'String', num2str(allLabels));

    case 2 % AAL
        nii = load_nii([pwd,'/atlas/AAL/AAL.nii']);
        AAL = nii.img;
        uniqueLabels = unique(AAL(AAL > 0));
        numLabels = length(uniqueLabels); 
        set(handles.tableROI, 'Data', num2cell(uniqueLabels), 'ColumnName', {'Value'});
        allLabels = 1:numLabels;
        set(handles.editROILabel, 'String', num2str(allLabels));
end

guidata(hObject, handles);
end

% --- Executes during object creation, after setting all properties.
function GMTemplate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GMTemplate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function tableROI_Callback(hObject, eventdata, handles)
% hObject    handle to tableROI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

end



function editROILabel_Callback(hObject, eventdata, handles)
% hObject    handle to editROILabel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global grayMatterTemplate;
global GM_label;

switch grayMatterTemplate
    case 1 % Brodmann
        load([pwd,'/atlas/Brodmann/Brodmann_YCG_Labels.mat']);
        ROIValues = cell2mat(Reference(:,2));
        Brd_label = ROIValues([2:2:82,83:-2:3]);
        uniqueLabels = 1:length(Brd_label)
        userInputStr = get(hObject,'String');
        userInputStr = strsplit(userInputStr, ' ');
        userInput = str2double(userInputStr);
        GM_label = uniqueLabels(ismember(uniqueLabels, userInput));
        
    case 2 % AAL
        nii = load_nii([pwd,'/atlas/AAL/AAL.nii']);
        AAL = nii.img;
        uniqueLabels = unique(AAL(AAL > 0));
        userInputStr = get(hObject,'String');
        userInputStr = strsplit(userInputStr, ' ');
        userInput = str2double(userInputStr);
        GM_label = uniqueLabels(ismember(uniqueLabels, userInput));
        
end
end

% --- Executes during object creation, after setting all properties.
function editROILabel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editROILabel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
