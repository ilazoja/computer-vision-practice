% ps2

%% 1-a
% Read images
L = im2double(imread(fullfile('input', 'pair0-L.png')));
R = im2double(imread(fullfile('input', 'pair0-R.png')));

% Compute disparity
D_L = disparity_ssd(L, R, 10, true, -size(L, 2));
D_R = disparity_ssd(R, L, 10, true, size(L, 2));

% TODO: Save output images (D_L as output/ps2-1-a-1.png and D_R as output/ps2-1-a-2.png)
% Note: They may need to be scaled/shifted before saving to show results properly
f = figure();
imshow(D_L, [0 2]);
saveas(f, fullfile('output', 'ps2-1-a-1.png'));
close(f);

f = figure();
imshow(D_R, [-2 0]);
saveas(f, fullfile('output', 'ps2-1-a-2.png'));
close(f);

% TODO: Rest of your code here
%% 2-a
% Read images
L = im2double(imread(fullfile('input', 'pair1-L.png')));
R = im2double(imread(fullfile('input', 'pair1-R.png')));

L = rgb2gray(L);
R = rgb2gray(R);

% Compute disparity
D_L = disparity_ssd(L, R, 20, true, -100);
D_R = disparity_ssd(R, L, 20, true, 100);

% Save output images (D_L as output/ps2-1-a-1.png and D_R as output/ps2-1-a-2.png)
% Note: They may need to be scaled/shifted before saving to show results properly
f = figure();
imshow(D_L, [0 max(D_L(:))]);
saveas(f, fullfile('output', 'ps2-2-a-1.png'));
close(f);

f = figure();
imshow(D_R, [min(D_R(:)) 0]);
saveas(f, fullfile('output', 'ps2-2-a-2.png'));
close(f);

%% 3-a
noise_sigma = 25;
noise = randn(size(L)) .* noise_sigma;
noisy_L = L + noise;

% Compute disparity
D_L = disparity_ssd(noisy_L, R, 20, true, -100);
D_R = disparity_ssd(R, noisy_L, 20, true, 100);

% Save output images (D_L as output/ps2-1-a-1.png and D_R as output/ps2-1-a-2.png)
% Note: They may need to be scaled/shifted before saving to show results properly
f = figure();
imshow(D_L, [0 max(D_L(:))]);
saveas(f, fullfile('output', 'ps2-3-a-1.png'));
close(f);

f = figure();
imshow(D_R, [min(D_R(:)) 0]);
saveas(f, fullfile('output', 'ps2-3-a-2.png'));
close(f);

%% 3-b
brighter_L = L .* 1.10;

% Compute disparity
D_L = disparity_ssd(brighter_L, R, 20, true, -100);
D_R = disparity_ssd(R, brighter_L, 20, true, 100);

% Save output images (D_L as output/ps2-1-a-1.png and D_R as output/ps2-1-a-2.png)
% Note: They may need to be scaled/shifted before saving to show results properly
f = figure();
imshow(D_L, [0 max(D_L(:))]);
saveas(f, fullfile('output', 'ps2-3-a-1.png'));
close(f);

f = figure();
imshow(D_R, [min(D_R(:)) 0]);
saveas(f, fullfile('output', 'ps2-3-a-2.png'));
close(f);

%% 4-a

% Compute disparity
D_L = disparity_ncorr(L, R, 100, true, 100);
D_R = disparity_ncorr(R, L, 100, true, 100);

% Save output images (D_L as output/ps2-1-a-1.png and D_R as output/ps2-1-a-2.png)
% Note: They may need to be scaled/shifted before saving to show results properly
f = figure();
imshow(D_L, [0 max(D_L(:))]);
saveas(f, fullfile('output', 'ps2-4-a-1.png'));
close(f);

f = figure();
imshow(D_R, [min(D_R(:)) 0]);
saveas(f, fullfile('output', 'ps2-4-a-2.png'));
close(f);

%% 4-b

% Compute disparity
D_L = disparity_ncorr(noisy_L, R, 50, true, 100);
D_R = disparity_ncorr(R, noisy_L, 50, true, 100);

% Save output images (D_L as output/ps2-1-a-1.png and D_R as output/ps2-1-a-2.png)
% Note: They may need to be scaled/shifted before saving to show results properly
f = figure();
imshow(D_L, [0 max(D_L(:))]);
saveas(f, fullfile('output', 'ps2-4-b-1.png'));
close(f);

f = figure();
imshow(D_R, [min(D_R(:)) 0]);
saveas(f, fullfile('output', 'ps2-4-b-2.png'));
close(f);

% Compute disparity
D_L = disparity_ncorr(brighter_L, R, 50, true, 100);
D_R = disparity_ncorr(R, brighter_L, 50, true, 100);

% Save output images (D_L as output/ps2-1-a-1.png and D_R as output/ps2-1-a-2.png)
% Note: They may need to be scaled/shifted before saving to show results properly
f = figure();
imshow(D_L, [0 max(D_L(:))]);
saveas(f, fullfile('output', 'ps2-4-b-3.png'));
close(f);

f = figure();
imshow(D_R, [min(D_R(:)) 0]);
saveas(f, fullfile('output', 'ps2-4-b-4.png'));
close(f);

%% 5-a
% Read images
L = im2double(imread(fullfile('input', 'pair2-L.png')));
R = im2double(imread(fullfile('input', 'pair2-R.png')));

L = rgb2gray(L);
R = rgb2gray(R);

% Compute disparity
D_L = disparity_ncorr(L, R, 50, true, -size(L, 2));
D_R = disparity_ncorr(R, L, 50, true, size(L, 2));

% TODO: Save output images (D_L as output/ps2-1-a-1.png and D_R as output/ps2-1-a-2.png)
% Note: They may need to be scaled/shifted before saving to show results properly
f = figure();
imshow(D_L, [0 2]);
saveas(f, fullfile('output', 'ps2-5-a-1.png'));
close(f);

f = figure();
imshow(D_R, [-2 0]);
saveas(f, fullfile('output', 'ps2-5-a-2.png'));
close(f);