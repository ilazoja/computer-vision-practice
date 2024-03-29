function D = disparity_ncorr(L, R, b, overlap, rangeToCheck)
    % Compute disparity map D(y, x) such that: L(y, x) = R(y, x + D(y, x))
    %
    % L: Grayscale left image
    % R: Grayscale right image, same size as L
    % D: Output disparity map, same size as L, R

    % TODO: Your code here
    
    num_row_blocks = floor(size(L, 1) / b);
    num_col_blocks = floor(size(L, 2) / b);
    D = zeros(size(L));
    
    
    if overlap   
        for i = 1:(size(L, 1) - b)
            for j = 1:(size(L, 2) - b)
                x_left = j; %*b + 1;
                x_up = i; %*b + 1;
                patch_left = L(x_up:(x_up + b - 1), x_left:(x_left + b - 1));
                strip_right = R(x_up:(x_up + b - 1), :);
                %figure, imshow(patch_left);
                %figure, imshow(strip_right);
                %close all;
            
                [x_right] = find_best_match(patch_left, strip_right, j, rangeToCheck);
                D(x_up,x_left) = x_left - x_right;
                %disp(D(x_left,x_up));
                %patch_right = R(i:(i + patch_size(1) - 1), D(x_left,x_up):(D(x_left,x_up) + patch_size(2) - 1));
                %imshow(patch_right);    
                %close all;
            end
        end
    else
        for i = 0:(num_row_blocks - 1)
            for j = 0:(num_col_blocks - 1)
                x_left = j*b + 1;
                x_up = i*b + 1;
                patch_left = L(x_up:(x_up + b - 1), x_left:(x_left + b - 1));
                strip_right = R(x_up:(x_up + b - 1), :);
            
                [x_right] = find_best_match(patch_left, strip_right, rangeToCheck);
                D(x_left:x_left + b ,x_up:x_up + b) = x_left - x_right;
            end
        end
    end
    
end

    % TODO: Your code here
    % Find best match
function [best_x] = find_best_match(patch, strip, j, rangeToCheck)
    % TODO: Find patch in strip and return column index (x value) of topleft corner
    c = normxcorr2(patch,strip);
    [ypeak, xpeak] = find(c==max(c(:)));
    yoffSet = ypeak-size(patch,1);
    best_x = xpeak-size(patch,2);
end
