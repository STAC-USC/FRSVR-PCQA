SRCFolderName = 'dataset\BASICS\SRC\';
PPCFolderName = 'dataset\BASICS\PPC\';
MosFilePath = 'dataset\BASICS\testset_mos_std_ci.csv';
OutputScoreDataName = 'ScoreData\Scores_BASICStest.csv';

MosStdCiTable = readtable(MosFilePath);
SRCFilenames = string(MosStdCiTable.src);
PPCFilenames = string(MosStdCiTable.ppc);
MosArray = double(MosStdCiTable.mos);
DataCount = size(SRCFilenames, 1);
disptext = sprintf('[INFO] DataCount = %d\n', DataCount); fprintf(disptext);
     
OutputTable = strings([DataCount+1,6]);
OutputTable(1,1) = 'PPCName'; 
OutputTable(1,2) = 'S1'; 
OutputTable(1,3) = 'S2';  
OutputTable(1,4) = 'S3';  
OutputTable(1,5) = 'S4';  
OutputTable(1,6) = 'S5'; 

for d=1:DataCount

    %% Loading point clouds
    ptCloudGT = pcread(strcat(SRCFolderName,SRCFilenames(d),'.ply'));
    ptCloudEV = pcread(strcat(PPCFolderName,PPCFilenames(d),'.ply'));
    disptext = sprintf('\n[INFO] Ref PC: %s.ply, Dist PC: %s.ply\n', SRCFilenames(d), PPCFilenames(d)); fprintf(disptext);

    %% Calculating scores
    Scores = src.calcFiveScores(ptCloudGT, ptCloudEV, 20, 5);
    OutputTable(d+1,1) = PPCFilenames(d);
    OutputTable(d+1,2:6) = Scores;

end

writematrix(OutputTable,OutputScoreDataName);




