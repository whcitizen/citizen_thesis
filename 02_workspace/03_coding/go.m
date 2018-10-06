% Filename: go.m
% .lfrを.pngに変換

% 計測開始
tic

input_path  = 'input/illum/'   ;
output_path = 'input/illumpng/'   ;

addpath(genpath('required'));

files = dir([input_path '*.LFR']);

for ind = 1:size(files)
    file_name = files(ind).name;
    [pathstr,name,ext] = fileparts(file_name);
    lfr2png([input_path file_name], [output_path name '.png']); 
    fprintf('%s completed!\n',file_name);
end

% 計測時間の表示
fprintf('Completed in %.3f seconds\n', toc);

