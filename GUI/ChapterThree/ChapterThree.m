function varargout = ChapterThree(varargin)
% CHAPTERTHREE MATLAB code for ChapterThree.fig
%      CHAPTERTHREE, by itself, creates a new CHAPTERTHREE or raises the existing
%      singleton*.
%
%      H = CHAPTERTHREE returns the handle to a new CHAPTERTHREE or the handle to
%      the existing singleton*.
%
%      CHAPTERTHREE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAPTERTHREE.M with the given input arguments.
%
%      CHAPTERTHREE('Property','Value',...) creates a new CHAPTERTHREE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ChapterThree_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ChapterThree_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ChapterThree

% Last Modified by GUIDE v2.5 26-Jan-2013 08:46:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ChapterThree_OpeningFcn, ...
                   'gui_OutputFcn',  @ChapterThree_OutputFcn, ...
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


% --- Executes just before ChapterThree is made visible.
function ChapterThree_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ChapterThree (see VARARGIN)
    position=get(handles.uipanel7,'position');
    set(handles.uipanel4,'Position',position);

    addpath(genpath('C:\Users\majid\Desktop\NM\MatlabConquerors'));
    
    rgb = imread('alphaabetax.png');
    axes(handles.alphaabetax); 
    imshow(rgb);
    
    rgb = imread('alnx.png');
    axes(handles.alnx);
    imshow(rgb);

    rgb = imread('axb.png');
    axes(handles.axb);
    imshow(rgb);
    
    rgb = imread('1axb.png');
    axes(handles.oaxb);
    imshow(rgb);

    rgb = imread('aixi.png');
    axes(handles.aixi);
    imshow(rgb);
    
    
    ha = axes('units','normalized', ...
'position',[0 0 1 1]);
uistack(ha,'bottom');
I=imread('back2.jpg');
imagesc(I)
colormap gray
set(ha,'handlevisibility','off', ...
'visible','off')


% Choose default command line output for ChapterThree
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ChapterThree wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ChapterThree_OutputFcn(hObject, eventdata, handles) 
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

ax=handles.axes2;
FuncString=get(handles.edit2,'string');
cla(ax);
set(handles.axes2,'visible','off');
text1=text(0, 0, FuncString, 'Parent', ax);
set(text1,'FontName','Courier New','FontSize',15);
FuncString=FuncString(6:end);
[sendingX sendingY]=samplePoint(FuncString);
x=get(handles.uipanel4,'SelectedObject');
    xtag = get(x, 'Tag');
    cla(handles.axes1);
    if strcmp(xtag,'radioalphaabetax')
        [a b c d e f g]=bestCurvefitting(handles.axes1,sendingX,sendingY);
        x=min(sendingX):.1:max(sendingX);
        plot(handles.axes1,x,eval(b),'red');
    elseif strcmp(xtag,'radioalnx')
        [a b c d e f g]=bestCurvefitting(handles.axes1,sendingX,sendingY);
        x=min(sendingX):.1:max(sendingX);
        plot(handles.axes1,x,eval(c),'red');
    elseif strcmp(xtag,'radioaxb')
        [a b c d e f g]=bestCurvefitting(handles.axes1,sendingX,sendingY);
        x=min(sendingX):.1:max(sendingX);
        plot(handles.axes1,x,eval(d),'red');
    elseif strcmp(xtag,'radiooaxb')
        [a b c d e f g]=bestCurvefitting(handles.axes1,sendingX,sendingY);
        x=min(sendingX):.1:max(sendingX);
        plot(handles.axes1,x,eval(e),'red');
    elseif strcmp(xtag,'radioaixi')
        [a b c d e f g]=bestCurvefitting(handles.axes1,sendingX,sendingY);
        x=min(sendingX):.1:max(sendingX);
        plot(handles.axes1,x,eval(f),'red');
        x=min(sendingX):.1:max(sendingX);
        plot(handles.axes1,x,eval(g),'black');
    end

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




   
% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1

value=get(hObject,'Value');
if value
    set(handles.uipanel7,'visible','off');
    set(handles.uipanel8,'Title','Fitted Function');
    set(hObject,'string','Change To Interpolation Mode');
    set(handles.uipanel9,'visible','off');
    set(handles.togglebutton2,'enable','on');
    set(handles.uipanel4,'visible','on');
    value2=get(handles.togglebutton2,'Value');
    if value2
        set(handles.uitable1,'visible','off');
        set(handles.edit2,'visible','on');
        set(handles.uipanel5,'visible','on');
    else
        set(handles.uitable1,'visible','on');
        set(handles.edit2,'visible','off');
        set(handles.uipanel5,'visible','off');
    end
else
    set(handles.uipanel9,'visible','on');
    set(handles.uipanel8,'Title','Interpolated Function');
    set(handles.uitable1,'visible','on');
    set(handles.edit2,'visible','off');
    set(handles.uipanel5,'visible','off');
    set(handles.uipanel7,'visible','on');
    set(hObject,'string','Change To Curvfitting Mode');
    set(handles.uipanel4,'visible','off');
    set(handles.togglebutton2,'enable','off');
