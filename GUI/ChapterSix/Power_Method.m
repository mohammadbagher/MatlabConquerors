function varargout = Eigens(varargin)
% EIGENS MATLAB code for Eigens.fig
%      EIGENS, by itself, creates a new EIGENS or raises the existing
%      singleton*.
%
%      H = EIGENS returns the handle to a new EIGENS or the handle to
%      the existing singleton*.
%
%      EIGENS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EIGENS.M with the given input arguments.
%
%      EIGENS('Property','Value',...) creates a new EIGENS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Eigens_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Eigens_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Eigens

% Last Modified by GUIDE v2.5 25-Jan-2013 11:10:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Eigens_OpeningFcn, ...
                   'gui_OutputFcn',  @Eigens_OutputFcn, ...
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


% --- Executes just before Eigens is made visible.
function Eigens_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Eigens (see VARARGIN)

% Choose default command line output for Eigens
handles.output = hObject;

addpath(genpath('G:\Workspace\Matlab\MatlabConquerors'));


b=repmat({''},3,3);
set(handles.uitable4,'data',b);
b=repmat({''},3,1);
set(handles.uitable16,'data',b);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Eigens wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Eigens_OutputFcn(hObject, eventdata, handles) 
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
close(Power_Method);
FirstPage

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data1=get(handles.uitable4,'Data');
data2=get(handles.uitable16,'Data');
data2(1)
A = [];
for i=1:size(data1,1)
    for j=1:size(data1,1)
        A(i,j)= str2num(cell2mat(data1(i,j)));
    end
end

x0=[];

for i=1:size(data2,1)
        x0(i)= (data2(i));
end
x0
x0=transp(x0)
[X,c]=power_method1(A, x0)

str= strcat( 'Dominant Eigen Value = ',num2str(c));
set(handles.text4,'string',str);
set(handles.uitable15,'data',X);
set(handles.uitable16,'data',X);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
row=get(handles.edit1,'string');
b=repmat({''},str2num(row),str2num(row));
set(handles.uitable4,'data',b);
b=repmat({''},str2num(row),1);
set(handles.uitable16,'data',b);


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
