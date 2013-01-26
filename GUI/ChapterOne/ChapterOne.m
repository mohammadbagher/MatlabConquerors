function varargout = ChapterOne(varargin)
% CHAPTERONE MATLAB code for ChapterOne.fig
%      CHAPTERONE, by itself, creates a new CHAPTERONE or raises the existing
%      singleton*.
%
%      H = CHAPTERONE returns the handle to a new CHAPTERONE or the handle to
%      the existing singleton*.
%
%      CHAPTERONE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAPTERONE.M with the given input arguments.
%
%      CHAPTERONE('Property','Value',...) creates a new CHAPTERONE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ChapterOne_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ChapterOne_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ChapterOne

% Last Modified by GUIDE v2.5 09-Dec-2012 00:22:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ChapterOne_OpeningFcn, ...
                   'gui_OutputFcn',  @ChapterOne_OutputFcn, ...
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


% --- Executes just before ChapterOne is made visible.
function ChapterOne_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ChapterOne (see VARARGIN)

addpath(genpath('G:\Workspace\Matlab\MatlabConquerors'));


[a,map]=imread('adivb.png');
[r,c,d]=size(a); 
x=ceil(r/40); 
y=ceil(c/40); 
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

[a,map]=imread('backbut.png');
[r,c,d]=size(a); 
x=ceil(r/60); 
y=ceil(c/160); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(handles.back,'CData',g);
% Choose default command line output for ChapterOne
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ChapterOne wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ChapterOne_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
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
str= get(hObject,'string');
str=str(6:size(str,2));
variables=getVariables(str);
primary_data=repmat({''},size(variables,2),3);
set(handles.uitable1,'data',primary_data);

 for i=1:size(variables,2)
     primary_data(i,1)=variables(i);
 end
set(handles.uitable1,'data',primary_data);

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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

str=get(handles.edit3,'string');
vars=getVariables(str);
interytable=get(handles.uitable1,'data');
exactValues=interytable(:,2);
absolutErrors=interytable(:,3);
exactValues=exactValues';
absolutErrors=absolutErrors';

n=size(exactValues,2);
sendingvalues=0;
sendingerrors=0;
for j=1:n
    tempError=str2num(absolutErrors{j});
    tempValue=str2num(exactValues{j});
    sendingvalues(j)=tempError;
    sendingerrors(j)=tempValue;
end
finaltable=evaluate(str,vars,sendingvalues,sendingerrors);
set(handles.uitable2,'data',finaltable{1});
for i=2:size(finaltable,2)
data = get(handles.uitable2,'data');
newRowdata = cat(1,data,finaltable{i});
set(handles.uitable2,'data',newRowdata);  
end






% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(ChapterOne);
FirstPage();


function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
ax=handles.axes3;
FuncString=get(hObject,'string');
FuncStringNormal=translate(FuncString);
cla(ax);
set(handles.axes3,'visible','off');
%text('Interpreter','latex','String','$$\int_0^x\!\int_y dF(u,v)$$'
%text1= text('Interpreter','latex','$$\int_0^x\!\int_y dF(u,v)$$');
%text1=text(0, 0, , 'Parent', );
laTexFuncString = strcat('$$',FuncString,'$$');
text1 = text('Interpreter','latex','String',laTexFuncString);
set(text1,'FontName','Courier New','FontSize',20);

str=FuncStringNormal;
variables=getVariables(str);
primary_data=repmat({''},size(variables,2),3);
set(handles.uitable1,'data',primary_data);

 for i=1:size(variables,2)
     primary_data(i,1)=variables(i);
 end
set(handles.uitable1,'data',primary_data);

%fa vaghaa ma vaghaa!!

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in adivb.
function adivb_Callback(hObject, eventdata, handles)
% hObject    handle to adivb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
string = get(handles.edit3,'string');
string = strcat(string,'\frac{*}{*}');
set(handles.edit3,'string',string);


% --- Executes on button press in abtb.
function abtb_Callback(hObject, eventdata, handles)
% hObject    handle to abtb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
string = get(handles.edit3,'string');
string = strcat(string,'*^{*}');
set(handles.edit3,'string',string);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str= get(handles.edit3,'string');
variables=getVariables(str);
primary_data=repmat({''},size(variables,2),3);
set(handles.uitable1,'data',primary_data);

 for i=1:size(variables,2)
     primary_data(i,1)=variables(i);
 end
set(handles.uitable1,'data',primary_data);
