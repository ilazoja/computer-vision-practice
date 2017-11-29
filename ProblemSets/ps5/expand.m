function reducedImg = expand(img)
%REDUCE Summary of this function goes here
%   Detailed explanation goes here
    kw = 5; % default kernel width
    cw = .375; % kernel centre weight, same as MATLAB func impyramid. 0.6 in the Paper
    ker1d = [.25-cw/2 .25 cw .25 .25-cw/2];
    kernel = kron(ker1d,ker1d')*4;;
end

