function varargout = LU_Doolittle(varargin)
% LU_DOOLITTLE MATLAB code for LU_Doolittle.fig
%      LU_DOOLITTLE, by itself, creates a new LU_DOOLITTLE or raises the existing
%      singleton*.
%
%      H = LU_DOOLITTLE returns the handle to a new LU_DOOLITTLE or the handle to
%      the existing singleton*.
%
%      LU_DOOLITTLE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LU_DOOLITTLE.M with the given input arguments.
%
%      LU_DOOLITTLE('Property','Value',...) creates a new LU_DOOLITTLE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LU_Doolittle_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LU_Doolittle_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LU_Doolittle

% Last Modified by GUIDE v2.5 25-Jan-2013 10:14:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LU_Doolittle_OpeningFcn, ...
                   'gui_OutputFcn',  @LU_Doolittle_OutputFcn, ...
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


% --- Executes just before LU_Doolittle is made visible.
function LU_Doolittle_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LU_Doolittle (see VARARGIN)

% Choose default command line output for LU_Doolittle
handles.output = hObject;

 addpath(genpath('G:\Workspace\Matlab\MatlabConquerors'));
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LU_Doolittle wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LU_Doolittle_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(LU_Doolittle);
FirstPage

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data=get(handles.uitable1,'data');
n = 0;
for i = 1 : size(data, 1)
    if(size(cell2mat(data(i)), 1) ~= 0)
        n = n + 1;
    end
end
[X, L, U] = doolittle(n, data);
set(handles.uitable3,'data',X);
set(handles.uitable4,'data',L);
set(handles.uitable5,'data',U);


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data=get(handles.uitable1,'data');
       b=repmat({''},1,2);
       data(size(data,1)+1,1)=b(1);
       data(size(data,1),2)=b(1);
       data(size(data,1)+1,1)=b(1);
       data(size(data,1),2)=b(1);
       data(size(data,1)+1,1)=b(1);
       data(size(data,1),2)=b(1);
       set(handles.uitable1,'Data',data);
