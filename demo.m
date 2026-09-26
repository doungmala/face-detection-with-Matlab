clc
close all
clear all
tic
reqToolboxes = {'Computer Vision System Toolbox', 'Image Processing Toolbox'};
if( ~checkToolboxes(reqToolboxes) )
 error('detectFaceParts requires: Computer Vision System Toolbox and Image Processing Toolbox. Please install these toolboxes.');
end

img = imread('thumb_IMG_2654_1024.jpg');
imgg = rgb2gray(img);
detector = buildDetector();
[bb,bbox bbimg faces bbfaces] = detectFaceParts(detector,img,2);

figure;imshow(bbimg), impixelinfo;
% figure;imshow(bbfaces), impixelinfo;
for i=1:size(bbfaces,1)
 ff = bbfaces{i,1}; 
 [r c] = size(ff);
 if r >= 77
%  figure;imshow(ff), title('Face'), impixelinfo;
 faceimg_point = bbox(i, 1: 4) % is bounding box for face
 faceimg = imgg(faceimg_point(2):(faceimg_point(2)+faceimg_point(4)),faceimg_point(1):faceimg_point(1)+faceimg_point(3));
 figure;imshow(faceimg), title('Face'), impixelinfo;
 end
%  noseimg_point = bbox(:,17:20); %is bounding box for nose
%  leftimg_point = bbox(:, 5: 8); %is bounding box for left eye
%  rightimg_point = bbox(:, 9:12); %is bounding box for right eye
%  mouthimg_point = bbox(:,13:16); %is bounding box for mouth
%  faceimg_point = bbox(:, 1: 4); % is bounding box for face
%  noseimg = img(noseimg_point(2):(noseimg_point(2)+noseimg_point(4)),noseimg_point(1):noseimg_point(1)+noseimg_point(3),:);
%  leftimg = img(leftimg_point(2):(leftimg_point(2)+leftimg_point(4)),leftimg_point(1):leftimg_point(1)+leftimg_point(3),:);
%  rightimg = img(rightimg_point(2):(rightimg_point(2)+rightimg_point(4)),rightimg_point(1):rightimg_point(1)+rightimg_point(3),:);
%  mouthimg = img(mouthimg_point(2):(mouthimg_point(2)+mouthimg_point(4)),mouthimg_point(1):mouthimg_point(1)+mouthimg_point(3),:);
%  faceimg = imgg(faceimg_point(2):(faceimg_point(2)+faceimg_point(4)),faceimg_point(1):faceimg_point(1)+faceimg_point(3));

% 
%  figure;imshow(noseimg), impixelinfo;
%  figure;imshow(leftimg), impixelinfo;
%  figure;imshow(rightimg), impixelinfo;
%  figure;imshow(mouthimg), impixelinfo;
%  figure;imshow(faceimg), impixelinfo;
%  figure;imshow(ff), impixelinfo;
end

toc

% Please uncoment to run demonstration of detectRotFaceParts
%{
 img = imrotate(img,180);
 detector = buildDetector(2,2);
 [fp bbimg faces bbfaces] = detectRotFaceParts(detector,img,2,15);

 figure;imshow(bbimg);
 for i=1:size(bbfaces,1)
  figure;imshow(bbfaces{i});
 end
%}