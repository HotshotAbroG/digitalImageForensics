% ͨ���Ƚ������ks-test ����D���ж��Ƿ�۸�
% Ŀǰ�ٶ��۸�������ͼƬ���ġ� ���֪������ʹ��ks-test׼ȷ�ʶ��ڴ۸Ĺ���ͼƬԤ��׼ȷ�ʸ��ڽ����Ƚ�deltas�Ƿ����40(SimpleMaxDelta_evaluation.m)
% ���ڵ����⣺
  % ����֪���۸�������ô�ҵ��۸����򣿳��Թ�����Ȼ�����ÿ��block��ʣ�������ks���룬����Ч�����ã���Ҫ�Ƕ���δ�۸�ͼƬ�����Ļ��ܴ�Ŀ��ܳ��� ks���� �ܴ���������ʱ�临�Ӷ�Ҳ�ܴ�
imgDir = dir('img');
lengthFiles = length(imgDir);
 count1=0;
 count2=0;
 total = lengthFiles-4;
 
 Result_unmapulate = zeros(lengthFiles-4,5);    %����δ�۸�ͼƬԤ����
 display('ks-test result of unmanipulated images');
 display('indexX indexY reject probability maxDistance');
for li = 5:lengthFiles
    imageName = imgDir(li).name;
    [imageName,imageDoubleCompressed,imageManipulated] = tifProcess(imageName);
    [i,j,h,p,k] = kstestOfImage(imageDoubleCompressed);
    Result_unmapulate(li-4,:) = [i,j,h,p,k];
    if k < 0.6
        count1 = count1 + 1;
    end
end
display('----ks-test result of manipulated images-----');
display('indexX indexY reject probability maxDistance');
Result_mapulate = zeros(lengthFiles-4,5);   %����۸�ͼƬԤ����
for li = 5:lengthFiles
    imageName = imgDir(li).name;
    [imageName,imageDoubleCompressed,imageManipulated] = tifProcess(imageName);
    [i,j,h,p,k] = kstestOfImage(imageManipulated);
    Result_mapulate(li-4,:) = [i,j,h,p,k];
    if k > 0.6
        count2 = count2 + 1;
    end
end

fprintf('unmanipulate: %f\n',count1/total);
fprintf('manipulate: %f\n',count2/total);

