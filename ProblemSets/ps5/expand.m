function expandedImg = expand(img)
%REDUCE Summary of this function goes here
%   Detailed explanation goes here
    %filter = [1 4 6 4 1]./ 8;
    kw = 5; % default kernel width
    cw = .375; % kernel centre weight, same as MATLAB func impyramid. 0.6 in the Paper
    ker1d = [.25-cw/2 .25 cw .25 .25-cw/2];
    kernel = kron(ker1d,ker1d')*4;
    %kernel = kron(filter,filter');
    
    sz = size(img(:,:));
    
    osz = sz*2;

    expandedImg = zeros(osz(1),osz(2));
    
	expandedImg(1:2:osz(1),1:2:osz(2)) = img;
	expandedImg = conv2(expandedImg,kernel,'same');

end

