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
    for i = 1:size(H,1)
        for j = 1:size(H,2)
            if H(i,j) > threshold & numPeaksFound < numpeaks
                peaks(numPeaksFound, 1) = i;
                peaks(numPeaksFound, 2) = j;
                numPeaksFound = numPeaksFound + 1;
                for supi = 1:(nHoodSize(1)-1)/2
                    for supj = 1:(nHoodSize(2)-1)/2
                        H(i+supi, j+supj) = 0;
                    end
                end
            end
        end
    end   
end
