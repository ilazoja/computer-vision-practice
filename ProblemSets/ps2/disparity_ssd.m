function D = disparity_ssd(L, R)
    % Compute disparity map D(y, x) such that: L(y, x) = R(y, x + D(y, x))
    %
    % L: Grayscale left image
    % R: Grayscale right image, same size as L
    % D: Output disparity map, same size as L, R

    %% Define image patch location (topleft [row col]) and size
    
    patch_size = [10 10];
    D = zeros(size(L));
    
    for i = 1:(size(L, 1) - patch_size(1) + 1)
        for j = 1:(size(L, 2) - patch_size(2) + 1)
            patch_loc = [i j];
            
            % Extract patch (from left image)
            patch_left = L(i:(i + patch_size(1) - 1), j:(j + patch_size(2) - 1));
            %figure, imshow(L);

            % Extract strip (from right image)
            strip_right = R(i:(i + patch_size(1) - 1), :);
            %figure, imshow(R);

            % Now look for the patch in the strip and report the best position (column index of topleft corner)
            [best_x, D(i,j)] = find_best_match(patch_left, strip_right);
            disp(best_x);
            patch_right = R(i:(i + patch_size(1) - 1), best_x:(best_x + patch_size(2) - 1));
            %imshow(patch_right);    
            %close all;
        end
    end
end

    % TODO: Your code here
    % Find best match
function [best_x, lowest_ssd] = find_best_match(patch, strip)
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