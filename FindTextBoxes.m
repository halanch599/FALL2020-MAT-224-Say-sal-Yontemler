function out = FindTextBoxes(I)
den = @(I)sum(I(:))/numel(I);
img = im2double(I);
if(size(img,3)>2)
    imgray = imgaussfilt(rgb2gray(img));
else
    imgray =img;
end
%imgray = imgray(end-100:end,:);
imgsobel = edge(imgray,'Sobel', 'both');
hedges = imerode(imgsobel,ones(1,50));
vedges = imerode(imgsobel,ones(50,1));
imgsobel(hedges)=0;
imgsobel(vedges)=0;

SE  = ones(1, 11);
imgprocessed  = ((double(imdilate(imgsobel,SE)))>0);
%imshow(imgprocessed,[])
[L, N] = bwlabel(imgprocessed);
if(N==0)
    return;
end

% cc = bwconncomp(BW); 
% stats = regionprops(cc,'Area','Eccentricity'); 
% idx = find([stats.Area] > 80 & [stats.Eccentricity] < 0.8); 
% BW2 = ismember(labelmatrix(cc),idx); 

out = uint8(zeros(size(imgprocessed)));
stats = regionprops(L,'Area','BoundingBox');

areas = [stats.Area];
bboxes = {stats.BoundingBox};
idx= find(areas<300);
areas(idx)=[];
bboxes(idx)=[];
%figure(1)
areaofImage = numel(imgprocessed);
for i =1:length(areas)
%     area = stats(i).Area;
%     bbox =stats(i).BoundingBox;
    area = areas(i);
    bbox = bboxes{i};
    ar = bbox(3)/bbox(4);
    %imshow(imcrop(I,bbox))
    im2 = edge(imcrop(imgray, bbox),'canny');
%     imshow(im2,[]);
    edgecount = sum(im2(:))/numel(im2);
    %out = insertShape(out,'rectangle',bbox,'LineWidth',2,'Color', {'white'});
    %english %
    if( edgecount> 0.10 && ...
        area<(2/3*areaofImage)&&  ...
        ar>2.0 && bbox(4)<60 ...
        && bbox(4)>15 && ...
        bbox(3)>15)
        croped = imcrop(imgprocessed,bbox);
        density =den(croped);
        if(density>0.2)
            out = insertShape(out,'rectangle',bbox,'LineWidth',2,'Color', {'white'});
        end
    end
%     %edgecount> 0.10 && ...
%     if(area<(2/3*areaofImage)&&  ...
%         ar>2.0 && bbox(4)<60 ...
%         && bbox(4)>15 && ...
%         bbox(3)>15)
%         croped = imcrop(imgprocessed,bbox);
%         density =den(croped);
%         if(density>0.2)
%             out = insertShape(out,'rectangle',bbox,'LineWidth',2,'Color', {'white'});
%         end
%     end
    %     trt news headline
%         if(ar>1 && area>200 && bbox(4)<80 && bbox(4)>10 && ...
%                 bbox(3)>10)
%             croped = imcrop(imgprocessed,bbox);
%             density =den(croped);
%             if(density>0.5)
%                 out = insertShape(out,'rectangle',bbox,'LineWidth',2,'Color', {'white'});
%             end
%         end
end
% figure, imshow(imgprocessed,[])
% figure, imshow(out,[])
% figure, imshow(img,[])
end

