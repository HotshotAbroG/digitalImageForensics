% ����tifͼƬ������һ����ѹ��(ѹ��������)��jpeg,��һ���м����򱻴۸�(�м������ѹ����һ��)��jpeg
% function tifProcess
% % process all the image in the folder 'img'
% imgDir = dir('img');jin'ya'suo
% lengthFiles = length(imgDir);
%  count1=0;
%  count2=0;
%  total = lengthFiles-4;
%  
%  for li = 5:lengthFiles
%      imageName = imgDir(li).name;
%      process(imageName);
%  end


function [imageName,imageDoubleCompressed,imageManipulated] = tifProcess(imageName)
%imageName: the name of the tif image
%imageDoubleCompressed: file path,double compressed of the tif image
%imageManipulated: manipulated image file path
imageDoubleCompressed= ['img/compressed/',imageName,'.jpg'];
imageSplitedName = 'tmpBlock.jpg';
imageManipulated = ['img/manipulate/',imageName,'.manipulated.jpg'];
imageName = ['img/',imageName];
block = 100;    %�۸ĵĴ�С block*block

im = imread(imageName); %����ԭͼƬ
[x,y,z] = size(im);     

halfX = round(x/2); %ͼƬ�м�x
halfY = round(y/2); %ͼƬ�м�y
halfBlock = block/2; 

%���м�block*block��С�Ĳ���ȡ��
splitBlock = im(halfX-halfBlock:halfX+halfBlock,halfY-halfBlock:halfY+halfBlock,:);
%��ԭͼƬ��65������ѹ��
imwrite(im,imageSplitedName,'JPEG','Quality',65);
%��ȡѹ�����ͼƬ
im = imread(imageSplitedName);
imwrite(im,imageDoubleCompressed,'JPEG','Quality',85);
%���뵽ԭͼƬ��Ӧ�Ĳ���
 im(halfX-halfBlock:halfX+halfBlock,halfY-halfBlock:halfY+halfBlock,:)=splitBlock;
%��ԭͼƬ��85������ѹ��
imwrite(im,imageManipulated,'JPEG','Quality',85);
