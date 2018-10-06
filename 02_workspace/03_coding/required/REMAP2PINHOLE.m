function [IM_Pinhole, x_asp, y_asp] = REMAP2PINHOLE(LF_Remap,LF_parameters)
%REMAP2PINHOLE 
%           Takes the LF RAW input and converts to our LF Standard
%           Input : Lytro_RAW_Demosaic (x',y')
%           Output: LF_Remap           (x*u,y*v)

x_size        = LF_parameters.x_size                                      ;
y_size        = LF_parameters.y_size                                      ;
UV_diameter   = LF_parameters.UV_diameter                                 ;
UV_radius     = LF_parameters.UV_radius                                   ;

IM_Pinhole = zeros(y_size,x_size,3);

for i = -3:1:3
    for j = -3:1:3
       
        for x = 1:x_size
            for y = 1:y_size
                
                x_coord_center = 1 + UV_radius + UV_diameter * (x - 1)            ;
                y_coord_center = 1 + UV_radius + UV_diameter * (y - 1)            ;
        
                x_asp = i;
                y_asp = j;
                x_coord_aspect = x_coord_center + x_asp ;
                y_coord_aspect = y_coord_center + y_asp ;
        
                IM_Pinhole(y,x,1) = LF_Remap(y_coord_aspect,x_coord_aspect,1)     ;
                IM_Pinhole(y,x,2) = LF_Remap(y_coord_aspect,x_coord_aspect,2)     ;
                IM_Pinhole(y,x,3) = LF_Remap(y_coord_aspect,x_coord_aspect,3)     ;
            
            end
        end
        
        % ‰æ‘œ‚Ì•Û‘¶
        imwrite(IM_Pinhole,...
                ['output/PostBookTiger_aspect'...
                 '(' num2str(x_asp) ',' num2str(y_asp) ').png']);
        
    end
end


end

