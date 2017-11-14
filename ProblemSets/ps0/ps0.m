
%1. Input Images
girl = imread('input/4.1.01.tiff');
couple = imread('input/4.1.02.tiff');

imwrite(girl, 'output/ps0-1-a-1.png');
imwrite(couple, 'output/ps0-1-a-2.png');

%2. Color planes
girlRedChannel = girl(:,:,1);
girlBlueChannel = girl(:,:,3);
girlGreenChannel = girl(:,:, 2);

girlSwappedRG = girl;
girlSwappedRG(:,:, 1) = girlBlueChannel;
girlSwappedRG(:,:, 3) = girlRedChannel;

imshow(girlSwappedRG);

imwrite(girlSwappedRG, 'output/ps0-2-a-1.png');
imwrite(girlGreenChannel, 'output/ps0-2-b-1.png');
imwrite(girlRedChannel, 'output/ps0-2-c-1.png');

%3 Replacement of pixels
sizeG = size(girl,1);
center = sizeG/2;
coupleCenterRedReplaced = couple(:, :, 1);
coupleCenterRedReplaced(center-50:center+50,center-50:center+50) = girl(center-50:center+50, center-50:center+50);
imwrite(coupleCenterRedReplaced, 'output/ps0-3-a-1.png');

%4 Arithmetic and Geometric operations
doubleGGC = double(girlGreenChannel); 
maxG = max(doubleGGC)
minG = min(doubleGGC)
meanG = mean(double(doubleGGC))
stdG = std(double(doubleGGC(:)))

result = (doubleGGC - meanG) * 10 / stdG;
imwrite(result, 'output/ps0-4-b-1.png');

greenShifted = girlGreenChannel;
greenShifted(:, 1:sizeG-2) = girlGreenChannel(:, 3:sizeG);
greenShifted(:, (sizeG-2):sizeG) = girlGreenChannel(:, 1:3 );
imshow(greenShifted);
imwrite(greenShifted, 'output/ps0-4-c-1.png');

diff = uint8(abs(doubleGGC - double(greenShifted)));
imshow(diff); %or could use different parameters to set range
imwrite(diff, 'output/ps0-4-d-1.png'); 

%5 Noise;
noise_sigma = 25;
noise = randn(size(girl(:,:,1))) * noise_sigma;
noisy_img = girl(:,:, 2) + uint8(noise);
girlNoisyG = girl;
girlNoisyG(:, :, 2) = noisy_img;
imwrite(girlNoisyG, 'output/ps0-5-a-1.png');
noisy_img = girl(:,:, 3) + uint8(noise);
girlNoisyB = girl;
girlNoisyB(:, :, 2) = noisy_img;
imwrite(girlNoisyB, 'output/ps0-5-b-1.png');