% ps1

%% 1-a
img = imread(fullfile('input', 'ps1-input0.png'));  % already grayscale


%% TODO: Compute edge image img_edges
img_edges = edge(img, 'Canny');
imwrite(img_edges, fullfile('output', 'ps1-1-a-1.png'));  % save as output/ps1-1-a-1.png

%% 2-a
rhostep = 1;
[H, theta, rho] = hough_lines_acc(img_edges, 'RhoResolution', rhostep);  % defined in hough_lines_acc.m
%% TODO: Plot/show accumulator array H, save as output/ps1-2-a-1.png

imwrite(uint8(H), fullfile('output', 'ps1-2-a-1.png'));  % save as output/ps1-1-a-1.png

%% 2-b
peaks = hough_peaks(H, 10);  % defined in hough_peaks.m
%% TODO: Highlight peak locations on accumulator array, save as output/ps1-2-b-1.png
f = figure();
imshow(H, [0 max(H(:))]);
hold on;
for peakNumber = 1:size(peaks,1)
    %line([peaks(peakNumber,2) peaks(peakNumber,2)], [peaks(peakNumber,1) peaks(peakNumber,1)], 'Color', 'blue');
    plot(peaks(peakNumber,2),peaks(peakNumber,1),'r*');
end
saveas(f, fullfile('output', 'ps1-2-b-1.png'));
close(f);
%imwrite(uint8(HMarkers), fullfile('output', 'ps1-2-b-1.png'));  % save as output/ps1-1-a-1.png

%% TODO: Rest of your code here
%% 2-c
peaks(:,1) = peaks(:,1)*rhostep; %rhoresolution shrinks values so undo that
hough_lines_draw(img, 'ps1-2-c-1.png', peaks, rho, theta);

%% 3-a
noisy_img = imread(fullfile('input', 'ps1-input0-noise.png'));
filter_size = 21;
filter_sigma = 5;
filter = fspecial('gaussian', filter_size, filter_sigma);

smoothed = imfilter(noisy_img, filter);
imwrite(smoothed,fullfile('output', 'ps1-3-a-1.png'));  

%% 3-b
img_noisyedges = edge(noisy_img, 'Canny');
img_smoothededges = edge(smoothed, 'Canny');

imwrite(img_noisyedges,fullfile('output', 'ps1-3-b-1.png'));  
imwrite(img_smoothededges,fullfile('output', 'ps1-3-b-2.png')); 

%% 3-c
rhostep = 1;
[H, theta, rho] = hough_lines_acc(img_smoothededges, 'RhoResolution', rhostep);  % defined in hough_lines_acc.m
peaks = hough_peaks(H, 10, 'Threshold', 0.6 * max(H(:)), 'NHoodSize', floor(size(H) / 100.0) * 4 + 1);  % defined in hough_peaks.m

f = figure();
imshow(H, [0 max(H(:))]);
hold on;
for peakNumber = 1:size(peaks,1)
    %line([peaks(peakNumber,2) peaks(peakNumber,2)], [peaks(peakNumber,1) peaks(peakNumber,1)], 'Color', 'blue');
    plot(peaks(peakNumber,2),peaks(peakNumber,1),'r*');
end
saveas(f, fullfile('output', 'ps1-3-c-1.png'));
close(f);

peaks(:,1) = peaks(:,1)*rhostep; %rhoresolution shrinks values so undo that
hough_lines_draw(smoothed, 'ps1-3-d-1.png', peaks, rho, theta);

%% 4-a
img = imread(fullfile('input', 'ps1-input1.png')); 
img_grey = rgb2gray(img);
filter_size = 30;
filter_sigma = 7;
filter = fspecial('gaussian', filter_size, filter_sigma);

smoothed = imfilter(img_grey, filter);
imwrite(smoothed, fullfile('output', 'ps1-4-a-1.png')); 


%% 4-b
img_edges = edge(smoothed, 'Canny');
imwrite(img_edges, fullfile('output', 'ps1-4-b-1.png'));  

%% 4-c
rhostep = 3;
[H, theta, rho] = hough_lines_acc(img_edges, 'RhoResolution', rhostep);  % defined in hough_lines_acc.m
peaks = hough_peaks(H, 50, 'Threshold', 0.2 * max(H(:)), 'NHoodSize', floor(size(H) / 100.0) * 6 + 1);  % defined in hough_peaks.m

f = figure();
imshow(H, [0 max(H(:))]);
hold on;
for peakNumber = 1:size(peaks,1)
    %line([peaks(peakNumber,2) peaks(peakNumber,2)], [peaks(peakNumber,1) peaks(peakNumber,1)], 'Color', 'blue');
    plot(peaks(peakNumber,2),peaks(peakNumber,1),'r*');
end
saveas(f, fullfile('output', 'ps1-4-c-1.png'));
close(f);

