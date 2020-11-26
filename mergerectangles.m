function out= mergerectangles(img,I,fid)
% bboxes: are the list of bounding boxes
% d:the minimum distance between boxes to merge
if(size(img,3)>2)
    imgray = imgaussfilt(rgb2gray(img));
else
    imgray =img;
end
SE  = ones(1, 9);
imgprocessed  = imclose(imgray,SE);
[L, N] = bwlabel(imgprocessed);
if(N==0)
    return;
end
out = uint8(zeros(size(imgprocessed)));
stats = regionprops(L,'BoundingBox');
%figure(1)
for i =1:length(stats)
    bbox =stats(i).BoundingBox;
    ar = bbox(3)/bbox(4);
    if(ar>1.25)
    %for OCR need orignal image
    im = imcrop(I,bbox);
    %ocrOutput = ocr(im,'Language','Turkish','TextLayout','Block');
    %ocrOutput = ocr(im,'Language','Arabic','TextLayout','Block');
    ocrOutput = ocr(im,'Language','English','TextLayout','Block');
    txt= strtrim(ocrOutput.Text);
    if(isempty(txt)), continue,end
    %figure(1), imshow(im),title(ocrOutput.Text);
    out = insertShape(out,'rectangle',bbox,'LineWidth',2,'Color', {'white'});   
     %disp(ocrOutput.Text);
    fprintf(fid, '%s,', strtrim(txt));
    end
end
fprintf(fid, 'r\n');
end

