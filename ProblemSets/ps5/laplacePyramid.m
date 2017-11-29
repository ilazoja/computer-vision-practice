function lapl_pyr = laplacePyramid( gauss_pyr )
%LAPLACEPYRAMID Summary of this function goes here
%   Detailed explanation goes here
    lapl_pyr = {};
    for i = 1:size(gauss_pyr,2)-1
        G = gauss_pyr{1,i};
        E = expand(gauss_pyr{1,i+1});
        if size(E,1) > size(G,1);
            E = E(1:end-1,:);
        end
        if size(E,2) > size(G,2)
            E = E(:,1:end-1);
        end
        lapl_pyr{i} = G - E;
    end
end

