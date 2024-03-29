function reducedImg = reduce(img)
%REDUCE Summary of this function goes here
%   Detailed explanation goes here
    %filter = [1 4 6 4 1]./ 16;
    %reducedImg = conv2(img, filter, 'same');
    %reducedImg = conv2(reducedImg, filter', 'same');
    %kernel = kron(filter, filter');
    kernelWidth = 5; % default
    cw = .375; % kernel centre weight, same as MATLAB func impyramid. 0.6 in the Paper
    ker1d = [.25-cw/2 .25 cw .25 .25-cw/2];
    kernel = kron(ker1d,ker1d');
    reducedImg = conv2(img, kernel, 'same');
    reducedImg = reducedImg(1:2:end, 1:2:end);
end

