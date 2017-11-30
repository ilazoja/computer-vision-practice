function [u, v] = computeGradients(Ix, Iy, It, wSize)
    % size must be odd, has to have middle pixel
%     middle = (wSize + 1)/2;
%     u = zeros(size(gt, 1) - middle*2);
%     v = zeros(size(gt, 2) - middle*2);
%     for i = middle : size(gt, 1) - middle
%         for j = middle : size(gt, 1) - middle
%             Ix2 = gx(i,j).^2;
%             IxI
%         end
%     end

    Gxy = fspecial('gaussian', [wSize wSize]);

    % products of derivatives
    Ix2 = Ix .^ 2;
    Iy2 = Iy .^ 2;
    Ixy = Ix .* Iy;
    Ixt = Ix .* It;
    Iyt = Iy .* It;
    
    % sums of the products of derivatives at each pixel

    %window convolved with derivatives
    Sx2 = conv2(Ix2, Gxy, 'same');
    Sy2 = conv2(Iy2, Gxy, 'same');
    Sxy = conv2(Ixy, Gxy, 'same');
    Sxt = conv2(Ixt, Gxy, 'same');
    Syt = conv2(Iyt, Gxy, 'same');

    numOfRows = size(Sxy,1);
    numOfColumns = size(Sxy,2);
    
    u = zeros(numOfRows, numOfColumns);
    v = zeros(numOfRows, numOfColumns);
    for x=1:numOfRows,
        for y=1:numOfColumns,
            % 4) Define at each pixel(x, y)
            ATA = [Sx2(x, y) Sxy(x, y); Sxy(x, y) Sy2(x, y)];
            ATb = [Sxt(x, y); Syt(x, y)];
            % 5) Compute u,v at each pixel
            uv = ATA\ATb;
            u(x,y) = uv(1);
            v(x,y) = uv(2);
            
        end
    end
end
