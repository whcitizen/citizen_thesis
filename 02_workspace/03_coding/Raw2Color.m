% Filename: Raw2Color.m
% Raw ImageをRGBイメージに変換

% 計測開始
tic

% 画像の読み取り
in_file = 'Leaf';
in_ext = '.jpg';
X = imread([in_file in_ext]);

% RGB画像に変換
Y = demosaic(X, 'bggr');

% 画像を保存
out_file = '-color';
imwrite(Y, ['input/illumpng/' in_file out_file in_ext]);

% 計測時間の表示
fprintf('Completed in %.3f seconds\n', toc);

% End of Program