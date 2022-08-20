%% loading model
load("path1")
%path1 refers to the pather of the TREmodel file in your device.

%% loading data (.xlsx file)
[~,~,str]=xlsread("path2");%path2 refers to the path of the input variable table in your device

%% processing data
inputData=str;
for i=1:12;
    inputData(2:end,i)=num2cell(normalize(cell2mat(inputData(2:end,i)),'zscore'));
end
inputData_tb=cell2table(inputData(2:end,:));
inputData_tb.Properties.VariableNames =inputData(1,:);
inputData_tb.buildingType=categorical(inputData_tb.buildingType);
inputData_tb.renovationWorkType=categorical(inputData_tb.renovationWorkType);

%% estimating renovation waste
EstimateRenovationWaste =TREmodel.predictFcn(inputData_tb);%open EstimateRenovationWaste file to see the model outputs
