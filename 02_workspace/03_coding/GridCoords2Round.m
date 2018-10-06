% Filename: GridCoords2Round.m
% LFUtilProcessWhiteImages.mで得たGridCoordsの数値を整数値に丸める

% GridCoords1からGridCoords34まで

for i = 1:34
    
    % ファイルの読み込み
    load(['GridCoords/GridCoords' num2str(i) '.mat']);
    GridCoordsi = GridCoords;
    
    % 四捨五入
    GridCoordsi_round = round(GridCoordsi);
    
    % ファイルの保存
    save(['Output/GridCoords' num2str(i) '_round.mat'], 'GridCoordsi_round')
    
    i = i + 1;

end

% End of Program