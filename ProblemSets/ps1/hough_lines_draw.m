function hough_lines_draw(img, outfile, peaks, rho, theta)
    % Draw lines found in an image using Hough transform.
    %
    % img: Image on top of which to draw lines
    % outfile: Output image filename to save plot as
    % peaks: Qx2 matrix containing row, column indices of the Q peaks found in accumulator
    % rho: Vector of rho values, in pixels
    % theta: Vector of theta values, in degrees

    % TODO: Your code here
    clf;
    f = figure();
    imshow(img)
    hold on;
    x0 = 1;
    xend = size(img,2);
    
    for peakNumber = 1:size(peaks,1)
        y0 = (x0*cosd(peaks(peakNumber,2)+theta) - (peaks(peakNumber,1)+rho))/sind(peaks(peakNumber,2)+theta);
        yend = (xend*cosd(peaks(peakNumber,2)+theta) - (peaks(peakNumber,1)+rho))/sind(peaks(peakNumber,2)+theta);
        
        if y0 == -Inf
            line([peaks(peakNumber,1)+rho peaks(peakNumber,1)+rho], [1 size(img,2)], 'Color', 'blue');
        else
            %// Draw the line
            line([x0 xend], [y0 yend], 'Color', 'blue');
        end
    end  
    saveas(f, fullfile('output', outfile));
    close(f);
end
