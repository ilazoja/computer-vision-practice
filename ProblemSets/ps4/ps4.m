close all;

simA = imread(fullfile('input', 'simA.jpg'));
simB = imread(fullfile('input', 'simB.jpg'));
transA = imread(fullfile('input', 'transA.jpg'));
transB = imread(fullfile('input', 'transB.jpg'));

%% 1-a
filter_size = 11;
filter_sigma = 2;
filter = fspecial('gaussian', filter_size, filter_sigma);

[gx gy] = imgradientxy(simA, 'sobel'); % Note: gx, gy are not normalized
imshow(gx);