clc
clear all
close all

rgb_img = imread('lip2.jpg');

yiq_image  = rgb2ntsc(rgb_img);
% Retaining Q chromaticity
q_com = yiq_image(:,:,3);

% % Calculating std for each column
%columnwise mean of Q
mn = mean(q_com);
sz = size(q_com);

std = zeros(1,sz(2));
for y = 1:sz(2)
    for x = 1:sz(1)
        std(y) = sqrt( (q_com(x,y) - mn(y))^2 /sz(1));
    end
end
