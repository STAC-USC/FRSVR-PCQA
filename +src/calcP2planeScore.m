function Score = calcP2planeScore(knn_idx_ev_to_gt, GTgeom, EVgeom, ptCloudGT, K)
        
    GT_normals = pcnormals(ptCloudGT, K);
    Vneigh = GTgeom(knn_idx_ev_to_gt(:,:),:);   
    DirVector = Vneigh - EVgeom;
    dotProductEV = DirVector .* GT_normals(knn_idx_ev_to_gt(:,:),:);    
    dotProductEVSq = dotProductEV.^2;
    dotProductEVSq = sum(dotProductEVSq, 2);
    EVScore = sum(dotProductEVSq,'all') / size(EVgeom,1);
    Score = 1 / (1 + EVScore); 

end

    

    
    
