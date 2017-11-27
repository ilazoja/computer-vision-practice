close all;
run('C:/Ilir/ComputerVision/Vlfeat/vlfeat-0.9.20/toolbox/vl_setup')

simA = imread(fullfile('input', 'simA.jpg'));
simB = imread(fullfile('input', 'simB.jpg'));
transA = imread(fullfile('input', 'transA.jpg'));
transB = imread(fullfile('input', 'transB.jpg'));

%% 1-a
[Ix1A, Iy1A, I1A] = computeGradients(simA);
% [Ix1B, Iy1B, I1B] = computeGradients(simB);
% imshow(I1A);
% [Ix2A, Iy2A, I1A] = computeGradients(transA);
% [Ix2B, Iy2B, I2B] = computeGradients(transB);

%% 1-b
Rm1A = computeHarrisValues(Ix1A, Iy1A, 0.04, 21, 3);
% Rm1B = computeHarrisValues(Ix1B, Iy1B, 0.04, 21, 3);
% Rm2A = computeHarrisValues(Ix2A, Iy2A, 0.04, 21, 3);
% Rm2B = computeHarrisValues(Ix2B, Iy2B, 0.04, 21, 3);

%% 1-c
Rm1A = adjustHarris(Rm1A, 0.5, 5);
% Rm1B = adjustHarris(Rm1B, 0.5, 5);
% Rm2A = adjustHarris(Rm2A, 0.5, 5);
% Rm2B = adjustHarris(Rm2B, 0.5, 5);

%% 2-a
[row, col] = find(Rm1A ~= 0);
angles = atan2(Ix1A, Iy1A);

selectedAngles = zeros(size(row));
for i = 1:size(row)
    selectedAngles(i) = angles(row(i), col(i));
end
frame = [col  row  ones(size(row))*10  selectedAngles]';
imshow(simA);
h1 = vl_plotframe(frame);
set(h1,'color','k','linewidth',3) ;
set(h2,'color','y','linewidth',2) ;