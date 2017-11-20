function D = disparity_ssd(L, R, b)
    % Compute disparity map D(y, x) such that: L(y, x) = R(y, x + D(y, x))
    %
    % L: Grayscale left image
    % R: Grayscale right image, same size as L
    % D: Output disparity map, same size as L, R

    %% Define image patch location (topleft [row col]) and size
    
    num_row_blocks = floor(size(L, 1) / b);
    num_col_blocks = floor(size(L, 2) / b);
    D = zeros(size(L));
    
    for i = 1:(size(L, 1) - b)
        for j = 1:(size(L, 2) - b)
            x_left = j; %*b + 1;
            x_up = i; %*b + 1;
            patch_left = L(x_up:(x_up + b - 1), x_left:(x_left + b - 1));
            strip_right = R(x_up:(x_up + b - 1), :);
            %figure, imshow(patch_left);
            %figure, imshow(strip_right);
            %close all;
            
            [x_right] = find_best_match(patch_left, strip_right);
            D(x_left,x_up) = x_left - x_right;
            %disp(D(x_left,x_up));
            %patch_right = R(i:(i + patch_size(1) - 1), D(x_left,x_up):(D(x_left,x_up) + patch_size(2) - 1));
            %imshow(patch_right);    
            %close all;
        end
    end
end

    % TODO: Your code here
    % Find best match
function [best_x] = find_best_match(patch, strip)
    % TODO: Find patch in strip and return column index (x value) of topleft corner
    best_x = 1; % placeholder
    lowest_ssd = Inf;
    for x = 1:(size(strip, 2) - size(patch, 2) + 1)
        patch_compare = strip(:, x:(x+size(patch) - 1));
        diff = patch_compare - patch;
        ssd = sum(diff(:).^2);
        if ssd < lowest_ssd
            lowest_ssd = ssd;
            best_x = x;
        end
    end
end