function gauss_pyr = gaussPyramid(img, levels)
%GAUSSPYRAMID Summary of this function goes here
%   Detailed explanation goes here
    gauss_pyr = {};
    gauss_pyr{1} = img;
    tmp = img;
    for i = 1:levels
        tmp = reduce(tmp);
        gauss_pyr{i+1} = tmp;
    end
end

