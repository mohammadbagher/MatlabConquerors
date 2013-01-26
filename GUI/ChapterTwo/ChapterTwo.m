function varargout = ChapterTwo(varargin)
% CHAPTERTwo MATLAB code for ChapterTwo.fig
%      CHAPTERTwo, by itself, creates a new CHAPTERTwo or raises the existing
%      singleton*.
%
%      H = CHAPTERTwo returns the handle to a new CHAPTERTwo or the handle to
%      the existing singleton*.
%
%      CHAPTERTwo('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAPTERTwo.M with the given input arguments.
%
%      CHAPTERTwo('Property','Value',...) creates a new CHAPTERTwo or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ChapterTwo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ChapterTwo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ChapterTwo

% Last Modified by GUIDE v2.5 09-Dec-2012 07:21:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ChapterTwo_OpeningFcn, ...
                   'gui_OutputFcn',  @ChapterTwo_OutputFcn, ...
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


% --- Executes just before ChapterTwo is made visible.
function ChapterTwo_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ChapterTwo (see VARARGIN)

addpath(genpath('D:\Management\Education+University\Term 5\Numerical Methods\Project Git 2\MatlabConquerors'));
set(handles.info, 'String','The bisection method in mathematics is a root-finding method which repeatedly bisects an interval and then selects a subinterval in which a root must lie for further processing. It is a very simple and robust method, but it is also relatively slow. Because of this, it is often used to obtain a rough approximation to a solution which is then used as a starting point for more rapidly converging methods.');
set(handles.equations , 'Data', repmat({''},0,1));
set(handles.mahdude , 'Data', zeros(0,1));
set(handles.final_solve,'Data',repmat({''},0,4));

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


% Choose default command line output for ChapterTwo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ChapterTwo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ChapterTwo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function func_Callback(hObject, eventdata, handles)
% hObject    handle to func (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of func as text
%        str2double(get(hObject,'String')) returns contents of func as a double
ax=handles.axes2;
FuncString=get(handles.func,'string');
cla(ax);
set(handles.axes2,'visible','off');
FuncString = strcat(' $$  ',FuncString,'$$');
text1 = text('Interpreter','latex','String',FuncString);
set(text1,'FontName','Courier New','FontSize',20);

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(ChapterTwo);
FirstPage();


% --- Executes on button press in solve_button.
function solve_button_Callback(hObject, eventdata, handles)
% hObject    handle to solve_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.message_box, 'String','Solving...Please Wait!');




method_code = get(handles.method, 'Value');
max_step = get(handles.max_step, 'String');max_step=str2double(max_step);
sigfig = get(handles.sigfig, 'String');sigfig=str2double(sigfig);

if(method_code == 11)    %generalized-newton-raphson-----------------------
    equations = get(handles.equations,'Data');
    if(size(equations,1) < 2 )
        set(handles.message_box,'String','I don''t see a system of equations!');
        return;
    end
    mahdude = get(handles.mahdude,'Data');
    fff = zeros(1,4);
    fff(:,2:3) = GNR(equations,mahdude,max_step,sigfig);
    set(handles.final_solve,'Data',fff);
    set(handles.message_box, 'String','Solved!');
    return;
end

func = get(handles.func, 'String');

index = strfind(func,'=');
func = func(index+1:end);
if(size(strtrim(func),1)==0)
    set(handles.message_box,'String','Please enter a function!');
    return;
end
func = strcat('@(x)(',func,')');
func = str2func(func);

a = get(handles.a, 'String');a=str2double(a);
b = get(handles.b, 'String');b=str2double(b);
tol = get(handles.tol, 'String');tol=str2double(tol);
delta = get(handles.delta, 'String');delta=str2double(delta);


intervals = interval_of_roots(func,a,b,delta);
root_num = size(intervals,1);
if(root_num == 0)
    set(handles.message_box, 'String','No roots found in your interval! Try another interval that contains a root or if you''r sure that there is a root, try mifying the Delta');
    return;
end
final = repmat({''},root_num,4);
if(method_code == 1)    %bisection-----------------------------------------
    for i=1:root_num
        curr_root = bisection(func,intervals(i,1),intervals(i,2),max_step,tol);
        curr_error = error_calculator(func,curr_root,sigfig);
        final(i,1) = cellstr(strcat('(',num2str(intervals(i,1),sigfig),' , ',num2str(intervals(i,2),sigfig),')'));
        final(i,2) = cellstr(num2str(curr_root,sigfig));
        final(i,3) = cellstr(num2str(curr_error,sigfig));
    end
    set(handles.final_solve,'Data',final);
    set(handles.message_box, 'String','Solved!');
  return;
end
if(method_code == 2)    %secant--------------------------------------------
    for i=1:root_num
        curr_root = secant(func,intervals(i,1),intervals(i,2),max_step,tol);
        curr_error = error_calculator(func,curr_root,sigfig);
        final(i,1) = cellstr(strcat('(',num2str(intervals(i,1),sigfig),' , ',num2str(intervals(i,2),sigfig),')'));
        final(i,2) = cellstr(num2str(curr_root,sigfig));
        final(i,3) = cellstr(num2str(curr_error,sigfig));
    end
    set(handles.final_solve,'Data',final);
    set(handles.message_box, 'String','Solved!');
    return;
end
if(method_code == 3)    %false-position------------------------------------
    for i=1:root_num
        curr_root = false_position(func,intervals(i,1),intervals(i,2),max_step,tol);
        curr_error = error_calculator(func,curr_root,sigfig);
        final(i,1) = cellstr(strcat('(',num2str(intervals(i,1),sigfig),' , ',num2str(intervals(i,2),sigfig),')'));
        final(i,2) = cellstr(num2str(curr_root,sigfig));
        final(i,3) = cellstr(num2str(curr_error,sigfig));
    end
    set(handles.final_solve,'Data',final);
    set(handles.message_box, 'String','Solved!');
    return;
end
if(method_code == 4)    %newton-raphson------------------------------------
    for i=1:root_num
        curr_root = NR(func,intervals(i,1),intervals(i,2),tol);
        curr_error = error_calculator(func,curr_root,sigfig);
        final(i,1) = cellstr(strcat('(',num2str(intervals(i,1),sigfig),' , ',num2str(intervals(i,2),sigfig),')'));
        final(i,2) = cellstr(num2str(curr_root,sigfig));
        final(i,3) = cellstr(num2str(curr_error,sigfig));
    end
    set(handles.final_solve,'Data',final);
    set(handles.message_box, 'String','Solved!');
    return;
end
if(method_code == 5)    %fixed-point---------------------------------------
    for i=1:root_num
        gfunc = get(handles.gfunc, 'String');

        index = strfind(gfunc,'=');
        gfunc = gfunc(index+1:end);
        if(size(strtrim(gfunc),1)==0)
            curr_root = fixed_point(func,a,b,max_step,tol);
        else
            gfunc = strcat('@(x)(',gfunc,')');
            gfunc = str2func(gfunc);
            curr_root = fixed_point(func,a,b,max_step,tol,gfunc);
        end
        curr_error = error_calculator(func,curr_root,sigfig);
        final(i,1) = cellstr(strcat('(',num2str(intervals(i,1),sigfig),' , ',num2str(intervals(i,2),sigfig),')'));
        final(i,2) = cellstr(num2str(curr_root,sigfig));
        final(i,3) = cellstr(num2str(curr_error,sigfig));
    end
    set(handles.final_solve,'Data',final);
    set(handles.message_box, 'String','Solved!');
    return;
end
set(handles.message_box, 'String','The method isn''t implemented yet.');



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
method_code = get(handles.method, 'Value');
set(handles.a,'Enable','on');
set(handles.b,'Enable','on');
set(handles.delta,'Enable','on');

if(method_code ~= 11)  %not-GNR--------------------------------------------
    set(handles.equations,'Visible','off');
    set(handles.mahdude,'Visible','off');    
end
if(method_code ~= 5)
    set(handles.gfunc,'Visible','off');    
end
    
    
if(method_code == 11)  %GNR------------------------------------------------
    set(handles.a,'Enable','off');
    set(handles.b,'Enable','off');
    set(handles.delta,'Enable','off');
    set(handles.info, 'String','GNR dscrptn');
    set(handles.func,'String','f_1=');
    func_Callback(hObject, eventdata, handles);
    set(handles.equations,'Visible','on');
    set(handles.mahdude,'Visible','on');
    
    return;
end
% Bisection
% Secant 
% False Position
% Newton Raphson
% Fixed Point
% 6.Riddler
% 7.Muller
% 8.Broyden
% 9.Brent
% 10.Chebyshev
% Generalized Newton Raphson

if(method_code == 1)  %bisection-------------------------------------------
    set(handles.info, 'String','The bisection method in mathematics is a root-finding method which repeatedly bisects an interval and then selects a subinterval in which a root must lie for further processing. It is a very simple and robust method, but it is also relatively slow. Because of this, it is often used to obtain a rough approximation to a solution which is then used as a starting point for more rapidly converging methods.');
end
if(method_code == 2)  %bisection-------------------------------------------
    set(handles.info, 'String','secant method is a root-finding algorithm that uses a succession of roots of secant lines to better approximate a root of a function f. The secant method can be thought of as a finite difference approximation of Newton''s method');
end
if(method_code == 3)  %bisection-------------------------------------------
    set(handles.info, 'String','false position method or regula falsi method is a term for problem-solving methods in arithmetic, algebra, and calculus. In simple terms, these methods begin by attempting to evaluate a problem using test ("false") values for the variables, and then adjust the values accordingly.');
end
if(method_code == 4)  %bisection-------------------------------------------
    set(handles.info, 'String','Newton''s method assumes the function f to have a continuous derivative. Newton''s method may not converge if started too far away from a root. However, when it does converge, it is faster than the bisection method, and is usually quadratic. Newton''s method is also important because it readily generalizes to higher-dimensional problems.');
end
if(method_code == 5)  %bisection-------------------------------------------
    set(handles.info, 'String',sprintf('Fixed-point iteration is a method of computing fixed points of iterated functions. \n=>If you have the g(x) function enter it in the below box, otherwise leave it blank.\n==>note that providing a g(x) function has more chance for the equation to be solved. '));
    set(handles.gfunc,'Visible','on');
end
if(method_code == 6)  %bisection-------------------------------------------
    set(handles.info, 'String','dscrptn');
end
if(method_code == 7)  %bisection-------------------------------------------
    set(handles.info, 'String','Muller''s method is based on the secant method, which constructs at every iteration a line through two points on the graph of f. Instead, Muller''s method uses three points, constructs the parabola through these three points, and takes the intersection of the x-axis with the parabola to be the next approximation.');
end
if(method_code == 8)  %bisection-------------------------------------------
    set(handles.info, 'String','Broyden''s method is a quasi-Newton method for the root-finding. Newton''s method for solving the equation f(x)=0 uses the Jacobian matrix and determinant at every iteration. However, computing this Jacobian is a difficult operation. The idea behind Broyden''s method is to compute the whole Jacobian only at the first iteration, and to do a rank-one update at the other iterations.');
end
if(method_code == 9)  %bisection-------------------------------------------
    set(handles.info, 'String','Brent''s method is a combination of the bisection method, the secant method and inverse quadratic interpolation. At every iteration, Brent''s method decides which method out of these three is likely to do best, and proceeds by doing a step according to that method. This gives a robust and fast method, which therefore enjoys considerable popularity.');
end
if(method_code == 10)  %bisection-------------------------------------------
    set(handles.info, 'String','Chebyshev method interpolates the function with chebyshev polynomials using n polynomials.This method also can find multiple roots in compare with other methods.');
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



function b_Callback(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of b as text
%        str2double(get(hObject,'String')) returns contents of b as a double



function delta_Callback(hObject, eventdata, handles)
% hObject    handle to delta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of delta as text
%        str2double(get(hObject,'String')) returns contents of delta as a double


% --- Executes during object creation, after setting all properties.
function delta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to delta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ok_button.
function ok_button_Callback(hObject, eventdata, handles)
% hObject    handle to ok_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
func_Callback(hObject, eventdata, handles);
method_code = get(handles.method, '');
if(method_code == 11)  %GNR------------------------------------------------
    func = get(handles.func, 'String');
    index = strfind(func,'=');
    func = func(index+1:end);
    if(size(strtrim(func),1)~=0)
        eqt = get(handles.equations,'Data');
        mht = get(handles.mahdude,'Data');
        eqt(size(eqt,1)+1,1) = cellstr(func);
        mht(size(mht,1)+1,1) = 1;
        set(handles.equations,'Data',eqt);
        set(handles.mahdude,'Data',mht);
        set(handles.func,'String',strcat('f_',num2str(size(eqt,1)+1),'='));
    end
end



% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes on key press with focus on func and none of its controls.
function func_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to func (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function func_CreateFcn(hObject, eventdata, handles)
% hObject    handle to func (see GCBO)
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



function tol_Callback(hObject, eventdata, handles)
% hObject    handle to tol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tol as text
%        str2double(get(hObject,'String')) returns contents of tol as a double


% --- Executes during object creation, after setting all properties.
function tol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function max_step_Callback(hObject, eventdata, handles)
% hObject    handle to max_step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max_step as text
%        str2double(get(hObject,'String')) returns contents of max_step as a double


% --- Executes during object creation, after setting all properties.
function max_step_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max_step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ignore.
function ignore_Callback(hObject, eventdata, handles)
% hObject    handle to ignore (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ignore


% --- Executes when selected cell(s) is changed in final_solve.
function final_solve_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to final_solve (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)



function gfunc_Callback(hObject, eventdata, handles)
% hObject    handle to gfunc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gfunc as text
%        str2double(get(hObject,'String')) returns contents of gfunc as a double


% --- Executes during object creation, after setting all properties.
function gfunc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gfunc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when entered data in editable cell(s) in final_solve.
function final_solve_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to final_solve (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
eventdata.Indices
'salam'
