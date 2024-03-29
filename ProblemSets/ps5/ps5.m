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

% expand to color?
% DataSeq2(:,:,:,1) = imread(fullfile('input', 'DataSeq2', '0.png'));
% DataSeq2(:,:,:,2) = imread(fullfile('input', 'DataSeq2', '1.png'));
% DataSeq2(:,:,:,3) = imread(fullfile('input', 'DataSeq2', '2.png'));

DataSeq2(:,:,1) = rgb2gray(imread(fullfile('input', 'DataSeq2', '0.png')));
DataSeq2(:,:,2) = rgb2gray(imread(fullfile('input', 'DataSeq2', '1.png')));
DataSeq2(:,:,3) = rgb2gray(imread(fullfile('input', 'DataSeq2', '2.png')));

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

[u, v] = computeLK(double(TestSeq(:, :, 1)), double(TestSeq(:, :, 2)), 45);
f = figure;
quiver(u,v,10);
saveas(f, fullfile('output', 'ps5-1-a-1.png'));

[u, v] = computeLK(double(TestSeq(:, :, 1)), double(TestSeq(:, :, 3)), 45);
f = figure;
quiver(u,v,10);
saveas(f, fullfile('output', 'ps5-1-a-2.png'));

[u, v] = computeLK(double(TestSeq(:, :, 1)), double(TestSeq(:, :, 3)), 45);
f = figure;
quiver(u,v,10);
saveas(f, fullfile('output', 'ps5-1-a-3.png'));

[u, v] = computeLK(double(TestSeq(:, :, 1)), double(TestSeq(:, :, 4)), 45);
f = figure;
quiver(u,v,10);
saveas(f, fullfile('output', 'ps5-1-a-4.png'));

[u, v] = computeLK(double(TestSeq(:, :, 1)), double(TestSeq(:, :, 5)), 45);
f = figure;
quiver(u,v,10);
saveas(f, fullfile('output', 'ps5-1-a-5.png'));

close all;

% %% 2
% gauss_pyr = gaussPyramid(double(DataSeq1(:,:,1)),3);
% lapl_pyr = laplacePyramid(gauss_pyr);
% 
% %% 3
% gauss_pyr = {};
% % create Gauss pyramid for every frame
% for i = 1:size(DataSeq1,3)
%     gauss_pyr(i,:) = gaussPyramid(double(DataSeq1(:,:,i)),3);
% end
% 
% % frame 1 to frame 2
% for i = 1:size(gauss_pyr,2)
%     [Ix, Iy, It] = computeGradients(gauss_pyr{1,i}, gauss_pyr{2,i});
%     [u, v] = computeLK(Ix, Iy, It, 7);
%     f = figure;
%     quiver(u,v,50);
%     saveas(f, fullfile('output', ['ps5-3-a-1-DataSeq1-' num2str(i) '.png']));
%     warpedFrame = warp(gauss_pyr{2,i},u,v);
%     ogFrame = gauss_pyr{1,i};
%     diff = uint8(abs(ogFrame - warpedFrame));
%     imwrite(diff, fullfile('output', ['ps5-3-a-2-DataSeq1-' num2str(i) '.png']));
% end
% close all;
% % frame 2 to frame 3
% for i = 1:size(gauss_pyr,2)
%     [Ix, Iy, It] = computeGradients(gauss_pyr{2,i}, gauss_pyr{3,i});
%     [u, v] = computeLK(Ix, Iy, It, 7);
%     f = figure;
%     quiver(u,v,50);
%     saveas(f, fullfile('output', ['ps5-3-a-3-DataSeq1-' num2str(i) '.png']));
%     warpedFrame = warp(gauss_pyr{2,i},u,v);
%     ogFrame = gauss_pyr{3,i};
%     diff = uint8(abs(ogFrame - warpedFrame));
%     imwrite(diff, fullfile('output', ['ps5-3-a-4-DataSeq1-' num2str(i) '.png']));
% end
% 
% gauss_pyr = {};
% % create Gauss pyramid for every frame
% for i = 1:size(DataSeq2,3)
%     gauss_pyr(i,:) = gaussPyramid(double(DataSeq2(:,:,i)),5);
% end
% % frame 1 to frame 2
% for i = 1:size(gauss_pyr,2)
%     [Ix, Iy, It] = computeGradients(gauss_pyr{1,i}, gauss_pyr{2,i});
%     [u, v] = computeLK(Ix, Iy, It, 7);
%     f = figure;
%     quiver(u,v,50);
%     saveas(f, fullfile('output', ['ps5-3-a-1-DataSeq2-' num2str(i) '.png']));
%     warpedFrame = warp(gauss_pyr{2,i},u,v);
%     ogFrame = gauss_pyr{1,i};
%     diff = uint8(abs(ogFrame - warpedFrame));
%     imwrite(diff, fullfile('output', ['ps5-3-a-2-DataSeq2-' num2str(i) '.png']));
% end
% close all;
% % frame 2 to frame 3
% for i = 1:size(gauss_pyr,2)
%     [Ix, Iy, It] = computeGradients(gauss_pyr{2,i}, gauss_pyr{3,i});
%     [u, v] = computeLK(Ix, Iy, It, 7);
%     f = figure;
%     quiver(u,v,50);
%     saveas(f, fullfile('output', ['ps5-3-a-3-DataSeq2-' num2str(i) '.png']));
%     warpedFrame = warp(gauss_pyr{2,i},u,v);
%     ogFrame = gauss_pyr{3,i};
%     diff = uint8(abs(ogFrame - warpedFrame));
%     imwrite(diff, fullfile('output', ['ps5-3-a-4-DataSeq2-' num2str(i) '.png']));
% end

