clc
clear all
close all

rgb_img = imread('lip2.jpg');

yiq_image  = rgb2ntsc(rgb_img);
% Retaining Q chromaticity
q_com = yiq_image(:,:,3);
% imtool(q_com);
sz = size(q_com);
%% Otsu's thresholding
level = graythresh(q_com);
BW = imbinarize(q_com,level);
% imtool(BW);
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
x1 = Ly;
x2 = Ry;
y1 = Lx;
y2 = Rx;
coefficients = polyfit([x1, x2], [y1, y2], 1);
a = coefficients (1);
b = coefficients (2);
Q_upper = zeros(sz);
Q_lower = zeros(sz);
for x = 1:sz(2)
    for y = 1:sz(1)
        if (a*x + b - y) > 0
            Q_upper(y,x) = q_com(y,x);
        else
            Q_upper(y,x) = 0;
        end
        if (a*x + b -y ) < 0
            Q_lower(y,x) = q_com(y,x);
        else
            Q_lower(y,x) = 0;
        end
    end
end

%% Thresholding
%for Upper lip
T_u = graythresh(Q_upper);
Q_upppr = imbinarize(Q_upper,level);
% imtool(Q_upppr);
%for Lower lip
%----%
%% Contour
SE_closing = strel('disk',10);
SE_opening = strel('disk',5);
%Contouring upper lip
Q_upper = imclose(Q_upppr,SE_closing);
Q_upper = imopen(Q_upper,SE_opening);
[Q_up_Cont , h_up] = imcontour(Q_upper);
% %Contouring lower lip
% %---%