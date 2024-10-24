function varargout = paramter_check(varargin)
% PARAMTER_CHECK MATLAB code for paramter_check.fig
%      PARAMTER_CHECK, by itself, creates a new PARAMTER_CHECK or raises the existing
%      singleton*.
%
%      H = PARAMTER_CHECK returns the handle to a new PARAMTER_CHECK or the handle to
%      the existing singleton*.
%
%      PARAMTER_CHECK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PARAMTER_CHECK.M with the given input arguments.
%
%      PARAMTER_CHECK('Property','Value',...) creates a new PARAMTER_CHECK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before paramter_check_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to paramter_check_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help paramter_check

% Last Modified by GUIDE v2.5 20-Jul-2024 14:14:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @paramter_check_OpeningFcn, ...
                   'gui_OutputFcn',  @paramter_check_OutputFcn, ...
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


% --- Executes just before paramter_check is made visible.
function paramter_check_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to paramter_check (see VARARGIN)

% Choose default command line output for paramter_check
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes paramter_check wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = paramter_check_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global tmpSystem;
tmpSystem=1;
% --- Executes on selection change in system.
function system_Callback(hObject, eventdata, handles)
% hObject    handle to system (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns system contents as cell array
%        contents{get(hObject,'Value')} returns selected item from system
global tmpSystem;
tmpSystem = get(hObject, 'value');


% --- Executes during object creation, after setting all properties.
function system_CreateFcn(hObject, eventdata, handles)
% hObject    handle to system (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tmpSystem;
TR_slicenumber_timepointsnumber
set(handles.text4,'String',parameter_TR)
set(handles.text5,'String',parameter_slicenumber)
set(handles.text6,'String',parameter_timepoints)
set(handles.text7,'String',strcat(string(total)," files in total."))
switch tmpSystem
    case 1
        wm_for_Windows
    case 2
        wm_for_Linux
end
       
