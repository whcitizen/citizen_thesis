% Filename: GridCoords2Round.m
% LFUtilProcessWhiteImages.m�œ���GridCoords�̐��l�𐮐��l�Ɋۂ߂�

% GridCoords1����GridCoords34�܂�

for i = 1:34
    
    % �t�@�C���̓ǂݍ���
    load(['GridCoords/GridCoords' num2str(i) '.mat']);
    GridCoordsi = GridCoords;
    
    % �l�̌ܓ�
    GridCoordsi_round = round(GridCoordsi);
    
    % �t�@�C���̕ۑ�
    save(['Output/GridCoords' num2str(i) '_round.mat'], 'GridCoordsi_round')
    
    i = i + 1;

end

% End of Program