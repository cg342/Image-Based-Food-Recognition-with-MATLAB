function varargout = user_interface(varargin)
% USER_INTERFACE MATLAB code for user_interface.fig
%      USER_INTERFACE, by itself, creates a new USER_INTERFACE or raises the existing
%      singleton*.
%
%      H = USER_INTERFACE returns the handle to a new USER_INTERFACE or the handle to
%      the existing singleton*.
%
%      USER_INTERFACE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in USER_INTERFACE.M with the given input arguments.
%
%      USER_INTERFACE('Property','Value',...) creates a new USER_INTERFACE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before user_interface_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to user_interface_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help user_interface

% Last Modified by GUIDE v2.5 13-Apr-2016 13:10:54

% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @user_interface_OpeningFcn, ...
                   'gui_OutputFcn',  @user_interface_OutputFcn, ...
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


% --- Executes just before user_interface is made visible.
function user_interface_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to user_interface (see VARARGIN)

% Choose default command line output for user_interface

load classifier_gaussian.mat
global classifier
classifier=categoryClassifier;
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);


% UIWAIT makes user_interface wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = user_interface_OutputFcn(hObject, eventdata, handles) 
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
% loading the fruit photos by the user

global im
[path, user_cance]=imgetfile();
if user_cance
    msgbox(sprintf('Error'), 'Error', 'Error');
    return
end
im = imread(path);
axes(handles.axes1);
imshow(im);



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% call the function to process the photo and return a caloric value
% for example:
set(handles.text2,'Visible','on')
set(handles.initial_value,'String', 'Loading...')
set(handles.edit3,'String', 'Loading...')
drawnow

global im
global classifier
[processedIm1,processedIm2,num]=preprocess(im);
% load classifier.mat
% im=imresize(im,[300 NaN]);
  
[indx,category]=classify(processedIm1,classifier);

categoryResult=category ;
calorie=lookfruit(indx);

if num>1
    [indx,category]=classify(processedIm2,classifier);
categoryResult=strcat(categoryResult,' /',category);
calorie=calorie+lookfruit(indx);

end


% 
calorieValue = strcat('Calorie counts: ',num2str(calorie)); 
set(handles.initial_value,'String', categoryResult)
set(handles.edit3,'String', calorieValue)
set(handles.text2,'Visible','off')

guidata(hObject, handles);



function initial_value_Callback(hObject, eventdata, handles)
% hObject    handle to initial_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of initial_value as text
%        str2double(get(hObject,'String')) returns contents of initial_value as a double


% --- Executes during object creation, after setting all properties.
function initial_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initial_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function pushbutton2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


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
