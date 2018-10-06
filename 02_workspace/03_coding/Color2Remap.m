% Filename: Color2Remap.m
% �f���U�C�N��̉摜���n�j�J���\�����琮�����`�ɍĔz��

% �v���J�n
tic

% �֐��𓮂����̂ɕK�v�ȕϐ������
% Lytro_RAW_Demosaic
Lytro_RAW_Demosaic = im2double(imread('PostBookTiger-color.png'));

% image_cords
load('required/GridCoordsA');

% LF_parameters
UV_radius           = 3; % �W����3
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

%�֐��𓮂���
LF_Remap = RAW2REMAP...
            (Lytro_RAW_Demosaic, GridCoordsi_round, LF_parameters);

% �摜�̕ۑ�
imwrite(LF_Remap, ['output/PostBookTiger-remap_radius' num2str(UV_radius) '.png']);
        
% �v�����Ԃ̕\��
fprintf('Completed in %.3f seconds\n', toc);

% End of program