end


% --- Executes on button press in togglebutton2.
function togglebutton2_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton2

value=get(hObject,'Value');
if value
    set(handles.uipanel5,'visible','on');
    set(handles.edit2,'visible','on');
    set(hObject,'string','Change to with Points Mode');
    set(handles.uitable1,'visible','off');
else
    set(handles.uipanel5,'visible','off');
    set(handles.edit2,'visible','off');
    set(handles.uitable1,'visible','on');
    set(hObject,'string','Change to with Function Mode');
end


% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1);
data=get(handles.uitable1,'Data');
    c=size(data,1);
    XY=get(handles.uitable1,'Data');
    X=XY(:,1);
    Y=XY(:,2);
    X=X';
    Y=Y';
    n=size(X,2);
    sendingX=0;
    sendingY=0;
    counter=0;
    sendingrow=1;
    for j=1:n
        tempX=str2num(X{j});
        tempY=str2num(Y{j});
        if size(tempX,1)==0 && size(tempY,1)==0
            counter=counter+1;
        end
        if ~(size(tempX,1)==0 && size(tempY,1)==0)
            sendingX(sendingrow)=tempX;
            sendingY(sendingrow)=tempY;
            sendingrow=sendingrow+1;
        end
    end
    sendingX
    sendingY
    if counter==1
        b=repmat({''},1,2);
        data(size(data,1)+1,1)=b(1);
        data(size(data,1),2)=b(1);
        set(handles.uitable1,'Data',data);
    end
x_req=get(handles.edit4,'string');
x_req=str2num(x_req);
curvfitting=(get(handles.togglebutton1,'Value'));
if (curvfitting)
    x=get(handles.uipanel4,'SelectedObject');
    xtag = get(x, 'Tag');
    cla(handles.axes1);
    if strcmp(xtag,'radioalphaabetax')
        [a b c d e f g]=bestCurvefitting(handles.axes1,sendingX,sendingY);
        x=min(sendingX):.1:max(sendingX);
        plot(handles.axes1,x,eval(b),'red');
    elseif strcmp(xtag,'radioalnx')
        [a b c d e f g]=bestCurvefitting(handles.axes1,sendingX,sendingY);
        x=min(sendingX):.1:max(sendingX);
        plot(handles.axes1,x,eval(c),'red');
    elseif strcmp(xtag,'radioaxb')
        [a b c d e f g]=bestCurvefitting(handles.axes1,sendingX,sendingY);
        x=min(sendingX):.1:max(sendingX);
        plot(handles.axes1,x,eval(d),'red');
    elseif strcmp(xtag,'radiooaxb')
        [a b c d e f g]=bestCurvefitting(handles.axes1,sendingX,sendingY);
        x=min(sendingX):.1:max(sendingX);
        plot(handles.axes1,x,eval(e),'red');
    elseif strcmp(xtag,'radioaixi')
        [a b c d e f g]=bestCurvefitting(handles.axes1,sendingX,sendingY);
        x=min(sendingX):.1:max(sendingX);
        plot(handles.axes1,x,eval(f),'red');
        x=min(sendingX):.1:max(sendingX);
        plot(handles.axes1,x,eval(g),'black');
    end
else
    x=get(handles.uipanel7,'SelectedObject');
    xtag = get(x, 'Tag');
    if strcmp(xtag,'radiologrange')
        lagrange_interpolation(sendingX,sendingY,x_req,handles.axes1);
    elseif strcmp(xtag,'radioNDD')
        newtondevideddiffrencec(sendingX,sendingY,x_req,handles.axes1);
    elseif strcmp(xtag,'radioNF')
        nfwp(sendingX,sendingY,x_req,handles.axes1);
    elseif strcmp(xtag,'radioNB')
        nbwp(sendingX,sendingY,x_req,handles.axes1);
    elseif strcmp(xtag,'radioNFC')
        nfcp(sendingX,sendingY,x_req,handles.axes1);
    elseif strcmp(xtag,'radioNBC')
        nbcp(sendingX,sendingY,x_req,handles.axes1);
    end
end



% --- Executes during object creation, after setting all properties.
function togglebutton1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function uipanel4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(ChapterThree);
FirstPage();


% --- Executes during object creation, after setting all properties.
function back_CreateFcn(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on mouse press over axes background.
function alnx_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to alnx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when entered data in editable cell(s) in uitable4.
function uitable4_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable4 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in addrow.
function addrow_Callback(hObject, eventdata, handles)
% hObject    handle to addrow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data=get(handles.uitable1,'data');
       b=repmat({''},1,2);
       data(size(data,1)+1,1)=b(1);
       data(size(data,1),2)=b(1);
       data(size(data,1)+1,1)=b(1);
       data(size(data,1),2)=b(1);
       data(size(data,1)+1,1)=b(1);
       data(size(data,1),2)=b(1);
       set(handles.uitable1,'Data',data);


% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function back_CreateFcn(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(ChapterThree);
FirstPage;


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
