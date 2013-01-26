function varargout = FirstPage(varargin)
% FIRSTPAGE MATLAB code for FirstPage.fig
%      FIRSTPAGE, by itself, creates a new FIRSTPAGE or raises the existing
%      singleton*.
%
%      H = FIRSTPAGE returns the handle to a new FIRSTPAGE or the handle to
%      the existing singleton*.
%
%      FIRSTPAGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIRSTPAGE.M with the given input arguments.
%
%      FIRSTPAGE('Property','Value',...) creates a new FIRSTPAGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FirstPage_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FirstPage_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FirstPage

% Last Modified by GUIDE v2.5 26-Jan-2013 06:45:44

% Begin initialization code - DO NOT EDIT

global eqs;

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FirstPage_OpeningFcn, ...
                   'gui_OutputFcn',  @FirstPage_OutputFcn, ...
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


% --- Executes just before FirstPage is made visible.
function FirstPage_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FirstPage (see VARARGIN)
addpath(genpath('G:\Workspace\Matlab\MatlabConquerors'));

image1 = imread('logo1.png');
imshow(image1,'Parent',handles.axes1);

[a,map]=imread('ch1.png');
[r,c,d]=size(a); 
x=ceil(r/70); 
y=ceil(c/245); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(handles.chapter1,'CData',g);

[a,map]=imread('ch2.png');
[r,c,d]=size(a); 
x=ceil(r/70); 
y=ceil(c/235); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(handles.chapter2,'CData',g);

[a,map]=imread('ch3.png');
[r,c,d]=size(a); 
x=ceil(r/70); 
y=ceil(c/245); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*235;
set(handles.chapter3,'CData',g);

[a,map]=imread('ch4.png');
[r,c,d]=size(a); 
x=ceil(r/70); 
y=ceil(c/245); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(handles.chapter4,'CData',g);

[a,map]=imread('ch5.png');
[r,c,d]=size(a); 
x=ceil(r/70); 
y=ceil(c/245); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(handles.chapter5,'CData',g);

[a,map]=imread('ch6.png');
[r,c,d]=size(a); 
x=ceil(r/70); 
y=ceil(c/245); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(handles.chapter6,'CData',g);

[a,map]=imread('gallary.png');
[r,c,d]=size(a); 
x=ceil(r/70); 
y=ceil(c/245); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(handles.pushbutton8,'CData',g);

[a,map]=imread('about.png');
[r,c,d]=size(a); 
x=ceil(r/70); 
y=ceil(c/245); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(handles.pushbutton9,'CData',g);

% position=get(handles.uipanel6,'position');
%     set(handles.uipanel7,'Position',[49.6,5.153846153846154,74.60000000000001,11.615384615384619]);

% Choose default command line output for FirstPage
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes FirstPage wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FirstPage_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in chapter1.

function chapter1_Callback(hObject, eventdata, handles)
% hObject    handle to chapter1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Declare and initialize variable to store the count persistent count
ChapterOne;

set(handles.uipanel6,'visible','off');
set(handles.uipanel7,'visible','off');
% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over chapter1.
function chapter1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to chapter1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Declare and initialize variable to store the count persistent count


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
ha = axes('units','normalized', ...
'position',[0 0 1 1]);
uistack(ha,'bottom');
I=imread('Background.jpg');
imagesc(I)
colormap gray
set(ha,'handlevisibility','off', ...
'visible','off')

% Now we can use the figure, as required.
% For example, we can put a plot in an axes


% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on figure1 and none of its controls.
function figure1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in chapter6.
function chapter6_Callback(hObject, eventdata, handles)
% hObject    handle to chapter6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.uipanel6,'visible','on');
set(handles.uipanel7,'visible','off');

% --- Executes on button press in chapter2.
function chapter2_Callback(hObject, eventdata, handles)
% hObject    handle to chapter2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ChapterTwo;
set(handles.uipanel6,'visible','off');
set(handles.uipanel7,'visible','off');

% --- Executes on button press in chapter4.
function chapter4_Callback(hObject, eventdata, handles)
% hObject    handle to chapter4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel6,'visible','off');
set(handles.uipanel7,'visible','on');

% --- Executes on button press in chapter5.
function chapter5_Callback(hObject, eventdata, handles)
% hObject    handle to chapter5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.uipanel6,'visible','off');
set(handles.uipanel7,'visible','off');
ChapterFive

% --- Executes on button press in chapter3.
function chapter3_Callback(hObject, eventdata, handles)
% hObject    handle to chapter3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
        h=ChapterThree();
        
set(handles.uipanel6,'visible','off');
set(handles.uipanel7,'visible','off');
        show(h);
    catch e
end

% --- Executes during object creation, after setting all properties.
function uipanel3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% This creates the 'background' axes


% --- Executes during object creation, after setting all properties.
function chapter2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to chapter2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Crammer

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Gausse_elimination


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
LU_Doolittle

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
LU_Cholskey

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
LU_Crout

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Jacobi


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Gauss_sidle

% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Eigens

% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Power_Method

% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ChapterFourIntegration

% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ChapterFourDiff
