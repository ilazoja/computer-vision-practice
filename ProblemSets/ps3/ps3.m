close all;

%% 1-a
points2D = dlmread(fullfile('input','pts2d-norm-pic_a.txt'));
points3D = dlmread(fullfile('input','pts3d-norm.txt'));

points3D(:, 4) = 1;
points2D(:, 3) = 1;

points2D = points2D';
points3D = points3D';

m = leastSquaresCalibration(points3D, points2D);
testPoints2D = m*points3D;
testPoints2D = testPoints2D ./ testPoints2D(3,:);

residual = (testPoints2D(1,:) - points2D(1,:).^2 + (testPoints2D(2,:) - points2D(2,:)).^2).^0.5;

%% 1b

points2D = dlmread(fullfile('input','pts2d-pic_b.txt'));
points3D = dlmread(fullfile('input','pts3d.txt'));
points3D(:, 4) = 1;
points2D(:, 3) = 1;
points2D = points2D';
points3D = points3D';

lowestResidual = inf;
avgResiduals = zeros(10,3);
mBest = [];

for sampleSize = 8:4:16
    for iteration = 1:10
        idx = randperm(size(points3D, 2), sampleSize);
        sampledPoints2D = points2D(:,idx);
        sampledPoints3D = points3D(:,idx);
        
        m = leastSquaresCalibration(points3D, points2D);

        % get indices that were not in random sample
        i = 1:size(points2D, 2);
        i = ismember(i,idx);    
        i = find(i == 0);
        i = i(1:4);
        
        % pick 4 points not in set and transform into 2D
        testPoints2D = m*points3D(:,i);
        testPoints2D = testPoints2D ./ testPoints2D(3,:);
        
        % get residual between known and transformed
        residual = (testPoints2D(1,:) - points2D(1,i).^2 + (testPoints2D(2,:) - points2D(2,i)).^2).^0.5;
        avgResidual = mean(residual);
        avgResiduals(iteration,(sampleSize - 4)/4) = avgResidual;
        
        if avgResidual < lowestResidual
            lowestResidual = avgResidual;
            mBest = m;  
        end
    end
end

%% 1c
Q = mBest(:,1:3);
m4 = mBest(:,4);
invQ = inv(Q);
C = -invQ*m4;

%% 2a
points2Da = dlmread(fullfile('input','pts2d-pic_a.txt'));
points2Db = dlmread(fullfile('input','pts2d-pic_b.txt'));

points2Da(:, 3) = 1;
points2Db(:, 3) = 1;

points2Da = points2Da';
points2Db = points2Db';

f = leastSquaresFundamental(points2Da, points2Db);

%% 2b
[U, S, V] = svd(f);
S(size(S,2), size(S,2)) = 0;
f = U*S*V';
lb = f*points2Da;

%% 2c
pic_b = imread(fullfile('input', 'pic_b.jpg'));

% get extreme points from picture in homogenous
Al = [0 0 1];
Ar = [0 size(pic_b, 2) 1];
Bl = [size(pic_b, 1) 0 1];
Br = [size(pic_b, 1) size(pic_b, 2) 1];

% get lines of left screen and right screen in homogenous
ll = cross(Al, Bl);
lr = cross(Ar, Br);

f = figure();
imshow(pic_b);

for i = 1:size(lb, 2)
    % get intersection points in homogenous
    Pil = cross(lb(:,i)', ll);
    Pir = cross(lb(:,i)', lr);

    % convert to cartesian
    Pil = Pil / Pil(3);
    Pir = Pir / Pir(3);

    line([Pil(1) Pir(1)], [Pil(2) Pir(2)]);
end

saveas(f, fullfile('output', 'ps3-2-c-1.png'));

f = leastSquaresFundamental(points2Db, points2Da);

[U, S, V] = svd(f);
S(size(S,2), size(S,2)) = 0;
f = U*S*V';
la = f*points2Db;

pic_b = imread(fullfile('input', 'pic_a.jpg'));

% get extreme points from picture in homogenous
Al = [0 0 1];
Ar = [0 size(pic_b, 2) 1];
Bl = [size(pic_b, 1) 0 1];
Br = [size(pic_b, 1) size(pic_b, 2) 1];

% get lines of left screen and right screen in homogenous
ll = cross(Al, Bl);
lr = cross(Ar, Br);

f = figure();
imshow(pic_b);

for i = 1:size(la, 2)
    % get intersection points in homogenous
    Pil = cross(la(:,i)', ll);
    Pir = cross(la(:,i)', lr);

    % convert to cartesian
    Pil = Pil / Pil(3);
    Pir = Pir / Pir(3);

    line([Pil(1) Pir(1)], [Pil(2) Pir(2)]);
end

saveas(f, fullfile('output', 'ps3-2-d-1.png'));

%% Extensions:
% Extra credit problems
% Flatten to do disparity