% ps2

%% 1-a
% Read images
L = im2double(imread(fullfile('input', 'pair0-L.png')));
R = im2double(imread(fullfile('input', 'pair0-R.png')));

% Compute disparity
D_L = disparity_ssd(L, R, 10);
D_R = disparity_ssd(R, L, 10);

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

% Compute disparity
D_L = disparity_ssd(L, R, 100);
D_R = disparity_ssd(R, L, 100);

% Save output images (D_L as output/ps2-1-a-1.png and D_R as output/ps2-1-a-2.png)
% Note: They may need to be scaled/shifted before saving to show results properly
f = figure();
imshow(D_L, [0 2]);
saveas(f, fullfile('output', 'ps2-2-a-1.png'));
close(f);

f = figure();
imshow(D_R, [-2 0]);
saveas(f, fullfile('output', 'ps2-2-a-2.png'));
close(f);