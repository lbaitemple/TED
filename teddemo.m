clc,clear,close all

% Do the following lines in the command window first one time 
%  javaaddpath('filename.jar'); % Add the java path
%  import Classname;  % import the particular classes
javaclasspath('TEModel.jar')
import model.TEMainControl;

% TEMainControl mode 1
a=TEMainControl(false);  % make it false so that it simulates the plant samples by samples
pp=zeros(54, 1000);      % Initiate the data
pp=a.runGetData(); 
