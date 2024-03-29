function [centers, radii] = find_circles(BW, radius_range)
    % Find circles in given radius range using Hough transform.
    %
    % BW: Binary (black and white) image containing edge pixels
    % radius_range: Range of circle radii [min max] to look for, in pixels

    % TODO: Your code here
    
        % Compute Hough accumulator array for finding circles.
    %
    % BW: Binary (black and white) image containing edge pixels
    % radius: Radius of circles to look for, in pixels

    % TODO: Your code here
    
    [y, x] = find(BW~=0);
    
    theta = 90 + 1;
    aarray = zeros(size(y,1), 89 + theta, radius_range(2));
    barray = zeros(size(y,1), 89 + theta, radius_range(2));
    for edgeIndex = 1:size(y)
        for angle = -90:89
            for radius = radius_range(1):radius_range(2)
                a = x(edgeIndex) - radius*cosd(angle);
                b = y(edgeIndex) + radius*sind(angle);
                aarray(edgeIndex, angle + theta, radius) = a;
                barray(edgeIndex, angle + theta, radius) = b;
            
            %H(d, angle) = H(d, angle) + 1;
            end
        end
    end 
    
    % avoid negatives and round to have it as integer
    rho = min(min(aarray(:)), min(barray(:))) - 1;
    aarray = uint16((aarray - rho));
    barray = uint16((barray - rho));
    
    % put into bins
    %maximum = max(darray(:));
    %bins = 1:rhoStep:maximum+rhoStep;
    %darray = discretize(darray,bins);
    H = zeros(max(barray(:)), max(aarray(:)), size(aarray,3));
    index = 1;
    for edgeindex = 1:size(aarray,1)
        for angle = 1:size(aarray,2)
            for radius = radius_range(1):radius_range(2)
            
                a = aarray(edgeindex,angle, radius);
                b = barray(edgeindex,angle, radius);

                H(b, a, radius) = H(b, a, radius) + 1;    
                index = index + 1;
            end
        end
    end
    
    [centers, radii] = hough_peaks_3d(H, 30, 'Threshold', 0.5 * max(H(:)), 'NHoodSize', floor(size(H) / 100.0) * 6 + 1);
    centers(:) = centers(:) + rho;

    
    
    
%saveas(f, fullfile('output', 'ps1-5-a-3.png')); 
    %   imshow(H, [0,max(H(:))]);
end
