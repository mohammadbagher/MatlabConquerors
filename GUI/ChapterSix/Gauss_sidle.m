function varargout = Crammer(varargin)
% CRAMMER MATLAB code for Crammer.fig
%      CRAMMER, by itself, creates a new CRAMMER or raises the existing
%      singleton*.
%
%      H = CRAMMER returns the handle to a new CRAMMER or the handle to
%      the existing singleton*.
%
%      CRAMMER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CRAMMER.M with the given input arguments.
%
%      CRAMMER('Property','Value',...) creates a new CRAMMER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Crammer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Crammer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Crammer

% Last Modified by GUIDE v2.5 25-Jan-2013 08:11:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Crammer_OpeningFcn, ...
                   'gui_OutputFcn',  @Crammer_OutputFcn, ...
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


% --- Executes just before Crammer is made visible.
function Crammer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Crammer (see VARARGIN)

b=repmat({''},3,1);
       set(handles.uitable3,'Data',b);
% Choose default command line output for Crammer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Crammer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Crammer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on button press in togglebutton2.
function togglebutton2_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton2


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(Gauss_sidle);
main

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data=get(handles.uitable3,'data');
       b=repmat({''},1,2);
       data(size(data,1)+1,1)=b(1);
       data(size(data,1),2)=b(1);
       data(size(data,1)+1,1)=b(1);
       data(size(data,1),2)=b(1);
       data(size(data,1)+1,1)=b(1);
       data(size(data,1),2)=b(1);
       set(handles.uitable3,'Data',data);

% --- Executes on selection change in method1.
function method1_Callback(hObject, eventdata, handles)
% hObject    handle to method1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
method_code = get(handles.method1, 'Value');

if method_code==5
    set(handles.uipanel16,'visible','on');
    set(handles.method2,'visible','on');
else
    set(handles.uipanel16,'visible','off');
    set(handles.method2,'visible','off');
end

if method_code==9||method_code==10
    set(handles.uipanel15,'visible','on');
    set(handles.uipanel9,'visible','on');
    set(handles.edit17,'visible','on');
else
    set(handles.uipanel15,'visible','off');
    set(handles.uipanel9,'visible','off');
    set(handles.edit17,'visible','off');
end

if method_code==2
    set(handles.uipanel14, 'visible' , 'on');
else
    set(handles.uipanel14, 'visible' , 'off');
end


%Please select Method of Computing
%Cramer
%Gausse Elimination
%LU Doolittle
%LU Cholesky
%LU Crout
%Jacobi
%Gauss Sidle
method_code = get(handles.method1, 'Value');

if method_code==1
    set(handles.text13,'string','Not Selected Yet');
elseif method_code==2    
    set(handles.text13,'string','Cramer Method');
elseif method_code==3
    set(handles.text13,'string','Gausse Elimination Method');
elseif method_code==4
    set(handles.text13,'string','LU Doolittle Method');
elseif method_code==5
    set(handles.text13,'string','LU Cholesky Method');
elseif method_code==6
    set(handles.text13,'string','Jacobi Method');
elseif method_code==7
    set(handles.text13,'string','Gauss Sidle Method');
end
% Hints: contents = cellstr(get(hObject,'String')) returns method1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from method1


% --- Executes during object creation, after setting all properties.
function method1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to method1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in method2.
function method2_Callback(hObject, eventdata, handles)
% hObject    handle to method2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if method_code==1
    set(handles.text13,'string','Not Selected Yet');
elseif method_code==2    
    set(handles.text13,'string','Eigenvalues and Eigenvectors');
elseif method_code==3
    set(handles.text13,'string','Power Method');
end
% Hints: contents = cellstr(get(hObject,'String')) returns method2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from method2


% --- Executes during object creation, after setting all properties.
function method2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to method2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in togglebutton3.
function togglebutton3_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
value=get(hObject,'value');
if(value==1)
    set(handles.togglebutton3,'string','Change To Finding Eigenvalues and Eigenvectors');
    set(handles.method1,'visible','on');
    set(handles.method2,'visible','off');
else
    set(handles.togglebutton3,'string','Change To Solving System Of Equations');
    set(handles.method2,'visible','on');
    set(handles.method1,'visible','off');
end
% Hint: get(hObject,'Value') returns toggle state of togglebutton3


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data=get(handles.uitable3,'data');
n = 0;
for i = 1 : size(data, 1)
    %size(cell2mat(data(i)), 1)
    if(size(cell2mat(data(i)), 1) ~= 0)
        n = n + 1;
    end
end
[x, dets]= cramer(n, data);

primary_data=repmat({''},size(x,2),2);
set(handles.uitable5,'data',primary_data);

matrix=[0 , 0];
for i=1:size(x,2)
    matrix(i,1)=x(i);
    matrix(i,2)=dets(i);
end

set(handles.uitable5,'data',matrix);
