function reducedImg = reduce(img)
%REDUCE Summary of this function goes here
%   Detailed explanation goes here
    filter = [1 4 6 4 1]./ 16;
    reducedImg = conv2(img, filter, 'same');
    reducedImg = conv2(reducedImg, filter', 'same');
    reducedImg = reducedImg(1:2:end, 1:2:end);
    imshow(reducedImg, [0 255]);
end

