function pf_tracker(videoFile, txtFile, varargin)

    p = inputParser;
    addOptional(p, 'framesToSave', []);
    addParameter(p, 'infix', 'a');
    addParameter(p, 'playVideo', true);
    addParameter(p, 'numParticles', 100);
    addParameter(p, 'dimensions', 2);
    addParameter(p, 'control', 10);
    addParameter(p, 'simstd', 20);
    addParameter(p, 'alpha', 0);
    parse(p, varargin{:});

    % numpeaks = p.Results.numpeaks;
    % threshold = p.Results.Threshold;
    % nHoodSize = p.Results.NHoodSize;
    
    % retrieve first frame
    v = VideoReader(fullfile('input', videoFile));
    frame = readFrame(v);
    grayFrame = rgb2gray(frame);
    searchSpace = size(grayFrame);
    
    % load model coordinates file and retrieve model from first frame
    t = dlmread(fullfile('input', txtFile));
    minx = int16(t(1));
    miny = int16(t(2));
    maxx = int16(t(1) + t(3)); % x + w
    maxy = int16(t(2) + t(4)); % y + h
    
    model = grayFrame(miny:maxy, minx:maxx);
    imwrite(frame(miny:maxy, minx:maxx), fullfile('output',['ps6-' p.Results.infix '-1.png']));
    tracker = particle_filter(model, searchSpace, p.Results.numParticles, p.Results.dimensions, p.Results.control, p.Results.simstd, p.Results.alpha);
end