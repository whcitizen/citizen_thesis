% Filename: Aspect2SURF
% 多視点画像からSURF特徴点を検出、マッチング

%計時開始
tic

% 画像の読み込み
preI1 = imread('22_PostBookTiger_aspect(-3,0).png');
preI2 = imread('28_PostBookTiger_aspect(3,0).png');

% グレースケールに変換
I1 = rgb2gray(preI1);
I2 = rgb2gray(preI2);

% SURF特徴量を見つける
% MetricThresholdは閾値(デフォルトは1000)
threshold = 200;
points1 = detectSURFFeatures(I1, 'MetricThreshold', threshold);
points2 = detectSURFFeatures(I2, 'MetricThreshold', threshold);

% 特徴を抽出
[f1, vpts1] = extractFeatures(I1, points1);
[f2, vpts2] = extractFeatures(I2, points2);

% マッチする点の位置を取得
indexPairs = matchFeatures(f1, f2);
matchedPoints1 = vpts1(indexPairs(:, 1));
matchedPoints2 = vpts2(indexPairs(:, 2));

% マッチする点の表示
figure;
showMatchedFeatures(I1, I2, matchedPoints1, matchedPoints2);
legend('matched points 1', 'matched points 2');

% 計測時間の表示
fprintf('Completed in %.3f seconds\n', toc);