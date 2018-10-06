% Filename: Raw2Color.m
% Raw Image��RGB�C���[�W�ɕϊ�

% �v���J�n
tic

% �摜�̓ǂݎ��
in_file = 'Leaf';
in_ext = '.jpg';
X = imread([in_file in_ext]);

% RGB�摜�ɕϊ�
Y = demosaic(X, 'bggr');

% �摜��ۑ�
out_file = '-color';
imwrite(Y, ['input/illumpng/' in_file out_file in_ext]);

% �v�����Ԃ̕\��
fprintf('Completed in %.3f seconds\n', toc);

% End of Program