function varargout = ChapterFourIntegration(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ChapterFourIntegration_OpeningFcn, ...
                   'gui_OutputFcn',  @ChapterFourIntegration_OutputFcn, ...
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


function ChapterFourIntegration_OpeningFcn(hObject, eventdata, handles, varargin)
addpath(genpath('D:\Management\Education+University\Term 5\Numerical Methods\Project Git 2\MatlabConquerors'));
[a,map]=imread('adivb.png');
[r,c,d]=size(a); 
x=ceil(r/45); 
y=ceil(c/15); 
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

handles.output = hObject;

guidata(hObject, handles);


function varargout = ChapterFourIntegration_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


function back_Callback(hObject, eventdata, handles)
close(ChapterFourIntegration);
FirstPage();

function solve_button_Callback(hObject, eventdata, handles)
method_code = get(handles.method, 'Value');
a = get(handles.a, 'String');a=str2double(a);
b = get(handles.b, 'String');b=str2double(b);
horn = get(handles.horn, 'String');horn=str2double(horn);
horn_code = get(handles.hornselect, 'Value');
sigfig = get(handles.sigfig, 'String');sigfig=str2double(sigfig);

func = get(handles.func, 'String');
index = strfind(func,'=');
func = func(index+1:end);
if(size(strtrim(func),1)==0)
    return;
end
func = strcat('@(x)(',func,')');
func = str2func(func);

if(method_code == 1)
    [ calc, exact, err, h, n ] = trapezoidal(func, a, b, horn, horn_code, handles.plot);
end
if(method_code == 2)
    [ calc, exact, err, h, n ] = simpson_1_3(func, a, b, horn, horn_code, handles.plot);
end
if(method_code == 3)
    [ calc, exact, err, h, n ] = simpson_3_8(func, a, b, horn, horn_code, handles.plot);
end
if(method_code == 4)
    p = get(handles.prb, 'String');p=str2double(p);
    [ calc, exact, err, h, n, romberg_table ] = romberg(func, a, b, horn, horn_code, handles.plot, p);
end
if(method_code == 1)
    p = get(handles.pgl, 'String');p=str2double(p);
    [ calc, exact, err, h, n ] = gauss_legendre(func, a, b, horn, horn_code, handles.plot, p);
end
set(handles.calc,'Enable','on');
set(handles.exact,'Enable','on');
set(handles.err,'Enable','on');
set(handles.h,'Enable','on');
set(handles.n,'Enable','on');
set(handles.calc,'String',num2str(calc,sigfig));
set(handles.exact,'String',num2str(exact,sigfig));
set(handles.err,'String',num2str(err,sigfig));
set(handles.h,'String',num2str(h,sigfig));
set(handles.n,'String',num2str(n,sigfig));


function func_Callback(hObject, eventdata, handles)
FuncString=get(handles.func,'string');
cla(handles.tex);
set(handles.tex,'visible','off');
FuncString = strcat(' $$  ',FuncString,'$$');
text1 = text('Interpreter','latex','String',FuncString);
set(text1,'FontName','Courier New','FontSize',20);


function func_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function abtb_Callback(hObject, eventdata, handles)
string = get(handles.func,'string');
string = strcat(string,'*^{*}');
set(handles.func,'string',string);


% --- Executes on button press in adivb.
function adivb_Callback(hObject, eventdata, handles)
% hObject    handle to adivb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
string = get(handles.func,'string');
string = strcat(string,'\frac{*}{*}');
set(handles.func,'string',string);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in method.
function method_Callback(hObject, eventdata, handles)
% hObject    handle to method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns method contents as cell array
%        contents{get(hObject,'Value')} returns selected item from method
method_code = get(handles.method, 'Value');

if(method_code == 5)
    set(handles.pgl,'Enable','on');
end
if(method_code ~= 5)
    set(handles.pgl,'Enable','off');
end
if(method_code == 4)
    set(handles.prb,'Enable','on');
end
if(method_code ~= 4)
    set(handles.prb,'Enable','off');
end

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



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a_Callback(hObject, eventdata, handles)
% hObject    handle to a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a as text
%        str2double(get(hObject,'String')) returns contents of a as a double


% --- Executes during object creation, after setting all properties.
function a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function b_Callback(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of b as text
%        str2double(get(hObject,'String')) returns contents of b as a double


% --- Executes during object creation, after setting all properties.
function b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function accuracy_Callback(hObject, eventdata, handles)
% hObject    handle to accuracy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of accuracy as text
%        str2double(get(hObject,'String')) returns contents of accuracy as a double


% --- Executes during object creation, after setting all properties.
function accuracy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to accuracy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pgl_Callback(hObject, eventdata, handles)
% hObject    handle to pgl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pgl as text
%        str2double(get(hObject,'String')) returns contents of pgl as a double


% --- Executes during object creation, after setting all properties.
function pgl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pgl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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


% --- Executes on selection change in hornselect.
function hornselect_Callback(hObject, eventdata, handles)
% hObject    handle to hornselect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns hornselect contents as cell array
%        contents{get(hObject,'Value')} returns selected item from hornselect


% --- Executes during object creation, after setting all properties.
function hornselect_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hornselect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function horn_Callback(hObject, eventdata, handles)
% hObject    handle to horn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of horn as text
%        str2double(get(hObject,'String')) returns contents of horn as a double


% --- Executes during object creation, after setting all properties.
function horn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to horn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function prb_Callback(hObject, eventdata, handles)
% hObject    handle to prb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of prb as text
%        str2double(get(hObject,'String')) returns contents of prb as a double


% --- Executes during object creation, after setting all properties.
function prb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to prb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function calc_Callback(hObject, eventdata, handles)
% hObject    handle to calc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of calc as text
%        str2double(get(hObject,'String')) returns contents of calc as a double


% --- Executes during object creation, after setting all properties.
function calc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to calc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function exact_Callback(hObject, eventdata, handles)
% hObject    handle to exact (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of exact as text
%        str2double(get(hObject,'String')) returns contents of exact as a double


% --- Executes during object creation, after setting all properties.
function exact_CreateFcn(hObject, eventdata, handles)
% hObject    handle to exact (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function err_Callback(hObject, eventdata, handles)
% hObject    handle to err (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of err as text
%        str2double(get(hObject,'String')) returns contents of err as a double


% --- Executes during object creation, after setting all properties.
function err_CreateFcn(hObject, eventdata, handles)
% hObject    handle to err (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function tex_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate tex



function h_Callback(hObject, eventdata, handles)
% hObject    handle to h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of h as text
%        str2double(get(hObject,'String')) returns contents of h as a double


% --- Executes during object creation, after setting all properties.
function h_CreateFcn(hObject, eventdata, handles)
% hObject    handle to h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function n_Callback(hObject, eventdata, handles)
% hObject    handle to n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n as text
%        str2double(get(hObject,'String')) returns contents of n as a double


% --- Executes during object creation, after setting all properties.
function n_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
