import cv2
from PIL import Image
import numpy as np 
from matplotlib import pyplot as plt 
import colorsys


img = Image.open('lips.jpg')
w,h = img.size
# print w,h
rgb_pixels = np.asarray(img.getdata())
yiq_pixels = np.zeros(rgb_pixels.shape)
Q_chrom = np.zeros(rgb_pixels.shape[0])
for x in range(rgb_pixels.shape[0]):
	yiq_pixels[x,0], yiq_pixels[x,1], yiq_pixels[x,2] = colorsys.rgb_to_yiq(rgb_pixels[x,0],rgb_pixels[x,1],rgb_pixels[x,2])
	# print yiq_pixels[x]
	Q_chrom[x] = yiq_pixels[x,2]

q_arr = np.resize(Q_chrom,(h,w))
q_img = Image.fromarray(np.uint8(q_arr))
q_img.show()