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

%% 1
[Ix, Iy, It] = computeGradients(TestSeq(:, :, 1), TestSeq(:, :, 2));
[u, v] = computeLK(Ix, Iy, It, 5);
f = figure;
quiver(u,v,50);
saveas(f, fullfile('output', 'ps5-1-a-1.png'));

[Ix, Iy, It] = computeGradients(TestSeq(:, :, 1), TestSeq(:, :, 3));
[u, v] = computeLK(Ix, Iy, It, 5);
f = figure;
quiver(u,v,50);
saveas(f, fullfile('output', 'ps5-1-a-2.png'));

[Ix, Iy, It] = computeGradients(TestSeq(:, :, 1), TestSeq(:, :, 4));
[u, v] = computeLK(Ix, Iy, It, 5);
f = figure;
quiver(u,v,50);
saveas(f, fullfile('output', 'ps5-1-b-1.png'));

[Ix, Iy, It] = computeGradients(TestSeq(:, :, 1), TestSeq(:, :, 5));
[u, v] = computeLK(Ix, Iy, It, 5);
f = figure;
quiver(u,v,50);
saveas(f, fullfile('output', 'ps5-1-b-2.png'));

[Ix, Iy, It] = computeGradients(TestSeq(:, :, 1), TestSeq(:, :, 6));
[u, v] = computeLK(Ix, Iy, It, 5);
f = figure;
quiver(u,v,50);
saveas(f, fullfile('output', 'ps5-1-b-3.png'));

%% 2a
G0 = double(DataSeq1(:,:,1));
G1 = reduce(G0);
G2 = reduce(G1);
G3 = reduce(G2);
