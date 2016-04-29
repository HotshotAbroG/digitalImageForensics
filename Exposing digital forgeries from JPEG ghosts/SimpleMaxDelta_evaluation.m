% ����ͨ���Ƚ����������ж��Ƿ�۸�
% ���㷢�֣�δ���۸ĵ�ͼƬ�������뼸��100%С�� 40(300��ͼƬ������97%����׼ȷ��),  �����۸ĵ�ͼƬ�۸�����Խ�����������40�Ŀ��ܾ�Խ��.
% �۸�����100*100,96%����40�� �۸�����50*50, 89%����40(300��ͼƬ)
imgDir = dir('img');    %��Ų���ͼƬ���ļ���
lengthFiles = length(imgDir);
 count1=0;  %δ���۸ĵ�ͼƬԤ��׼ȷ����
 count2=0;  %���۸ĵ�ͼƬԤ��׼ȷ����
 total = lengthFiles-4;
 
 checkDisplacements=0;
 smoothFactor=1;
 
 for li = 5:lengthFiles  %Ԥ��δ�۸�ͼƬ
    imageName = imgDir(li).name;
    unmanipulatedFile = ['img/compressed/',imageName,'.jpg'];
    if ~exist(unmanipulatedFile,'file')
        tifprocess(imageName);
    end
    unmanipulatedIm = imread(unmanipulatedFile);
    
    [OutputX, OutputY, dispImages,deltas,imin, Qualities]=Ghost(unmanipulatedIm, checkDisplacements, smoothFactor);
    maxDeltas = max(max(deltas{15}));
    disp(maxDeltas);
    if maxDeltas < 40;
        count1 = count1 + 1;
    end
 end

 disp('manipulate-----');
  for li = 5:lengthFiles  %Ԥ��۸�ͼƬ
    imageName = imgDir(li).name;
    manipulatedFile = ['img/manipulate/',imageName,'.manipulated.jpg'];
    manipulatedIm = imread(manipulatedFile);

    [OutputX, OutputY, dispImages,deltas,imin, Qualities]=Ghost(manipulatedIm, checkDisplacements, smoothFactor);
    maxDeltas = max(max(deltas{15}));
    disp(maxDeltas);
    if maxDeltas > 40;
        count2 = count2 + 1;
    end
  end
fprintf('unmanipulate accuracy: %f\n',count1/total);
fprintf('manipulate accuracy: %f\n',count2/total);