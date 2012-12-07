function varargout = ChapterTow(varargin)
% CHAPTERTOW MATLAB code for ChapterTow.fig
%      CHAPTERTOW, by itself, creates a new CHAPTERTOW or raises the existing
%      singleton*.
%
%      H = CHAPTERTOW returns the handle to a new CHAPTERTOW or the handle to
%      the existing singleton*.
%
%      CHAPTERTOW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAPTERTOW.M with the given input arguments.
%
%      CHAPTERTOW('Property','Value',...) creates a new CHAPTERTOW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ChapterTow_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ChapterTow_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ChapterTow

% Last Modified by GUIDE v2.5 08-Dec-2012 01:53:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ChapterTow_OpeningFcn, ...
                   'gui_OutputFcn',  @ChapterTow_OutputFcn, ...
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


% --- Executes just before ChapterTow is made visible.
function ChapterTow_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ChapterTow (see VARARGIN)

addpath(genpath('G:\Workspace\Matlab\MatlabConquerors'));

%Coloca una imagen en cada bot�n
[a,map]=imread('adivb.png');
[r,c,d]=size(a); 
x=ceil(r/45); 
y=ceil(c/45); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(handles.adivb,'CData',g);

[a,map]=imread('a^b.png');
[r,c,d]=size(a); 
x=ceil(r/40); 
y=ceil(c/40); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(handles.abtb,'CData',g);



% Choose default command line output for ChapterTow
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ChapterTow wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ChapterTow_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
ax=handles.axes2;
FuncString=get(handles.edit1,'string');
cla(ax);
set(handles.axes2,'visible','off');
%text('Interpreter','latex','String','$$\int_0^x\!\int_y dF(u,v)$$'
%text1= text('Interpreter','latex','$$\int_0^x\!\int_y dF(u,v)$$');
%text1=text(0, 0, , 'Parent', );
FuncString = strcat('$$',FuncString,'$$');
text1 = text('Interpreter','latex','String',FuncString);
set(text1,'FontName','Courier New','FontSize',20);

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(ChapterTwo);
FirstPage();


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(handles.ignore, 'Value') ~= 1);
    ChapterTwoAnswer(handles);
end

method_code = get(handles.method, 'Value');
a = get(handles.a, 'String');
b = get(handles.b, 'String');
tol = get(handles.tol, 'String');
max_step = get(handles.max_step, 'String');
 


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
value = get(hObject,'value');
if value==1
    set(handles.text15,'string','Precision :');
else
    set(handles.text15,'string','Steps :');
end



% --- Executes on button press in abtb.
function abtb_Callback(hObject, eventdata, handles)
% hObject    handle to abtb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
string = get(handles.edit1,'string');
string = strcat(string,'*^{*}');
set(handles.edit1,'string',string);

% --- Executes on button press in adivb.
function adivb_Callback(hObject, eventdata, handles)
% hObject    handle to adivb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
string = get(handles.edit1,'string');
string = strcat(string,'\frac{*}{*}');
set(handles.edit1,'string',string);



function sigfig_Callback(hObject, eventdata, handles)
% hObject    handle to sigfig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sigfig as text
%        str2double(get(hObject,'String')) returns contents of sigfig as a double


% --- Executes during object creation, after setting all properties.
function sigfig_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sigfig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in method.
function method_Callback(hObject, eventdata, handles)
% hObject    handle to method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns method contents as cell array
%        contents{get(hObject,'Value')} returns selected item from method


% --- Executes during object creation, after setting all properties.
function method_CreateFcn(hObject, eventdata, handles)
% hObject    handle to method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
