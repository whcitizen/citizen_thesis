% Filename: Remap2Aspects.m
% �Ĕz�񂵂��摜���瑽���_�摜�𐶐�

% �v���J�n
tic

% �֐��𓮂����̂ɕK�v�ȕϐ������
% LF_Remap
LF_Remap = im2double(imread('output/Remap_radius/PostBookTiger-remap_radius3(Standard).png'));

% image_cords
load('required/GridCoordsA')

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
[IM_PINhole, x_asp, y_asp] = REMAP2PINHOLE...
                             (LF_Remap, LF_parameters);
        
% �v�����Ԃ̕\��
fprintf('Completed in %.3f seconds\n', toc);

% End of program