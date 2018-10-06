% Filename: Color2Remap.m
% デモザイク後の画像をハニカム構造から整った形に再配列

% 計時開始
tic

% 関数を動かすのに必要な変数を入力
% Lytro_RAW_Demosaic
Lytro_RAW_Demosaic = im2double(imread('PostBookTiger-color.png'));

% image_cords
load('required/GridCoordsA');

% LF_parameters
UV_radius           = 3; % 標準は3
UV_diameter         = (2*UV_radius+1);
UV_size             = UV_diameter^2;
LF_x_size           = size(GridCoordsi_round,2)*UV_diameter;
LF_y_size           = size(GridCoordsi_round,1)*UV_diameter;
x_size              = size(GridCoordsi_round,2);
y_size              = size(GridCoordsi_round,1);

LF_parameters       = struct('LF_x_size',LF_x_size,...
                             'LF_y_size',LF_y_size,...
                             'x_size',x_size,...
                             'y_size',y_size,...
                             'UV_radius',UV_radius,...
                             'UV_diameter',UV_diameter...
                             );

%関数を動かす
LF_Remap = RAW2REMAP...
            (Lytro_RAW_Demosaic, GridCoordsi_round, LF_parameters);

% 画像の保存
imwrite(LF_Remap, ['output/PostBookTiger-remap_radius' num2str(UV_radius) '.png']);
        
% 計測時間の表示
fprintf('Completed in %.3f seconds\n', toc);

% End of program