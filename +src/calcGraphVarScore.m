function Score = calcGraphVarScore(patch_idx_gt, patch_idx_ev, ptColorL_GT, ptCloudEVcolorProjL, K4)

knn_idx_gt = patch_idx_gt(:,1:(K4+1));
knn_idx_ev = patch_idx_ev;

knn_idx_gt(:,1) = [];
knn_idx_ev(:,1) = [];

PointNum = size(ptColorL_GT, 1);
SignalGT = ptColorL_GT(:,1);
SignalEV = ptCloudEVcolorProjL(:,1);

SignalDiff_GT = zeros(PointNum, K4, 1);
SignalDiff_EV = zeros(PointNum, K4, 1);

for k=1:K4
    SignalDiff_GT(:,k) = abs(SignalGT - SignalGT(knn_idx_gt(:,k)));
    SignalDiff_EV(:,k) = abs(SignalEV - SignalEV(knn_idx_ev(:,k))); 
end

GTV_GT = sum(SignalDiff_GT(:,:,:),2);
GTV_EV = sum(SignalDiff_EV(:,:,:),2);
ScoreGT = sqrt(var(GTV_GT,1));
ScoreEV = sqrt(var(GTV_EV,1));
Score = ScoreGT / (ScoreGT + abs(ScoreGT-ScoreEV));

end

