clc
clear all
close all

rgb_img = imread('lip2.jpg');

yiq_image  = rgb2ntsc(rgb_img);
% Retaining Q chromaticity
q_com = yiq_image(:,:,3);
% imtool(q_com);

%% Otsu's thresholding
level = graythresh(q_com);
BW = imbinarize(q_com,level);
% imtool(BW);
sz = size(BW);
num = floor(sz(2)/10);
std = zeros(1,sz(2));
mn = mean(BW);
for y = 1:sz(2)
    for x = 1:sz(1)
        std(y) = sqrt( (BW(x,y) - mn(y))^2 /sz(1));
    end
end

cp = findchangepts(std,'MaxNumChanges',num);
Ly = cp(1,1);
Ry = cp(1,num);
[max_num_l,Lx] = max(q_com(:,Ly));
[max_num_r,Rx] = max(q_com(:,Ry));

%% Dividing image into uppper and lower part


%% Thresholding
