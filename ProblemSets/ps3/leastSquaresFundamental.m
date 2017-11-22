function f = leastSquaresFundamental(pntsA, pntsB)

    % review Direct Linear Calibration Homogenous part 2
    % https://cseweb.ucsd.edu/classes/wi07/cse252a/homography_estimation/homography_estimation.pdf

    % must pass a 3 x n or 2 x n matrix respectively
    
    A = zeros(2*size(pntsA,1), 9); 
    %% generate A
    for i = 1:size(pntsA,2)  
        A(i,1) = pntsB(1, i)*pntsA(1, i);
        A(i,2) = pntsB(1, i)*pntsA(2, i);
        A(i,3) = pntsB(1, i);
        A(i,4) = pntsB(2, i)*pntsA(1, i);
        A(i,5) = pntsB(2, i)*pntsA(2, i);
        A(i,6) = pntsB(2, i);
        A(i,7) = pntsA(1, i);
        A(i,8) = pntsA(2, i);
        A(i,9) = 1;
    end

	[U, S, V] = svd(A);
    f = V(:,size(V,2)); % get last column
    f = reshape(f, 3, 3)';

    % [eVectors, eValues] = eigs(A'*A);
    % [Y, I] = min(diag(eValues));
end