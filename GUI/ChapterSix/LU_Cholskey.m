function varargout = LU_Cholskey(varargin)
% LU_CHOLSKEY MATLAB code for LU_Cholskey.fig
%      LU_CHOLSKEY, by itself, creates a new LU_CHOLSKEY or raises the existing
%      singleton*.
%
%      H = LU_CHOLSKEY returns the handle to a new LU_CHOLSKEY or the handle to
%      the existing singleton*.
%
%      LU_CHOLSKEY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LU_CHOLSKEY.M with the given input arguments.
%
%      LU_CHOLSKEY('Property','Value',...) creates a new LU_CHOLSKEY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LU_Cholskey_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LU_Cholskey_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LU_Cholskey

% Last Modified by GUIDE v2.5 25-Jan-2013 10:24:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LU_Cholskey_OpeningFcn, ...
                   'gui_OutputFcn',  @LU_Cholskey_OutputFcn, ...
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


% --- Executes just before LU_Cholskey is made visible.
function LU_Cholskey_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LU_Cholskey (see VARARGIN)

% Choose default command line output for LU_Cholskey
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LU_Cholskey wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LU_Cholskey_OutputFcn(hObject, eventdata, handles) 
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
set(handles.uitable2,'data',X);
set(handles.uitable3,'data',L);
set(handles.uitable4,'data',U);


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
