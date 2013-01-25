function varargout = Gausse_elimination(varargin)
% GAUSSE_ELIMINATION MATLAB code for Gausse_elimination.fig
%      GAUSSE_ELIMINATION, by itself, creates a new GAUSSE_ELIMINATION or raises the existing
%      singleton*.
%
%      H = GAUSSE_ELIMINATION returns the handle to a new GAUSSE_ELIMINATION or the handle to
%      the existing singleton*.
%
%      GAUSSE_ELIMINATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAUSSE_ELIMINATION.M with the given input arguments.
%
%      GAUSSE_ELIMINATION('Property','Value',...) creates a new GAUSSE_ELIMINATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Gausse_elimination_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Gausse_elimination_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Gausse_elimination

% Last Modified by GUIDE v2.5 25-Jan-2013 08:32:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Gausse_elimination_OpeningFcn, ...
                   'gui_OutputFcn',  @Gausse_elimination_OutputFcn, ...
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

global step;
global x2;
% --- Executes just before Gausse_elimination is made visible.
function Gausse_elimination_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Gausse_elimination (see VARARGIN)

% Choose default command line output for Gausse_elimination
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Gausse_elimination wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Gausse_elimination_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global step;
step=1;
data=get(handles.uitable7,'data');
n = 0;
for i = 1 : size(data, 1)
    if(size(cell2mat(data(i)), 1) ~= 0)
        n = n + 1;
    end
end
global x2;
[x1, x2]= gausse_elimination(n, data);
set(handles.uitable8,'data',x1);
set(handles.uitable9,'data',x2{step});

% primary_data=repmat({''},size(x,2),2);
% set(handles.uitable5,'data',primary_data);
% 
% matrix=[0 , 0];
% for i=1:size(x,2)
%     matrix(i,1)=x(i);
%     matrix(i,2)=dets(i);
% end
% 
% set(handles.uitable5,'data',matrix);


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data=get(handles.uitable7,'data');
       b=repmat({''},1,2);
       data(size(data,1)+1,1)=b(1);
       data(size(data,1),2)=b(1);
       data(size(data,1)+1,1)=b(1);
       data(size(data,1),2)=b(1);
       data(size(data,1)+1,1)=b(1);
       data(size(data,1),2)=b(1);
       set(handles.uitable7,'Data',data);

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global step;
global x2;
mat=get(handles.uitable8,'data');
matsize=size(mat,1)

step
if step~=matsize
    step=step+1;
    set(handles.uitable9,'data',x2{step});
end

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global step;
global x2;
step
if step>1
    step=step-1;
    set(handles.uitable9,'data',x2{step});
end
