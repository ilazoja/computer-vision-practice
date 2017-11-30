function [U,V] = hierarchicalLK(L, R, k)

    gauss_pyr(1,:) = gaussPyramid(double(L),k-1);
    gauss_pyr(2,:) = gaussPyramid(double(R),k-1);
    
    for i = k:-1:1
        Lk = gauss_pyr{1,i};
        Rk = gauss_pyr{2,i};
        if i == k
            U = zeros(size(Lk));
            V = zeros(size(Lk));
        else
            U = 2*expand(U);
            V = 2*expand(V);
        end     
        Wk = warp(Lk,U,V);
        %[Ix, Iy, It] = computeGradients(Rk, Wk);
        [Dx, Dy] = computeLK(Wk, Rk, 45);
         U = U + Dx;
         [row, col] = find(isnan(U));
         if size(row,1) ~= 0
             stop;
         end
         V = V + Dy;
        
    end
    

    
end