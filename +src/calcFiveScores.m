function Scores = calcFiveScores(ptCloudGT, ptCloudEV, K3, K4)

Scores = zeros(5,1);

ptColorGT = src.ColorRGBtoL(double(ptCloudGT.Color));
ptColorEV = src.ColorRGBtoL(double(ptCloudEV.Color));

ptGeomGT = double(ptCloudGT.Location);
ptGeomEV = double(ptCloudEV.Location);
KdtreeEuclidGT = KDTreeSearcher(ptGeomGT,'Distance','euclidean');
KdtreeEuclidEV = KDTreeSearcher(ptGeomEV,'Distance','euclidean');
[knn_idx_gt_to_ev, knn_dist_gt_to_ev] = knnsearch(KdtreeEuclidEV, ptGeomGT,'K',1,'Distance','euclidean');
[knn_idx_ev_to_gt, knn_dist_ev_to_gt] = knnsearch(KdtreeEuclidGT, ptGeomEV ,'K',1,'Distance','euclidean');
ptGeomEVSampled = ptGeomEV(knn_idx_gt_to_ev,:);
ptColorEVSampled = ptColorEV(knn_idx_gt_to_ev);
patch_idx_gt = knnsearch(KdtreeEuclidGT, ptGeomGT, 'K', K3);
patch_idx_ev = knnsearch(ptGeomEVSampled, ptGeomEVSampled, 'K', (K4+1));

%% Calculation of Score 1
Scores(1) = src.calcP2pointEuclid(knn_dist_gt_to_ev, knn_dist_ev_to_gt);

%% Calculation of Score 2
Scores(2) = src.calcP2planeScore(knn_idx_ev_to_gt, ptGeomGT, ptGeomEV, ptCloudGT, 4);

%% Calculation of Score 3
Scores(3) = src.calcColorVarScore(ptColorGT, ptColorEVSampled, patch_idx_gt, K3);

%% Calculation of Score 4
Scores(4) = src.calcGraphVarScore(patch_idx_gt, patch_idx_ev, ptColorGT, ptColorEVSampled, K4);

%% Calculation of Score 5
Scores(5) = src.calcPCountPenalty(ptCloudGT, ptCloudEV);

disptext = sprintf('[INFO] Score 1: %f\n', Scores(1)); fprintf(disptext);   
disptext = sprintf('[INFO] Score 2: %f\n', Scores(2)); fprintf(disptext);   
disptext = sprintf('[INFO] Score 3: %f\n', Scores(3)); fprintf(disptext); 
disptext = sprintf('[INFO] Score 4: %f\n', Scores(4)); fprintf(disptext); 
disptext = sprintf('[INFO] Score 5: %f\n', Scores(5)); fprintf(disptext); 

end

