function [u, v] = computeGradients(im1, im2, wSize)
    w = round(wSize/2);

    % Lucas Kanade Here
    % for each point, calculate I_x, I_y, I_t
    Ix_m = conv2(im1,[-1 1; -1 1], 'valid'); % partial on x
    Iy_m = conv2(im1, [-1 -1; 1 1], 'valid'); % partial on y
    It_m = conv2(im1, ones(2), 'valid') + conv2(im2, -ones(2), 'valid'); % partial on t
    u = zeros(size(im1));
    v = zeros(size(im2));

    % within window ww * ww
    for i = w+1:size(Ix_m,1)-w
        for j = w+1:size(Ix_m,2)-w
            Ix = Ix_m(i-w:i+w, j-w:j+w);
            Iy = Iy_m(i-w:i+w, j-w:j+w);
            It = It_m(i-w:i+w, j-w:j+w);

            Ix = Ix(:);
            Iy = Iy(:);
            b = -It(:); % get b here

            A = [Ix Iy]; % get A here
            nu = pinv(A)*b; % get velocity here

            u(i,j)=nu(1);
            v(i,j)=nu(2);
        end;
     end
%     % size must be odd, has to have middle pixel
% %     middle = (wSize + 1)/2;
% %     u = zeros(size(gt, 1) - middle*2);
% %     v = zeros(size(gt, 2) - middle*2);
% %     for i = middle : size(gt, 1) - middle
% %         for j = middle : size(gt, 1) - middle
% %             Ix2 = gx(i,j).^2;
% %             IxI
% %         end
% %     end
% 
%     Gxy = fspecial('gaussian', [5 5]);
% 
%     % products of derivatives
%     Ix2 = Ix .^ 2;
%     Iy2 = Iy .^ 2;
%     Ixy = Ix .* Iy;
%     Ixt = Ix .* It;
%     Iyt = Iy .* It;
%     
%     % sums of the products of derivatives at each pixel
% 
%     %window convolved with derivatives
%     Sx2 = conv2(Ix2, Gxy, 'same');
%     Sy2 = conv2(Iy2, Gxy, 'same');
%     Sxy = conv2(Ixy, Gxy, 'same');
%     Sxt = conv2(Ixt, Gxy, 'same');
%     Syt = conv2(Iyt, Gxy, 'same');
% 
%     numOfRows = size(Sxy,1);
%     numOfColumns = size(Sxy,2);
%     
%     u = zeros(numOfRows, numOfColumns);
%     v = zeros(numOfRows, numOfColumns);
%     for x=1:numOfRows,
%         for y=1:numOfColumns,
%             % 4) Define at each pixel(x, y)
%             ATA = [Sx2(x, y) Sxy(x, y); Sxy(x, y) Sy2(x, y)];
%             ATb = [Sxt(x, y); Syt(x, y)];
%             % 5) Compute u,v at each pixel
%             uv = ATA\ATb;
%             if isnan(uv(1)) == 1
%                 u(x,y) = 0;
%             else
%                 u(x,y) = uv(1);
%             end
%             if isnan(uv(2)) == 1
%                 v(x,y) = 0;
%             else
%                 v(x,y) = uv(2);
%             end
%         end
%     end
end
