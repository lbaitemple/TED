clc,clear,close all

% Do the following lines in the command window first one time 
%  javaaddpath('filename.jar'); % Add the java path
%  import Classname;  % import the particular classes
eval('javaaddpath TEModel/classes/TEModel.jar;import TEModel;import model.TEMainControl;')

% TEMainControl mode 1
a=TEMainControl(false);  % make it false so that it simulates the plant samples by samples
pp=zeros(54, 1000);      % Initiate the data
for i=1:1000
    if (i==200) %inject a fault at the 200-th samples
        a.setFault(8);  %(20 secs)
    end
    if (i==400) %inject a second fault at the 400-th samples
        a.setFault(1)
    end
    if (i==600) %remove a fault from the system
        a.removeFault(1);
    end
    if (i==600) %remove all faults
        a.removeAllFaults();
    end
    pp(:,i)=a.runGetData();  % get all data recorded
end


fault=8;run=1;

% TEMainControl mode 2
a=TEMainControl(fault,10,50); % Mode 2, see detailed explanation of parameters in readme.txt
pp2=a.getData();              % Get all data 54*1000, the first column indicates the Time

% Mode 3, read the data file in the folder 'datafolder'. Not included
cmdfile = sprintf('datafolder/te_dist%d_run%d',fault, run);
load(cmdfile);
[DataLen, szm] = size(data.xmeas);
[DataLen, szv] = size(data.xmv);
Sensordata = [data.xmeas,data.xmv];

figure(fault)
Is=[16 20 7];
X=1:1000;

for i=1:length(Is)
    subplot(length(Is), 1, i),hold on
    plot(X,pp(Is(i)+1,:),X,pp2(Is(i)+1,:));
    legend('pp','pp2')
end
legend('curve 1','curve 2');

