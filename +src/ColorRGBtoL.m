function ColorL = ColorRGBtoL(ColorRGB)
  
    ColorRGB = ColorRGB ./ 255;
    R = ColorRGB(:,1);
    G = ColorRGB(:,2);
    B = ColorRGB(:,3);
    
    IndexR1 = find(R > 0.0404482362771076);
    IndexR2 = find(R <= 0.0404482362771076);
    R(IndexR1) = ((R(IndexR1) + 0.055) ./ 1.055) .^ 2.4;
    R(IndexR2) = R(IndexR2) ./ 12.92;
    
    IndexG1 = find(G > 0.0404482362771076);
    IndexG2 = find(G <= 0.0404482362771076);
    G(IndexG1) = ((G(IndexG1) + 0.055) ./ 1.055) .^ 2.4;
    G(IndexG2) = G(IndexG2) ./ 12.92;
        
    IndexB1 = find(B > 0.0404482362771076);
    IndexB2 = find(B <= 0.0404482362771076);
    B(IndexB1) = ((B(IndexB1) + 0.055) ./ 1.055) .^ 2.4;
    B(IndexB2) = B(IndexB2) ./ 12.92;

    Y = 0.212586 * R + 0.71517 * G + 0.0722005 * B;
	Yo = 1.000000;
    Y = Y/Yo;
    
	ColorL = zeros(size(ColorRGB,1),1);

    IndexL1 = find(Y > 0.008856);
    IndexL2 = find(Y <= 0.008856);
    ColorL(IndexL1,1) = 116.0 * Y(IndexL1).^(1/3) - 16.0;
    ColorL(IndexL2,1) = 116.0 * ((841.0 / 108.0) * Y(IndexL2) + 4.0 / 29.0) - 16.0;

end

