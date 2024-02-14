function Score = calcColorVarScore(ptCloudGTcolorOutL, ptCloudEVcolorProjL, patch_idx_gt, K3)
       
    StdGT = std(ptCloudGTcolorOutL(patch_idx_gt(:,1:K3)),[],2);
    StdEV = std(ptCloudEVcolorProjL(patch_idx_gt(:,1:K3)),[],2);
    Diff = abs(StdGT - StdEV);
    Eval = mean(Diff.^2);
    Score = 1 / (1 + Eval); 
    
end

    

    
    
