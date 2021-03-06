function varargout = ChapterFourDiff(varargin)
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

handles.output = hObject;

guidata(hObject, handles);


function varargout = ChapterFourIntegration_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


function back_Callback(hObject, eventdata, handles)
close(ChapterFourDiff);
FirstPage();

function solve_button_Callback(hObject, eventdata, handles)
h1 = get(handles.h1, 'String');h1=str2double(h1);
x0= get(handles.x0, 'String');x0=str2double(x0);

info1 = zeros(7,1);

if(get(handles.sel_1,'Value') ~= 0)%avvali ra feshar dade
    func = get(handles.func, 'String');
    index = strfind(func,'=');
    func = func(index+1:end);
    if(size(strtrim(func),1)==0)
        return;
    end
    func = strcat('@(x)(',func,')');
    func = str2func(func);
    info1(1,1) = feval(func, x0);
    info1(2,1) = feval(func, x0+h1);
    info1(3,1) = feval(func, x0+2*h1);
    info1(4,1) = feval(func, x0+3*h1);
    info1(5,1) = feval(func, x0-h1);
    info1(6,1) = feval(func, x0-2*h1);
    info1(7,1) = feval(func, x0-3*h1);
else
    info1(1,1) = str2double(get(handles.f1,'String'));
    info1(2,1) = str2double(get(handles.f2,'String'));
    info1(3,1) = str2double(get(handles.f3,'String'));
    info1(4,1) = str2double(get(handles.f4,'String'));
    info1(5,1) = str2double(get(handles.f5,'String'));
    info1(6,1) = str2double(get(handles.f6,'String'));
    info1(7,1) = str2double(get(handles.f7,'String'));
end
set(handles.r111,'Enable','on');
set(handles.r112,'Enable','on');
set(handles.r113,'Enable','on');
set(handles.r114,'Enable','on');
set(handles.r121,'Enable','on');
set(handles.r122,'Enable','on');
set(handles.r123,'Enable','on');
set(handles.r124,'Enable','on');
set(handles.r131,'Enable','on');
[ r111, r112, r113, r114, r121, r122, r123, r124, r131 ] = differentiate(x0, h1, info1);

set(handles.r111,'String',r111);
set(handles.r112,'String',r112);
set(handles.r113,'String',r113);
set(handles.r114,'String',r114);
set(handles.r121,'String',r121);
set(handles.r122,'String',r122);
set(handles.r123,'String',r123);
set(handles.r124,'String',r124);
set(handles.r131,'String',r131);
diff_plot(func,h1,x0,r121,handles.axes4);
if(get(handles.ure_1,'Value') ~= 0)
    h2 = get(handles.h2, 'String');h2=str2double(h2);
    info2 = zeros(7,1);
    if(get(handles.sel_1,'Value') ~= 0)%avvali ra feshar dade
        info2(1,1) = feval(func, x0);
        info2(2,1) = feval(func, x0+h2);
        info2(3,1) = feval(func, x0+2*h2);
        info2(4,1) = feval(func, x0+3*h2);
        info2(5,1) = feval(func, x0-h2);
        info2(6,1) = feval(func, x0-2*h2);
        info2(7,1) = feval(func, x0-3*h2);
    else
        info2(1,1) = str2double(get(handles.g1,'String'));
        info2(2,1) = str2double(get(handles.g2,'String'));
        info2(3,1) = str2double(get(handles.g3,'String'));
        info2(4,1) = str2double(get(handles.g4,'String'));
        info2(5,1) = str2double(get(handles.g5,'String'));
        info2(6,1) = str2double(get(handles.g6,'String'));
        info2(7,1) = str2double(get(handles.g7,'String'));
    end
    set(handles.r211,'Enable','on');
    set(handles.r212,'Enable','on');
    set(handles.r213,'Enable','on');
    set(handles.r214,'Enable','on');
    set(handles.r221,'Enable','on');
    set(handles.r222,'Enable','on');
    set(handles.r223,'Enable','on');
    set(handles.r224,'Enable','on');
    set(handles.r231,'Enable','on');
    set(handles.r311,'Enable','on');
    set(handles.r312,'Enable','on');
    set(handles.r313,'Enable','on');
    set(handles.r314,'Enable','on');
    set(handles.r321,'Enable','on');
    set(handles.r322,'Enable','on');
    set(handles.r323,'Enable','on');
    set(handles.r324,'Enable','on');
    set(handles.r331,'Enable','on');
    [ r211, r212, r213, r214, r221, r222, r223, r224, r231 ] = differentiate(x0, h2, info2);
    set(handles.r211,'String',r211);
    set(handles.r212,'String',r212);
    set(handles.r213,'String',r213);
    set(handles.r214,'String',r214);
    set(handles.r221,'String',r221);
    set(handles.r222,'String',r222);
    set(handles.r223,'String',r223);
    set(handles.r224,'String',r224);
    set(handles.r231,'String',r231);

    set(handles.r311,'String',RE(h1, h2, r111, r211, 2));
    set(handles.r312,'String',RE(h1, h2, r112, r212, 2));
    set(handles.r313,'String',RE(h1, h2, r113, r213, 2));
    set(handles.r314,'String',RE(h1, h2, r114, r214, 2));
    set(handles.r321,'String',RE(h1, h2, r121, r221, 2));
    set(handles.r322,'String',RE(h1, h2, r122, r222, 2));
    set(handles.r323,'String',RE(h1, h2, r123, r223, 2));
    set(handles.r324,'String',RE(h1, h2, r124, r224, 2));
    set(handles.r331,'String',RE(h1, h2, r131, r231, 2));

