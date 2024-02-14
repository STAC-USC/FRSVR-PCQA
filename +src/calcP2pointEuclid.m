function Score = calcP2pointEuclid(knn_dist_gt, knn_dist_ev)
   
    knn_dist_gt_sq = knn_dist_gt .^ 2;
    GTMSE = 1/size(knn_dist_gt,1) * sum(knn_dist_gt_sq);   
    knn_dist_ev_sq = knn_dist_ev .^ 2;
    EVMSE = 1/size(knn_dist_ev,1) * sum(knn_dist_ev_sq);    
    P2PMSE = (GTMSE + EVMSE) / 2;
    Score = 1 / (1 + P2PMSE); 

end

    

    
    
