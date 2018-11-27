clc
clear all
close all

rgb = imread('./lips.jpg');
rgb_img = imgaussfilt(rgb,1);
yiq_image  = rgb2ntsc(rgb_img);
% Retaining Q chromaticity
q_com = yiq_image(:,:,3);
% imtool(q_com);
% imwrite(q_com,'Q_img.jpg');
sz = size(q_com);

%% Multi-Thresholding
level = graythresh(q_com);
Q_upper = imbinarize(q_com,level);
Otsu_T = level;
t = level;
thresh_final = 0.0560;
Q = imbinarize(q_com,level);

%Morph Op
SE_closing = strel('disk',10);
SE_opening = strel('disk',5);
Q = imclose(Q,SE_closing);
Q = imopen(Q,SE_opening);
imtool(Q);

%Connected Comp
CC = bwconncomp(Q,4);
numPixels = cellfun(@numel,CC.PixelIdxList);
[biggest,idx] = max(numPixels);
k = size(numPixels);
 for i = 1:(k(2))
        if i == idx
            continue;
        else
            Q(CC.PixelIdxList{i}) = 0;
        end
    end

% Contour
figure(1);
imshow(rgb);
hold on
[Q_Cont , h_up] = imcontour(Q);