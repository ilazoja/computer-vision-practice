close all;
TestSeq(:,:,1) = imread(fullfile('input', 'TestSeq', 'Shift0.png'));
TestSeq(:,:,2) = imread(fullfile('input', 'TestSeq', 'ShiftR2.png'));
TestSeq(:,:,3) = imread(fullfile('input', 'TestSeq', 'ShiftR5U5.png'));
TestSeq(:,:,4) = imread(fullfile('input', 'TestSeq', 'ShiftR10.png'));
TestSeq(:,:,5) = imread(fullfile('input', 'TestSeq', 'ShiftR20.png'));
TestSeq(:,:,6) = imread(fullfile('input', 'TestSeq', 'ShiftR40.png'));

DataSeq1(:,:,1) = imread(fullfile('input', 'DataSeq1', 'yos_img_01.jpg'));
DataSeq1(:,:,2) = imread(fullfile('input', 'DataSeq1', 'yos_img_02.jpg'));
DataSeq1(:,:,3) = imread(fullfile('input', 'DataSeq1', 'yos_img_03.jpg'));

DataSeq2(:,:,:,1) = imread(fullfile('input', 'DataSeq2', '0.png'));
DataSeq2(:,:,:,2) = imread(fullfile('input', 'DataSeq2', '1.png'));
DataSeq2(:,:,:,3) = imread(fullfile('input', 'DataSeq2', '2.png'));
% 
% %% 1
% [Ix, Iy, It] = computeGradients(TestSeq(:, :, 1), TestSeq(:, :, 2));
% [u, v] = computeLK(Ix, Iy, It, 5);
% f = figure;
% quiver(u,v,50);
% saveas(f, fullfile('output', 'ps5-1-a-1.png'));
% 
% [Ix, Iy, It] = computeGradients(TestSeq(:, :, 1), TestSeq(:, :, 3));
% [u, v] = computeLK(Ix, Iy, It, 5);
% f = figure;
% quiver(u,v,50);
% saveas(f, fullfile('output', 'ps5-1-a-2.png'));
% 
% [Ix, Iy, It] = computeGradients(TestSeq(:, :, 1), TestSeq(:, :, 4));
% [u, v] = computeLK(Ix, Iy, It, 5);
% f = figure;
% quiver(u,v,50);
% saveas(f, fullfile('output', 'ps5-1-b-1.png'));
% 
% [Ix, Iy, It] = computeGradients(TestSeq(:, :, 1), TestSeq(:, :, 5));
% [u, v] = computeLK(Ix, Iy, It, 5);
% f = figure;
% quiver(u,v,50);
% saveas(f, fullfile('output', 'ps5-1-b-2.png'));
% 
% [Ix, Iy, It] = computeGradients(TestSeq(:, :, 1), TestSeq(:, :, 6));
% [u, v] = computeLK(Ix, Iy, It, 5);
% f = figure;
% quiver(u,v,50);
% saveas(f, fullfile('output', 'ps5-1-b-3.png'));

%% 2
gauss_pyr = gaussPyramid(double(DataSeq1(:,:,1)),3);
lapl_pyr = laplacePyramid(gauss_pyr);

%% 3

% create Gauss pyramid for every frame
for i = 1:size(DataSeq1,3)
    gauss_pyr(i,:) = gaussPyramid(double(DataSeq1(:,:,i)),3);
end

% frame 1 to frame 2
for i = 1:size(gauss_pyr,2)
    [Ix, Iy, It] = computeGradients(gauss_pyr{1,i}, gauss_pyr{2,i});
    [u, v] = computeLK(Ix, Iy, It, 7);
    f = figure;
    quiver(u,v,50);
    saveas(f, fullfile('output', ['ps5-3-a-1-' num2str(i) '.png']));
    warpedFrame = warp(gauss_pyr{2,i},u,v);
    ogFrame = gauss_pyr{1,i};
    diff = uint8(abs(ogFrame - warpedFrame));
    imwrite(diff, fullfile('output', ['ps5-3-a-2-' num2str(i) '.png']));
end
close all;
% frame 2 to frame 3
for i = 1:size(gauss_pyr,2)
    [Ix, Iy, It] = computeGradients(gauss_pyr{2,i}, gauss_pyr{3,i});
    [u, v] = computeLK(Ix, Iy, It, 7);
    f = figure;
    quiver(u,v,50);
    saveas(f, fullfile('output', ['ps5-3-a-3-' num2str(i) '.png']));
    warpedFrame = warp(gauss_pyr{2,i},u,v);
    ogFrame = gauss_pyr{3,i};
    diff = uint8(abs(ogFrame - warpedFrame));
    imwrite(diff, fullfile('output', ['ps5-3-a-4-' num2str(i) '.png']));
end

