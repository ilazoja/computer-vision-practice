function m = leastSquaresCalibration(points3D, points2D)

    % review Direct Linear Calibration Homogenous part 2
    % https://cseweb.ucsd.edu/classes/wi07/cse252a/homography_estimation/homography_estimation.pdf

    % must pass a 3 x n or 2 x n matrix respectively
    
    A = zeros(2*size(points3D,1), 12); 
    %% generate A
    for pointsNum = 1:size(points3D,2)
        i = pointsNum*2 - 1;
    
        A(i,1) = points3D(1, pointsNum);
        A(i,2) = points3D(2, pointsNum);
        A(i,3) = points3D(3, pointsNum);
        A(i,4) = 1;
        A(i,5) = 0;
        A(i,6) = 0;
        A(i,7) = 0;
        A(i,8) = 0;
        A(i,9) = -points2D(1, pointsNum)*points3D(1, pointsNum);
        A(i,10) = -points2D(1, pointsNum)*points3D(2, pointsNum);
        A(i,11) = -points2D(1, pointsNum)*points3D(3, pointsNum);
        A(i,12) = -points2D(1, pointsNum);
        A(i+1,1) = 0;
        A(i+1,2) = 0;
        A(i+1,3) = 0;
        A(i+1,4) = 0;
        A(i+1,5) = points3D(1, pointsNum);
        A(i+1,6) = points3D(2, pointsNum);
        A(i+1,7) = points3D(3, pointsNum);
        A(i+1,8) = 1;
        A(i+1,9) = -points2D(2, pointsNum)*points3D(1, pointsNum);
        A(i+1,10) = -points2D(2, pointsNum)*points3D(2, pointsNum);
        A(i+1,11) = -points2D(2, pointsNum)*points3D(3, pointsNum);
        A(i+1,12) = -points2D(2, pointsNum);
    end

	[U, S, V] = svd(A);
    m = V(:,size(V,2)); % get last column
    m = reshape(m, 4, 3)';

    % [eVectors, eValues] = eigs(A'*A);
    % [Y, I] = min(diag(eValues));
end