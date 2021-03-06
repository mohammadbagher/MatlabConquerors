function varargout = ChapterFive(varargin)
% CHAPTERFIVE MATLAB code for ChapterFive.fig
%      CHAPTERFIVE, by itself, creates a new CHAPTERFIVE or raises the existing
%      singleton*.
%
%      H = CHAPTERFIVE returns the handle to a new CHAPTERFIVE or the handle to
%      the existing singleton*.
%
%      CHAPTERFIVE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAPTERFIVE.M with the given input arguments.
%
%      CHAPTERFIVE('Property','Value',...) creates a new CHAPTERFIVE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ChapterFive_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ChapterFive_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ChapterFive

% Last Modified by GUIDE v2.5 24-Jan-2013 14:26:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ChapterFive_OpeningFcn, ...
                   'gui_OutputFcn',  @ChapterFive_OutputFcn, ...
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


% --- Executes just before ChapterFive is made visible.
function ChapterFive_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ChapterFive (see VARARGIN)
position=get(handles.uipanel15,'position');
set(handles.uipanel14,'Position',position);
% Choose default command line output for ChapterFive
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ChapterFive wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ChapterFive_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(ChapterFive);
FirstPage;
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ax=handles.axes1;
FuncString=get(handles.edit1,'string');
cla(ax);
set(handles.axes1,'visible','off');
text1=text(0, 0, FuncString, 'Parent', ax);
set(text1,'FontName','Courier New','FontSize',15);

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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
method_code = get(handles.method1, 'Value');
    func1=get(handles.edit1,'string');
    func1=func1(7:end);
    %strcat('"',func1,'"');
    
    func2=get(handles.edit17,'string');
    func2=func2(7:end);
    
    h=get(handles.edit8,'string');
    h=str2num(h);
    
    x0=get(handles.edit15,'string');
    x0=str2num(x0);
    
    y0=get(handles.edit13,'string');
    y0=str2num(y0);
    
    steps=get(handles.edit23,'string');
    steps=str2num(steps);
    
    z0=get(handles.edit16,'string');
    z0=str2num(z0);
    
    x_req=get(handles.edit26,'string');
    x_req=str2num(x_req);
    
    rung_a=get(handles.edit9,'string');
    rung_a=str2num(rung_a);


if method_code==2
    ans=Taylor( func1 , x0 ,y0 , h ,steps ,x_req);
    set(handles.uitable2,'data',ans);
elseif method_code==3
    ans=Euler(func1 , x0 , y0 , h ,x_req );
    set(handles.uitable2,'data',ans);
elseif method_code==4
    ans=Modified_Euler( func1 , x0 ,y0 , h ,x_req );
    set(handles.uitable2,'data',ans);
elseif method_code==5
    method2 = get(handles.method2, 'Value');
    if method2==2
        ans=Runge_kutta( func1 , x0 ,y0 , h ,x_req,0 );
        set(handles.uitable2,'data',ans);
    elseif method2==3
        ans=Runge_kutta( func1 , x0 ,y0 , h ,x_req,0.25 );
        set(handles.uitable2,'data',ans);
    elseif method2==4
        ans=Runge_kutta( func1 , x0 ,y0 , h ,x_req,0.5 );
        set(handles.uitable2,'data',ans);
    elseif method2==5
        ans=Runge_kutta( func1 , x0 ,y0 , h ,x_req,rung_a );
        set(handles.uitable2,'data',ans);
    end
elseif method_code==6
    ans=Rung_Kuttaorder3( func1,x0,y0,h,x_req );
    set(handles.uitable2,'data',ans);
elseif method_code==7
    ans=Runge_Kuttaorder4(func1,x0,y0,h,x_req );
    set(handles.uitable2,'data',ans);
elseif method_code==8
    ans=Adams_Multon(func1,x0,y0,h,x_req);
    set(handles.uitable2,'data',ans);
elseif method_code==9
    ans=DE_Euler( func1,x0,x0,func2,z0,h,x_req );
    set(handles.uitable2,'data',ans);
elseif method_code==10
    ans=DE_Runge_kutta4th( func1,x0,x0,func2,z0,h,x_req );
    set(handles.uitable2,'data',ans);
end


function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in method1.
function method1_Callback(hObject, eventdata, handles)
% hObject    handle to method1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
method_code = get(handles.method1, 'Value')

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


if method_code==1
    set(handles.text14,'string','Not Selected Yet');
elseif method_code==2    
    set(handles.text14,'string','Taylor Method');
elseif method_code==3
    set(handles.text14,'string','Euler Method');
elseif method_code==4
    set(handles.text14,'string','Modifed Euler Method');
elseif method_code==5
    set(handles.text14,'string','Not Selected Yet');
elseif method_code==6
    set(handles.text14,'string','Runge-kutta-3rd Order Method');
elseif method_code==7
    set(handles.text14,'string','Runge-kutta-4rd Order Method');
elseif method_code==8
    set(handles.text14,'string','Adams-Multon Method');
elseif method_code==9
    set(handles.text14,'string','2nd order D.E By Euler method Method');
elseif method_code==10
    set(handles.text14,'string','2nd order D.E 4th order Runge-Kutta Method');
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


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in method2.
function method2_Callback(hObject, eventdata, handles)
% hObject    handle to method2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
method_code = get(handles.method2, 'Value');

if method_code==5
    set(handles.uipanel16,'visible','on');
else
    set(handles.uipanel16,'visible','off');
end



if method_code==1
    set(handles.text14,'string','Not Selected Yet');
elseif method_code==2
    set(handles.text14,'string','Runge-kutta-2nd Order: Midpoint');
elseif method_code==3
    set(handles.text14,'string','Runge-kutta-2nd Order: Henun');
elseif method_code==4
    set(handles.text14,'string','Runge-kutta-2nd Order: Modified Euler');
elseif method_code==5
    set(handles.text14,'string','Runge-kutta-2nd Order: With a , b');
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



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


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


% --- Executes on key press with focus on method1 and none of its controls.
function method1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to method1 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ax=handles.axes3;
FuncString=get(handles.edit17,'string');
cla(ax);
set(handles.axes3,'visible','off');
text1=text(0, 0, FuncString, 'Parent', ax);
set(text1,'FontName','Courier New','FontSize',15);

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit23_Callback(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit23 as text
%        str2double(get(hObject,'String')) returns contents of edit23 as a double


% --- Executes during object creation, after setting all properties.
function edit23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit26_Callback(hObject, eventdata, handles)
% hObject    handle to edit26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit26 as text
%        str2double(get(hObject,'String')) returns contents of edit26 as a double


% --- Executes during object creation, after setting all properties.
function edit26_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