%% 3
gauss_pyr = {};
% create Gauss pyramid for every frame
for i = 1:size(DataSeq1,3)
    gauss_pyr(i,:) = gaussPyramid(double(DataSeq1(:,:,i)),3);
end

% frame 1 to frame 2
for i = 1:size(gauss_pyr,2)
    [u, v] = computeLK(gauss_pyr{1,i}, gauss_pyr{2,i}, 45);
    f = figure;
    quiver(u,v,50);
    saveas(f, fullfile('output', ['ps5-3-a-1-DataSeq1-' num2str(i) '.png']));
    warpedFrame = warp(gauss_pyr{2,i},u,v);
    ogFrame = gauss_pyr{1,i};
    diff = uint8(abs(ogFrame - warpedFrame));
    imwrite(diff, fullfile('output', ['ps5-3-a-2-DataSeq1-' num2str(i) '.png']));
end
close all;
% frame 2 to frame 3
for i = 1:size(gauss_pyr,2)
    [u, v] = computeLK(gauss_pyr{2,i}, gauss_pyr{3,i}, 45);
    f = figure;
    quiver(u,v,50);
    saveas(f, fullfile('output', ['ps5-3-a-3-DataSeq1-' num2str(i) '.png']));
    warpedFrame = warp(gauss_pyr{3,i},u,v);
    ogFrame = gauss_pyr{2,i};
    diff = uint8(abs(ogFrame - warpedFrame));
    imwrite(diff, fullfile('output', ['ps5-3-a-4-DataSeq1-' num2str(i) '.png']));
end

gauss_pyr = {};
% create Gauss pyramid for every frame
for i = 1:size(DataSeq2,3)
    gauss_pyr(i,:) = gaussPyramid(double(DataSeq2(:,:,i)),5);
end
% frame 1 to frame 2
for i = 1:size(gauss_pyr,2)
    [u, v] = computeLK(gauss_pyr{1,i}, gauss_pyr{2,i}, 45);
    f = figure;
    quiver(u,v,50);
    saveas(f, fullfile('output', ['ps5-3-a-1-DataSeq2-' num2str(i) '.png']));
    warpedFrame = warp(gauss_pyr{2,i},u,v);
    ogFrame = gauss_pyr{1,i};
    diff = uint8(abs(ogFrame - warpedFrame));
    imwrite(diff, fullfile('output', ['ps5-3-a-2-DataSeq2-' num2str(i) '.png']));
end
close all;
% frame 2 to frame 3
for i = 1:size(gauss_pyr,2)
    [u, v] = computeLK(gauss_pyr{2,i}, gauss_pyr{3,i}, 45);
    f = figure;
    quiver(u,v,50);
    saveas(f, fullfile('output', ['ps5-3-a-3-DataSeq2-' num2str(i) '.png']));
    warpedFrame = warp(gauss_pyr{3,i},u,v);
    ogFrame = gauss_pyr{2,i};
    diff = uint8(abs(ogFrame - warpedFrame));
    imwrite(diff, fullfile('output', ['ps5-3-a-4-DataSeq2-' num2str(i) '.png']));
end

%% 4-a
[U,V] = hierarchicalLK(TestSeq(:,:,1),TestSeq(:,:,4), 5); 
f = figure;
quiver(U,V,50);
saveas(f, fullfile('output', 'ps5-4-a-1-1.png'));
warpedFrame = warp(double(TestSeq(:,:,4)),U,V);
ogFrame = double(TestSeq(:,:,1));
diff = uint8(abs(ogFrame - warpedFrame));
imwrite(diff, fullfile('output', 'ps5-4-a-2-1.png'));

[U,V] = hierarchicalLK(TestSeq(:,:,1),TestSeq(:,:,5), 3); 
f = figure;
quiver(U,V,50);
saveas(f, fullfile('output', 'ps5-4-a-1-2.png'));
warpedFrame = warp(double(TestSeq(:,:,4)),U,V);
ogFrame = double(TestSeq(:,:,1));
diff = uint8(abs(ogFrame - warpedFrame));
imwrite(diff, fullfile('output', 'ps5-4-a-2-2.png'));

[U,V] = hierarchicalLK(DataSeq1(:,:,1),DataSeq1(:,:,2), 3); 
f = figure;
quiver(U,V,50);
saveas(f, fullfile('output', 'ps5-4-b-1-2.png'));
warpedFrame = warp(double(DataSeq1(:,:,2)),U,V);
ogFrame = double(DataSeq1(:,:,1));
diff = uint8(abs(ogFrame - warpedFrame));
imwrite(diff, fullfile('output', 'ps5-4-b-2-1.png'));

[U,V] = hierarchicalLK(DataSeq1(:,:,2),DataSeq1(:,:,3), 3); 
f = figure;
quiver(U,V,50);
saveas(f, fullfile('output', 'ps5-4-b-1-1.png'));
warpedFrame = warp(double(DataSeq1(:,:,3)),U,V);
ogFrame = double(DataSeq1(:,:,2));
diff = uint8(abs(ogFrame - warpedFrame));
imwrite(diff, fullfile('output', 'ps5-4-b-2-2.png'));

