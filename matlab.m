-->image to txt file in matlab

Img = imread('Udyam''22_ICHIP_Round-1.jpeg');
fid = fopen('inputHex.txt', 'wt');
% Hex value write to the txt file
fprintf(fid, '%x\n', Img);



-->txt file to image in matlab

fid2=fopen(txtfile,'r');
img=fscanf(fid2,'%2x',[256 384]);
fclose(fid2);
resizedImage=imresize(img,[256 384]);
figure,imshow(resizedImage,[]);