end










% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in method.
function method_Callback(hObject, eventdata, handles)
% hObject    handle to method (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
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
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as h1 double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function h1_Callback(hObject, eventdata, handles)
% hObject    handle to h1 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of h1 as text
%        str2double(get(hObject,'String')) returns contents of h1 as h1 double


% --- Executes during object creation, after setting all properties.
function h1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to h1 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function b_Callback(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of b as text
%        str2double(get(hObject,'String')) returns contents of b as h1 double


% --- Executes during object creation, after setting all properties.
function b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function accuracy_Callback(hObject, eventdata, handles)
% hObject    handle to accuracy (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of accuracy as text
%        str2double(get(hObject,'String')) returns contents of accuracy as h1 double


% --- Executes during object creation, after setting all properties.
function accuracy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to accuracy (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pgl_Callback(hObject, eventdata, handles)
% hObject    handle to pgl (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pgl as text
%        str2double(get(hObject,'String')) returns contents of pgl as h1 double


% --- Executes during object creation, after setting all properties.
function pgl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pgl (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as h1 double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sigfig_Callback(hObject, eventdata, handles)
% hObject    handle to sigfig (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sigfig as text
%        str2double(get(hObject,'String')) returns contents of sigfig as h1 double


% --- Executes during object creation, after setting all properties.
function sigfig_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sigfig (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in hornselect.
function hornselect_Callback(hObject, eventdata, handles)
% hObject    handle to hornselect (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns hornselect contents as cell array
%        contents{get(hObject,'Value')} returns selected item from hornselect


% --- Executes during object creation, after setting all properties.
function hornselect_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hornselect (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function horn_Callback(hObject, eventdata, handles)
% hObject    handle to horn (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of horn as text
%        str2double(get(hObject,'String')) returns contents of horn as h1 double


% --- Executes during object creation, after setting all properties.
function horn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to horn (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function prb_Callback(hObject, eventdata, handles)
% hObject    handle to prb (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of prb as text
%        str2double(get(hObject,'String')) returns contents of prb as h1 double


% --- Executes during object creation, after setting all properties.
function prb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to prb (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function calc_Callback(hObject, eventdata, handles)
% hObject    handle to calc (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of calc as text
%        str2double(get(hObject,'String')) returns contents of calc as h1 double


% --- Executes during object creation, after setting all properties.
function calc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to calc (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function exact_Callback(hObject, eventdata, handles)
% hObject    handle to exact (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of exact as text
%        str2double(get(hObject,'String')) returns contents of exact as h1 double


% --- Executes during object creation, after setting all properties.
function exact_CreateFcn(hObject, eventdata, handles)
% hObject    handle to exact (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function err_Callback(hObject, eventdata, handles)
% hObject    handle to err (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of err as text
%        str2double(get(hObject,'String')) returns contents of err as h1 double


% --- Executes during object creation, after setting all properties.
function err_CreateFcn(hObject, eventdata, handles)
% hObject    handle to err (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function tex_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tex (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate tex



function h_Callback(hObject, eventdata, handles)
% hObject    handle to h (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of h as text
%        str2double(get(hObject,'String')) returns contents of h as h1 double


% --- Executes during object creation, after setting all properties.
function h_CreateFcn(hObject, eventdata, handles)
% hObject    handle to h (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function n_Callback(hObject, eventdata, handles)
% hObject    handle to n (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n as text
%        str2double(get(hObject,'String')) returns contents of n as h1 double


% --- Executes during object creation, after setting all properties.
function n_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2



function f1_Callback(hObject, eventdata, handles)
% hObject    handle to f1 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of f1 as text
%        str2double(get(hObject,'String')) returns contents of f1 as h1 double


% --- Executes during object creation, after setting all properties.
function f1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f1 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function f2_Callback(hObject, eventdata, handles)
% hObject    handle to f2 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of f2 as text
%        str2double(get(hObject,'String')) returns contents of f2 as h1 double


% --- Executes during object creation, after setting all properties.
function f2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f2 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function f5_Callback(hObject, eventdata, handles)
% hObject    handle to f5 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of f5 as text
%        str2double(get(hObject,'String')) returns contents of f5 as h1 double


% --- Executes during object creation, after setting all properties.
function f5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f5 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function f3_Callback(hObject, eventdata, handles)
% hObject    handle to f3 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of f3 as text
%        str2double(get(hObject,'String')) returns contents of f3 as h1 double


% --- Executes during object creation, after setting all properties.
function f3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f3 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function f6_Callback(hObject, eventdata, handles)
% hObject    handle to f6 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of f6 as text
%        str2double(get(hObject,'String')) returns contents of f6 as h1 double


% --- Executes during object creation, after setting all properties.
function f6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f6 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function f4_Callback(hObject, eventdata, handles)
% hObject    handle to f4 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of f4 as text
%        str2double(get(hObject,'String')) returns contents of f4 as h1 double


% --- Executes during object creation, after setting all properties.
function f4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f4 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function f7_Callback(hObject, eventdata, handles)
% hObject    handle to f7 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of f7 as text
%        str2double(get(hObject,'String')) returns contents of f7 as h1 double


% --- Executes during object creation, after setting all properties.
function f7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f7 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit51_Callback(hObject, eventdata, handles)
% hObject    handle to edit51 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit51 as text
%        str2double(get(hObject,'String')) returns contents of edit51 as h1 double


% --- Executes during object creation, after setting all properties.
function edit51_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit51 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit52_Callback(hObject, eventdata, handles)
% hObject    handle to edit52 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit52 as text
%        str2double(get(hObject,'String')) returns contents of edit52 as h1 double


% --- Executes during object creation, after setting all properties.
function edit52_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit52 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit53_Callback(hObject, eventdata, handles)
% hObject    handle to edit53 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit53 as text
%        str2double(get(hObject,'String')) returns contents of edit53 as h1 double


% --- Executes during object creation, after setting all properties.
function edit53_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit53 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit54_Callback(hObject, eventdata, handles)
% hObject    handle to edit54 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit54 as text
%        str2double(get(hObject,'String')) returns contents of edit54 as h1 double


% --- Executes during object creation, after setting all properties.
function edit54_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit54 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit55_Callback(hObject, eventdata, handles)
% hObject    handle to edit55 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit55 as text
%        str2double(get(hObject,'String')) returns contents of edit55 as h1 double


% --- Executes during object creation, after setting all properties.
function edit55_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit55 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit56_Callback(hObject, eventdata, handles)
% hObject    handle to edit56 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit56 as text
%        str2double(get(hObject,'String')) returns contents of edit56 as h1 double


% --- Executes during object creation, after setting all properties.
function edit56_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit56 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit57_Callback(hObject, eventdata, handles)
% hObject    handle to edit57 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit57 as text
%        str2double(get(hObject,'String')) returns contents of edit57 as h1 double


% --- Executes during object creation, after setting all properties.
function edit57_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit57 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit58_Callback(hObject, eventdata, handles)
% hObject    handle to edit58 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit58 as text
%        str2double(get(hObject,'String')) returns contents of edit58 as h1 double


% --- Executes during object creation, after setting all properties.
function edit58_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit58 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ure_1.
function ure_1_Callback(hObject, eventdata, handles)
% hObject    handle to ure_1 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ure_1
if(get(handles.ure_1,'Value') ~= 0)
    set(handles.h2,'Enable','on');
    if(get(handles.sel_1,'Value') == 0)%dovvomi ra feshar midahad!
        set(handles.g1,'Enable','on');
        set(handles.g2,'Enable','on');
        set(handles.g3,'Enable','on');
        set(handles.g4,'Enable','on');
        set(handles.g5,'Enable','on');
        set(handles.g6,'Enable','on');
        set(handles.g7,'Enable','on');
    end

end
if(get(handles.ure_1,'Value') == 0)
    set(handles.h2,'Enable','off');   
    if(get(handles.sel_1,'Value') == 0)%dovvomi ra feshar midahad!
        set(handles.g1,'Enable','off');
        set(handles.g2,'Enable','off');
        set(handles.g3,'Enable','off');
        set(handles.g4,'Enable','off');
        set(handles.g5,'Enable','off');
        set(handles.g6,'Enable','off');
        set(handles.g7,'Enable','off');
    end
end



function g7_Callback(hObject, eventdata, handles)
% hObject    handle to g7 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of g7 as text
%        str2double(get(hObject,'String')) returns contents of g7 as h1 double


% --- Executes during object creation, after setting all properties.
function g7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to g7 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function g4_Callback(hObject, eventdata, handles)
% hObject    handle to g4 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of g4 as text
%        str2double(get(hObject,'String')) returns contents of g4 as h1 double


% --- Executes during object creation, after setting all properties.
function g4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to g4 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function g6_Callback(hObject, eventdata, handles)
% hObject    handle to g6 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of g6 as text
%        str2double(get(hObject,'String')) returns contents of g6 as h1 double


% --- Executes during object creation, after setting all properties.
function g6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to g6 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function g3_Callback(hObject, eventdata, handles)
% hObject    handle to g3 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of g3 as text
%        str2double(get(hObject,'String')) returns contents of g3 as h1 double


% --- Executes during object creation, after setting all properties.
function g3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to g3 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function g5_Callback(hObject, eventdata, handles)
% hObject    handle to g5 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of g5 as text
%        str2double(get(hObject,'String')) returns contents of g5 as h1 double


% --- Executes during object creation, after setting all properties.
function g5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to g5 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function g2_Callback(hObject, eventdata, handles)
% hObject    handle to g2 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of g2 as text
%        str2double(get(hObject,'String')) returns contents of g2 as h1 double


% --- Executes during object creation, after setting all properties.
function g2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to g2 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function g1_Callback(hObject, eventdata, handles)
% hObject    handle to g1 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of g1 as text
%        str2double(get(hObject,'String')) returns contents of g1 as h1 double


% --- Executes during object creation, after setting all properties.
function g1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to g1 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function h2_Callback(hObject, eventdata, handles)
% hObject    handle to h2 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of h2 as text
%        str2double(get(hObject,'String')) returns contents of h2 as h1 double


% --- Executes during object creation, after setting all properties.
function h2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to h2 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r111_Callback(hObject, eventdata, handles)
% hObject    handle to r111 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r111 as text
%        str2double(get(hObject,'String')) returns contents of r111 as h1 double


% --- Executes during object creation, after setting all properties.
function r111_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r111 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r112_Callback(hObject, eventdata, handles)
% hObject    handle to r112 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r112 as text
%        str2double(get(hObject,'String')) returns contents of r112 as h1 double


% --- Executes during object creation, after setting all properties.
function r112_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r112 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r113_Callback(hObject, eventdata, handles)
% hObject    handle to r113 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r113 as text
%        str2double(get(hObject,'String')) returns contents of r113 as h1 double


% --- Executes during object creation, after setting all properties.
function r113_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r113 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r114_Callback(hObject, eventdata, handles)
% hObject    handle to r114 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r114 as text
%        str2double(get(hObject,'String')) returns contents of r114 as h1 double


% --- Executes during object creation, after setting all properties.
function r114_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r114 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ure_2.
function ure_2_Callback(hObject, eventdata, handles)
% hObject    handle to ure_2 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ure_2



function edit74_Callback(hObject, eventdata, handles)
% hObject    handle to edit74 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit74 as text
%        str2double(get(hObject,'String')) returns contents of edit74 as h1 double


% --- Executes during object creation, after setting all properties.
function edit74_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit74 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit73_Callback(hObject, eventdata, handles)
% hObject    handle to edit73 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit73 as text
%        str2double(get(hObject,'String')) returns contents of edit73 as h1 double


% --- Executes during object creation, after setting all properties.
function edit73_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit73 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit72_Callback(hObject, eventdata, handles)
% hObject    handle to edit72 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit72 as text
%        str2double(get(hObject,'String')) returns contents of edit72 as h1 double


% --- Executes during object creation, after setting all properties.
function edit72_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit72 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit71_Callback(hObject, eventdata, handles)
% hObject    handle to edit71 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit71 as text
%        str2double(get(hObject,'String')) returns contents of edit71 as h1 double


% --- Executes during object creation, after setting all properties.
function edit71_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit71 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r331_Callback(hObject, eventdata, handles)
% hObject    handle to r331 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r331 as text
%        str2double(get(hObject,'String')) returns contents of r331 as h1 double


% --- Executes during object creation, after setting all properties.
function r331_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r331 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r324_Callback(hObject, eventdata, handles)
% hObject    handle to r324 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r324 as text
%        str2double(get(hObject,'String')) returns contents of r324 as h1 double


% --- Executes during object creation, after setting all properties.
function r324_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r324 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r323_Callback(hObject, eventdata, handles)
% hObject    handle to r323 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r323 as text
%        str2double(get(hObject,'String')) returns contents of r323 as h1 double


% --- Executes during object creation, after setting all properties.
function r323_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r323 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r322_Callback(hObject, eventdata, handles)
% hObject    handle to r322 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r322 as text
%        str2double(get(hObject,'String')) returns contents of r322 as h1 double


% --- Executes during object creation, after setting all properties.
function r322_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r322 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r321_Callback(hObject, eventdata, handles)
% hObject    handle to r321 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r321 as text
%        str2double(get(hObject,'String')) returns contents of r321 as h1 double


% --- Executes during object creation, after setting all properties.
function r321_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r321 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r311_Callback(hObject, eventdata, handles)
% hObject    handle to r311 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r311 as text
%        str2double(get(hObject,'String')) returns contents of r311 as h1 double


% --- Executes during object creation, after setting all properties.
function r311_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r311 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r312_Callback(hObject, eventdata, handles)
% hObject    handle to r312 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r312 as text
%        str2double(get(hObject,'String')) returns contents of r312 as h1 double


% --- Executes during object creation, after setting all properties.
function r312_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r312 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r313_Callback(hObject, eventdata, handles)
% hObject    handle to r313 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r313 as text
%        str2double(get(hObject,'String')) returns contents of r313 as h1 double


% --- Executes during object creation, after setting all properties.
function r313_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r313 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r314_Callback(hObject, eventdata, handles)
% hObject    handle to r314 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r314 as text
%        str2double(get(hObject,'String')) returns contents of r314 as h1 double


% --- Executes during object creation, after setting all properties.
function r314_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r314 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r231_Callback(hObject, eventdata, handles)
% hObject    handle to r231 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r231 as text
%        str2double(get(hObject,'String')) returns contents of r231 as h1 double


% --- Executes during object creation, after setting all properties.
function r231_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r231 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r224_Callback(hObject, eventdata, handles)
% hObject    handle to r224 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r224 as text
%        str2double(get(hObject,'String')) returns contents of r224 as h1 double


% --- Executes during object creation, after setting all properties.
function r224_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r224 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r223_Callback(hObject, eventdata, handles)
% hObject    handle to r223 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r223 as text
%        str2double(get(hObject,'String')) returns contents of r223 as h1 double


% --- Executes during object creation, after setting all properties.
function r223_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r223 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r222_Callback(hObject, eventdata, handles)
% hObject    handle to r222 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r222 as text
%        str2double(get(hObject,'String')) returns contents of r222 as h1 double


% --- Executes during object creation, after setting all properties.
function r222_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r222 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r221_Callback(hObject, eventdata, handles)
% hObject    handle to r221 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r221 as text
%        str2double(get(hObject,'String')) returns contents of r221 as h1 double


% --- Executes during object creation, after setting all properties.
function r221_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r221 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r211_Callback(hObject, eventdata, handles)
% hObject    handle to r211 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r211 as text
%        str2double(get(hObject,'String')) returns contents of r211 as h1 double


% --- Executes during object creation, after setting all properties.
function r211_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r211 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r212_Callback(hObject, eventdata, handles)
% hObject    handle to r212 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r212 as text
%        str2double(get(hObject,'String')) returns contents of r212 as h1 double


% --- Executes during object creation, after setting all properties.
function r212_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r212 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r213_Callback(hObject, eventdata, handles)
% hObject    handle to r213 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r213 as text
%        str2double(get(hObject,'String')) returns contents of r213 as h1 double


% --- Executes during object creation, after setting all properties.
function r213_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r213 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r214_Callback(hObject, eventdata, handles)
% hObject    handle to r214 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r214 as text
%        str2double(get(hObject,'String')) returns contents of r214 as h1 double


% --- Executes during object creation, after setting all properties.
function r214_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r214 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r131_Callback(hObject, eventdata, handles)
% hObject    handle to r131 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r131 as text
%        str2double(get(hObject,'String')) returns contents of r131 as h1 double


% --- Executes during object creation, after setting all properties.
function r131_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r131 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r124_Callback(hObject, eventdata, handles)
% hObject    handle to r124 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r124 as text
%        str2double(get(hObject,'String')) returns contents of r124 as h1 double


% --- Executes during object creation, after setting all properties.
function r124_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r124 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r123_Callback(hObject, eventdata, handles)
% hObject    handle to r123 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r123 as text
%        str2double(get(hObject,'String')) returns contents of r123 as h1 double


% --- Executes during object creation, after setting all properties.
function r123_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r123 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r122_Callback(hObject, eventdata, handles)
% hObject    handle to r122 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r122 as text
%        str2double(get(hObject,'String')) returns contents of r122 as h1 double


% --- Executes during object creation, after setting all properties.
function r122_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r122 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r121_Callback(hObject, eventdata, handles)
% hObject    handle to r121 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r121 as text
%        str2double(get(hObject,'String')) returns contents of r121 as h1 double


% --- Executes during object creation, after setting all properties.
function r121_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r121 (see GCBO)
% eventdata  reserved - to be defined in h1 future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have h1 white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on sel_2 and none of its controls.
function sel_2_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to sel_2 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when selected object is changed in uipanel7.
function uipanel7_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel7 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
if(get(handles.sel_1,'Value') == 0)%dovvomi ra feshar midahad!
    set(handles.func,'Enable','off');
    set(handles.f1,'Enable','on');
    set(handles.f2,'Enable','on');
    set(handles.f3,'Enable','on');
    set(handles.f4,'Enable','on');
    set(handles.f5,'Enable','on');
    set(handles.f6,'Enable','on');
    set(handles.f7,'Enable','on');
end
if(get(handles.sel_2,'Value') == 0)
    set(handles.func,'Enable','on');
    set(handles.f1,'Enable','off');
    set(handles.f2,'Enable','off');
    set(handles.f3,'Enable','off');
    set(handles.f4,'Enable','off');
    set(handles.f5,'Enable','off');
    set(handles.f6,'Enable','off');
    set(handles.f7,'Enable','off');
end



function x0_Callback(hObject, eventdata, handles)
% hObject    handle to x0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x0 as text
%        str2double(get(hObject,'String')) returns contents of x0 as a double


% --- Executes during object creation, after setting all properties.
function x0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r1_Callback(hObject, eventdata, handles)
% hObject    handle to r1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r1 as text
%        str2double(get(hObject,'String')) returns contents of r1 as a double


% --- Executes during object creation, after setting all properties.
function r1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r2_Callback(hObject, eventdata, handles)
% hObject    handle to r2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r2 as text
%        str2double(get(hObject,'String')) returns contents of r2 as a double


% --- Executes during object creation, after setting all properties.
function r2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r3_Callback(hObject, eventdata, handles)
% hObject    handle to r3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r3 as text
%        str2double(get(hObject,'String')) returns contents of r3 as a double


% --- Executes during object creation, after setting all properties.
function r3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r4_Callback(hObject, eventdata, handles)
% hObject    handle to r4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r4 as text
%        str2double(get(hObject,'String')) returns contents of r4 as a double


% --- Executes during object creation, after setting all properties.
function r4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
