close all;
%run('C:/Ilir/ComputerVision/Vlfeat/vlfeat-0.9.20/toolbox/vl_setup')
run('C:\Users\Ilir\Documents\Ilir\ComputerVision\VLFeat\vlfeat-0.9.20\toolbox\vl_setup')

filter_size = 21;
filter_sigma = 3;

simA = imread(fullfile('input', 'simA.jpg'));
simB = imread(fullfile('input', 'simB.jpg'));
transA = imread(fullfile('input', 'transA.jpg'));
transB = imread(fullfile('input', 'transB.jpg'));

%% 1-a
[Ix1A, Iy1A, I1A] = computeGradients(simA);
[Ix1B, Iy1B, I1B] = computeGradients(simB);
[Ix2A, Iy2A, I1A] = computeGradients(transA);
[Ix2B, Iy2B, I2B] = computeGradients(transB);

%% 1-b
Rm1A = computeHarrisValues(Ix1A, Iy1A, 0.04, filter_size, filter_sigma);
Rm1B = computeHarrisValues(Ix1B, Iy1B, 0.04, filter_size, filter_sigma);
Rm2A = computeHarrisValues(Ix2A, Iy2A, 0.04, filter_size, filter_sigma);
Rm2B = computeHarrisValues(Ix2B, Iy2B, 0.04, filter_size, filter_sigma);

%% 1-c
Rm1A = adjustHarris(Rm1A, 0.5, 5);
Rm1B = adjustHarris(Rm1B, 0.5, 5);
Rm2A = adjustHarris(Rm2A, 0.5, 5);
Rm2B = adjustHarris(Rm2B, 0.5, 5);

%% 2-a
[selectedAngles1A, points1A] = computeAngles(Rm1A, Ix1A, Iy1A);
frame = [points1A  ones(size(points1A,1),1)*10  selectedAngles1A]';
imshow([simA simB]);
h1 = vl_plotframe(frame);
[selectedAngles1B, points1B] = computeAngles(Rm1B, Ix1B, Iy1B);
frame = [points1B(:,1)+size(simA,2) points1B(:,2)  ones(size(points1B,1),1)*10  selectedAngles1B]';
h2 = vl_plotframe(frame);
[selectedAngles2A, points2A] = computeAngles(Rm2A, Ix2A, Iy2A);
[selectedAngles2B, points2B] = computeAngles(Rm2B, Ix2B, Iy2B);

%% 2-b
Gxy = fspecial('gaussian', filter_size, filter_sigma);
frame1A = [points1A  ones(size(points1A,1),1)  selectedAngles1A]';
frame1B = [points1B  ones(size(points1B,1),1)  selectedAngles1B]';
matchSIFT(simA, simB, frame1A, frame1B, Gxy);
frame2A = [points2A  ones(size(points2A,1),1)  selectedAngles2A]';
frame2B = [points2B  ones(size(points2B,1),1)  selectedAngles2B]';
matchSIFT(transA, transB, frame2A, frame2B, Gxy);

%% 3-a
