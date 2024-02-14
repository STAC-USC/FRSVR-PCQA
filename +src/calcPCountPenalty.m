function Score = calcPCountPenalty(ptCloudGT, ptCloudEV)

     Diff = max(ptCloudGT.Count - ptCloudEV.Count, 0);
     Score = double(Diff / ptCloudGT.Count); 
     Score = 1 - Score;

end

    

    
    
