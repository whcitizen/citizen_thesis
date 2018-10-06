% Filename: Aspect2SURF
% �����_�摜����SURF�����_�����o�A�}�b�`���O

%�v���J�n
tic

% �摜�̓ǂݍ���
preI1 = imread('22_PostBookTiger_aspect(-3,0).png');
preI2 = imread('28_PostBookTiger_aspect(3,0).png');

% �O���[�X�P�[���ɕϊ�
I1 = rgb2gray(preI1);
I2 = rgb2gray(preI2);

% SURF�����ʂ�������
% MetricThreshold��臒l(�f�t�H���g��1000)
threshold = 200;
points1 = detectSURFFeatures(I1, 'MetricThreshold', threshold);
points2 = detectSURFFeatures(I2, 'MetricThreshold', threshold);

% �����𒊏o
[f1, vpts1] = extractFeatures(I1, points1);
[f2, vpts2] = extractFeatures(I2, points2);

% �}�b�`����_�̈ʒu���擾
indexPairs = matchFeatures(f1, f2);
matchedPoints1 = vpts1(indexPairs(:, 1));
matchedPoints2 = vpts2(indexPairs(:, 2));

% �}�b�`����_�̕\��
figure;
showMatchedFeatures(I1, I2, matchedPoints1, matchedPoints2);
legend('matched points 1', 'matched points 2');

% �v�����Ԃ̕\��
fprintf('Completed in %.3f seconds\n', toc);