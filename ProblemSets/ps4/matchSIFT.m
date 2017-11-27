function matchSIFT(imgA, imgB, frameA, frameB, filter)
%MATCHSIFT Summary of this function goes here
%   Detailed explanation goes here
    %imgAgrey = rgb2gray(imgA);
    %imgBgrey = rgb2gray(imgB);
    imgAsmooth = imfilter(single(imgA), filter);
    imgBsmooth = imfilter(single(imgB), filter);
    
    [fa, da] = vl_sift(single(imgA), 'frames', frameA);
    [fb, db] = vl_sift(single(imgB), 'frames', frameB);
    
    [M, scores] = vl_ubcmatch(da, db);
    
    xa = fa(1,M(1,:)) ;
    xb = fb(1,M(2,:)) + size(imgA,2) ;
    ya = fa(2,M(1,:)) ;
    yb = fb(2,M(2,:)) ;
    
    imshow([imgA, imgB]);
    h = line([xa ; xb], [ya ; yb]) ;
end
