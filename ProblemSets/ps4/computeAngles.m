function [selectedAngles, points] = computeAngles(Rm, Ix, Iy)
%COMPUTEANGLES Summary of this function goes here
%   Detailed explanation goes here
    [row, col] = find(Rm ~= 0);
    angles = atan2(Ix, Iy);

    selectedAngles = zeros(size(row));
    for i = 1:size(row)
        selectedAngles(i) = angles(row(i), col(i));
    end
    points = [col row];
    %frame = [col  row  ones(size(row))*10  selectedAngles]';
    %imshow([simA simB]);
    %h1 = vl_plotframe(frame);
    %set(h1,'color','k','linewidth',3) ;
    %set(h2,'color','y','linewidth',2) ;
end
