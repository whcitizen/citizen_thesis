% Filename: Remap2Focus.m
% Remap画像を多焦点画像に変換

% 計時開始
tic

% alphaに関する変数
depth_resolution = 256;
alpha_min = 0.2;
alpha_max = 2;
alpha_step = (alpha_max-alpha_min)/depth_resolution;

% Remap画像の読み込み
LF_Remap = im2double(imread('output/Remap_radius/PostBookTiger-remap_radius3(Standard).png'));

% Remap画像関連の変数
x_size = ;
y_size = ;
UV_diameter = 3;
UV_radius = UV_diamter * 2 + 1;
LF_Remap_alpha = zeros();
IM_Refoc_alpha = ;

% Remap2Focus
alpha = 1;
for alpha = alpha_min : alpha_step : alpha_max
    [] = REMAP2REFOCUS(x_size, y_size,...
                       UV_diameter, UV_radius, LF_Remap,...
                       LF_Remap_alpha, IM_Refoc_alpha, alpha);
     % 画像の保存
    imwrite(IM_Pinhole,...
            ['output/PostBookTiger_focus'...
             '(' num2str(alpha) ').png']);

    alpha = alpha + 1;
    
end

                   
% 計測時間の表示
fprintf('Completed in %.3f seconds\n', toc);

% End of program