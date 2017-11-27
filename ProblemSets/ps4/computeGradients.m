function [gx, gy, g] = computeGradients(img)
    [gx gy] = imgradientxy(img, 'sobel'); % Note: gx, gy are not normalized
    gx = gx - min(gx(:));
    gx = gx ./ max(gx(:));
    gy = gy - min(gy(:));
    gy = gy ./ max(gy(:));
    g = [gx gy];
end