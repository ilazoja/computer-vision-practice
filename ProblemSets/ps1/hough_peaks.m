function peaks = hough_peaks(H, varargin)
    % Find peaks in a Hough accumulator array.
    %
    % Threshold (optional): Threshold at which values of H are considered to be peaks
    % NHoodSize (optional): Size of the suppression neighborhood, [M N]
    %
    % Please see the Matlab documentation for houghpeaks():
    % http://www.mathworks.com/help/images/ref/houghpeaks.html
    % Your code should imitate the matlab implementation.

    %% Parse input arguments
    p = inputParser;
    addOptional(p, 'numpeaks', 1, @isnumeric);
    addParameter(p, 'Threshold', 0.5 * max(H(:)));
    addParameter(p, 'NHoodSize', floor(size(H) / 100.0) * 2 + 1);  % odd values >= size(H)/50
    parse(p, varargin{:});

    numpeaks = p.Results.numpeaks;
    threshold = p.Results.Threshold;
    nHoodSize = p.Results.NHoodSize;

    % TODO: Your code here
    peaks = [];
    numPeaksFound = 1;
    filterArray = zeros(nHoodSize(1), nHoodSize(2));
   
    
    for i = 1:size(H,1)
        for j = 1:size(H,2)
            if H(i,j) > threshold && numPeaksFound < numpeaks
                peaks(numPeaksFound, 1) = i;
                peaks(numPeaksFound, 2) = j;
                numPeaksFound = numPeaksFound + 1;
                
                filterArray((nHoodSize(1)+1)/2,(nHoodSize(2)+1)/2) = H(i,j);
                up = i-(nHoodSize(1)-1)/2;
                diffup = 0;
                if up < 1
                    diffup = 1 - up;
                    up = 1;
                end
                down = i+(nHoodSize(1)-1)/2;
                diffdown = 0;
                if down > size(H,1)
                    diffdown = down - size(H,1);
                    down = size(H,1);
                end
                left = j-(nHoodSize(2)-1)/2;
                diffleft = 0;
                if left < 1
                    diffleft = 1 - left;
                    left = 1;
                end
                right = j+(nHoodSize(2)-1)/2;
                diffright = 0;
                if right > size(H,2)
                    diffright = right - size(H,2);
                    right = size(H,2);
                end
                
                H(up:down,left:right) = filterArray(1+diffup:size(filterArray,1)-diffdown, 1+diffleft:size(filterArray,2)-diffright);
            end
        end
    end   
end