peaks(:,1) = peaks(:,1)*rhostep; %rhoresolution shrinks values so undo that
hough_lines_draw(img_grey, 'ps1-4-c-2.png', peaks, rho, theta);

%% 5-a
radius = 20;
[H, rho] = hough_circles_acc(img_edges, radius);
centers = hough_peaks(H, 30, 'Threshold', 0.58 * max(H(:)), 'NHoodSize', floor(size(H) / 100.0) * 6 + 1);
centers(:) = centers(:) + rho;
imwrite(smoothed, fullfile('output', 'ps1-5-a-1.png')); 
imwrite(img_edges, fullfile('output', 'ps1-5-a-2.png')); 

f = figure();
imshow(img_grey);
%imshow(H, [0 max(H(:))]);
hold on;
for peakNumber = 1:size(centers,1)
    %line([peaks(peakNumber,2) peaks(peakNumber,2)], [peaks(peakNumber,1) peaks(peakNumber,1)], 'Color', 'blue');
    plot(centers(peakNumber,2),centers(peakNumber,1),'r*');
end
close(f)

radii = ones(size(centers,1),1)*radius;
f = figure();
imshow(img_grey);
hold on;
viscircles([centers(:,2), centers(:,1)],radii);
saveas(f, fullfile('output', 'ps1-5-a-3.png')); 
close(f);

%% 5-b
filter_size = 50;
filter_sigma = 20;
smoothed = imfilter(img_grey, filter);
img_edges = edge(smoothed, 'Canny');
r1 = randi([0 1], size(img_grey,1),size(img_grey,2));
%img_edges = img_edges.*r1; %remove some edge to reduce time
imshow(img_edges);
[centers, radii] = find_circles(img_edges, [20 50]);

f = figure();
imshow(img_grey);
hold on;
viscircles([centers(:,2), centers(:,1)],radii);
saveas(f, fullfile('output', 'ps1-5-b-1.png'));
close(f);

%% 6-a
img = imread(fullfile('input', 'ps1-input2.png')); 
img_grey = rgb2gray(img);
filter_size = 30;
filter_sigma = 10;
filter = fspecial('gaussian', filter_size, filter_sigma);
smoothed = imfilter(img_grey, filter);

img_edges = edge(smoothed, 'Canny');

rhostep = 3;
[H, theta, rho] = hough_lines_acc(img_edges, 'RhoResolution', rhostep);  % defined in hough_lines_acc.m
peaks = hough_peaks(H, 50, 'Threshold', 0.3 * max(H(:)), 'NHoodSize', floor(size(H) / 100.0) * 6 + 1);  % defined in hough_peaks.m
peaks(:,1) = peaks(:,1)*rhostep; %rhoresolution shrinks values so undo that
hough_lines_draw(smoothed, 'ps1-6-a-1.png', peaks, rho, theta);

%% 7-a
filter_size = 30;
filter_sigma = 7;
filter = fspecial('gaussian', filter_size, filter_sigma);
smoothed = imfilter(img_grey, filter);

img_edges = edge(smoothed, 'Canny');
imshow(img_edges);
[centers, radii] = find_circles(img_edges, [20 50]);

f = figure();
imshow(img_grey);
hold on;
viscircles([centers(:,2), centers(:,1)],radii);
saveas(f, fullfile('output', 'ps1-7-a-1.png'));
close(f);

%% 8-a
img = imread(fullfile('input', 'ps1-input3.png')); 
img_grey = rgb2gray(img);
filter_size = 30;
filter_sigma = 10;
filter = fspecial('gaussian', filter_size, filter_sigma);
smoothed = imfilter(img_grey, filter);

img_edges = edge(smoothed, 'Canny');

rhostep = 3;
[H, theta, rho] = hough_lines_acc(img_edges, 'RhoResolution', rhostep);  % defined in hough_lines_acc.m
peaks = hough_peaks(H, 50, 'Threshold', 0.3 * max(H(:)), 'NHoodSize', floor(size(H) / 100.0) * 6 + 1);  % defined in hough_peaks.m
peaks(:,1) = peaks(:,1)*rhostep; %rhoresolution shrinks values so undo that
hough_lines_draw(smoothed, 'ps1-8-a-1.png', peaks, rho, theta);

filter_size = 30;
filter_sigma = 7;
filter = fspecial('gaussian', filter_size, filter_sigma);
smoothed = imfilter(img_grey, filter);

img_edges = edge(smoothed, 'Canny');
imshow(img_edges);
[centers, radii] = find_circles(img_edges, [20 50]);

f = figure();
imshow(img_grey);
hold on;
viscircles([centers(:,2), centers(:,1)],radii);
saveas(f, fullfile('output', 'ps1-8-a-2.png'));
close(f);

%% EXTENSIONS: Have votes as objects, objects contain list of points, compare distance between points to see if it is valid line, use cell array
%Check if parallel for lines in pen