TrainingDataFilepath = "ScoreData\Scores_BASICStraining.csv";
TestDataFilepath = "ScoreData\Scores_BASICStest.csv";
TrainingMosFilepath = 'dataset\BASICS\trainset_mos_std_ci.csv'; 
TestMosFilepath = 'dataset\BASICS\testset_mos_std_ci.csv'; 
SaveModelFilepath = "model\model.mat";

%% Training
rng 'default'
TrainingDataTable = readtable(TrainingDataFilepath);
TrainingDataCount = size(TrainingDataTable, 1);
disptext = sprintf('[INFO] Load Training Data, %d data\n', TrainingDataCount); fprintf(disptext);
TrainingData = table2array(TrainingDataTable(:,["S1","S2","S3","S4","S5"]));
TrainMosTable = readtable(TrainingMosFilepath);
TrainMosData = TrainMosTable.mos;
svMod = fitrsvm(TrainingData,TrainMosData,'Solver','SMO','Standardize',true,'KernelFunction','gaussian','KernelScale','auto');
saveLearnerForCoder(svMod, SaveModelFilepath);

%% Test
TestDataTable = readtable(TestDataFilepath);
TestDataCount = size(TestDataTable, 1);
disptext = sprintf('[INFO] Load Test Data, %d data\n', TestDataCount); fprintf(disptext);
TestData = table2array(TestDataTable(:,["S1","S2","S3","S4","S5"]));
predictions = predict(svMod, TestData);
TestMosTable = readtable(TestMosFilepath);
TestMosData = TestMosTable.mos;
PLCC = corr(TestMosData,predictions,'Type','Pearson');     
SROCC = corr(TestMosData,predictions,'Type','Spearman');
disptext = sprintf('[INFO] PLCC: %f, SROCC: %f\n', PLCC, SROCC); fprintf(disptext);
