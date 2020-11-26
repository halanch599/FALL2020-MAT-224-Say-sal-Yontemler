%%CaseStudy Text Detection and Recognition From videos
%% read video data
clc;clear; close all;
try

%file ='F:\AJ Data\img\videos\aljazeera arabic.mp4';
file ='F:\AJ Data\img\videos\trt english.mp4';
%file ='F:\AJ Data\img\videos\trt news headline.mp4';

[filepath,name,ext] = fileparts(file);
outputfile = [filepath,'\',name,'.txt'];
fid=fopen(outputfile,'w'); 

vidReader = VideoReader(file); % Read your video here
vidPlayer = vision.DeployableVideoPlayer;
mask =[-1 -2 -1; 
        0  0  0;
        1  2  1];
offset =100;
frameNo=1;
TotalFrames = vidReader.NumFrames;
%while(hasFrame(vidReader))
while((frameNo+offset)<=(TotalFrames))
    %img = readFrame(vidReader);
    
    disp(['processing frame No ',num2str(frameNo),'/',num2str(vidReader.NumFrames)])
    img = read(vidReader,frameNo);
    frameNo= frameNo+offset;
    img = imresize(img,0.75);
    
    R =img(:,:,1);
    G =img(:,:,2);
    B =img(:,:,3);
    out = FindTextBoxes(img);
    if(sum(out(:))==0),continue,end
    fprintf(fid, '%s{$}:', num2str(frameNo));
    mask = mergerectangles(out,rgb2gray(img),fid);
    mask = mask(:,:,1)>0;
    R(mask)=0; 
    G(mask)=255;
    B(mask)=0;
    img =cat(3,R,G,B);
    step(vidPlayer,img);
    pause(0.00000001)
    %pause((1/vidReader.FrameRate)); % pause of value (1/FrameRate)
end
fclose(fid);
catch ME
    disp(['Error:',ME.message])
end