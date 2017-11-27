function Rm = computeHarrisValues(Ix, Iy, a, filter_size, filter_sigma)
    numOfRows = size(Ix,1);
    numOfColumns = size(Ix,2);

    % gaussian window
    Gxy = fspecial('gaussian', filter_size, filter_sigma);

%     [xx, yy] = meshgrid(-halfwid:halfwid, -halfwid:halfwid);
% 
%     Gxy = exp(-(xx .^ 2 + yy .^ 2) / (2 * filter_sigma ^ 2));
%     Gx = xx .* exp(-(xx .^ 2 + yy .^ 2) / (2 * filter_sigma ^ 2));
%     Gy = yy .* exp(-(xx .^ 2 + yy .^ 2) / (2 * filter_sigma ^ 2));

    % products of derivatives
    Ix2 = Ix .^ 2;
    Iy2 = Iy .^ 2;
    Ixy = Ix .* Iy;

    % sums of the products of derivatives at each pixel

    %window convolved with derivatives
    Sx2 = conv2(Gxy, Ix2);
    Sy2 = conv2(Gxy, Iy2);
    Sxy = conv2(Gxy, Ixy);

    Rm = zeros(numOfRows, numOfColumns);
    for x=1:numOfRows,
        for y=1:numOfColumns,
            % 4) Define at each pixel(x, y) the matrix H
            H = [Sx2(x, y) Sxy(x, y); Sxy(x, y) Sy2(x, y)];
       
            % 5) Compute the response of the detector at each pixel
            R = det(H) - a * (trace(H) ^ 2);
       
            Rm(x, y) = R; 
       
        end
    end
    Rm = Rm - min(Rm(:));
    Rm = Rm ./ max(Rm(:));
    imshow(Rm);
end

