function [gx, gy, gt] = computeGradients(frame1, frame2)
    [gx gy] = imgradientxy(frame1, 'sobel'); % gradient at frame 1 (assuming minimal change)
%     gx = gx - min(gx(:));
%     gx = gx ./ max(gx(:));
%     gy = gy - min(gy(:));
%     gy = gy ./ max(gy(:));
    gt = double(frame1) - double(frame2);
%     gt = gt - min(gt(:));
%     gt = gt ./ max(gt(:));
end