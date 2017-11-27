function Rm = adjustHarris(Rm, threshold, radius)
%ADJUSTHARRIS thresholding and non maximum supression
    % Extract local maxima by performing a grey scale morphological
	% dilation and then finding points in the corner strength image that
	% match the dilated image and are also greater than the threshold.
	sze = 2*radius+1;                   % Size of mask.
	mx = ordfilt2(Rm,sze^2,ones(sze)); % Grey-scale dilate.
	b = (Rm==mx)&(Rm>threshold);       % Find maxima.
    Rm = Rm .* b;
    imshow(Rm);
end

