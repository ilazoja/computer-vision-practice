function [H, rho] = hough_circles_acc(BW, radius)
    % Compute Hough accumulator array for finding circles.
    %
    % BW: Binary (black and white) image containing edge pixels
    % radius: Radius of circles to look for, in pixels

    % TODO: Your code here
    
    [y, x] = find(BW~=0);
    theta = 90 + 1;
    aarray = zeros(size(y,1), 89 + theta);
    barray = zeros(size(y,1), 89 + theta);
    for edgeIndex = 1:size(y)
        for angle = -90:89
            a = x(edgeIndex) - radius*cosd(angle);
            b = y(edgeIndex) + radius*sind(angle);
            aarray(edgeIndex, angle + theta) = a;
            barray(edgeIndex, angle + theta) = b;
            %d = uint8(d);
            %H(d, angle) = H(d, angle) + 1;
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
    H = zeros(max(barray(:)), max(aarray(:)));
    index = 1;
    for edgeindex = 1:size(aarray,1)
        for angle = 1:size(aarray,2)
            
            a = aarray(edgeindex,angle);
            b = barray(edgeindex,angle);

            H(b, a) = H(b, a) + 1;    
            index = index + 1;
        end
    end
 %   imshow(H, [0,max(H(:))]);
end