function [noseimg,leftimg,rightimg,mouthimg,faceimg] = detectFACE(IMG)
reqToolboxes = {'Computer Vision System Toolbox', 'Image Processing Toolbox'};
if( ~checkToolboxes(reqToolboxes) )
 error('detectFaceParts requires: Computer Vision System Toolbox and Image Processing Toolbox. Please install these toolboxes.');
end
% img = imread('thumb_IMG_2666_1024.jpg');
img = IMG;

detector = buildDetector();
[bbox bbimg faces bbfaces] = detectFaceParts(detector,img,2);

figure;imshow(bbimg);
for i=1:size(bbfaces,1)
 figure;imshow(bbfaces{i});
 faceimg = bbfaces{i}; %is bounding box for face

 noseimg_point = bbox(:,17:20); %is bounding box for nose
 leftimg_point = bbox(:, 5: 8); %is bounding box for left eye
 rightimg_point = bbox(:, 9:12); %is bounding box for right eye
 mouthimg_point = bbox(:,13:16); %is bounding box for mouth
 noseimg = img(noseimg_point(2):(noseimg_point(2)+noseimg_point(4)),noseimg_point(1):noseimg_point(1)+noseimg_point(3),:);
 leftimg = img(leftimg_point(2):(leftimg_point(2)+leftimg_point(4)),leftimg_point(1):leftimg_point(1)+leftimg_point(3),:);
 rightimg = img(rightimg_point(2):(rightimg_point(2)+rightimg_point(4)),rightimg_point(1):rightimg_point(1)+rightimg_point(3),:);
 mouthimg = img(mouthimg_point(2):(mouthimg_point(2)+mouthimg_point(4)),mouthimg_point(1):mouthimg_point(1)+mouthimg_point(3),:);

 figure;imshow(noseimg), impixelinfo;
 figure;imshow(leftimg), impixelinfo;
 figure;imshow(rightimg), impixelinfo;
 figure;imshow(mouthimg), impixelinfo;
 figure;imshow(faceimg), impixelinfo;
end

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