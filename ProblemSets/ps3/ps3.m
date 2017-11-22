%% 1-a
points2D = dlmread(fullfile('input','pts2d-norm-pic_a.txt'));
points3D = dlmread(fullfile('input','pts3d-norm.txt'));

points3D(:, 4) = 1;
points2D(:, 3) = 1;

%points2D = points2D';
%points3D = points3D';

A = [];
%% generate A
for i = 1:size(points3D,1)
    A(i,1) = points3D(i,1);
    A(i,2) = points3D(i,2);
    A(i,3) = points3D(i,3);
    A(i,4) = 1;
    A(i,5) = 0;
    A(i.6) = 0;
    A(i,7) = 0;
    A(i,8) = 0;
end

%% review Direct Linear Calibration Homogenous part 2
% https://cseweb.ucsd.edu/classes/wi07/cse252a/homography_estimation/homography_estimation.pdf