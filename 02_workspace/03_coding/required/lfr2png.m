function lfr2png(input_path_lfr,output_path)
%% CAMERA PARAMETERS
img_h     = 5368;
img_w     = 7728;
max_val   = 1023;
min_val   = 64  ;

% OPEN FILE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f = fopen(input_path_lfr);
A = fread(f);
A_char = char(A);

[out_pathstr,out_name,out_ext] = fileparts(output_path);


% FOR SENSOR DATA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ident = '"imageRef": "';

ind = strfind(A_char',ident);

ind_start = ind(3)+size(ident,2);

ident = A(ind_start);

for ind = 1:80
    ind_start = ind_start + 1;
    if (strcmp(A_char(ind_start),'"'))
        break;
    else
        ident = [ident A_char(ind_start)];
    end
end

ind = strfind(A_char',ident);

ind_metaend     = ind(1) - 1 ;
ind_imgstart    = ind(1) + 80;

% 4 bytes before == blob size, little endian
blob_size = typecast(uint8(fliplr(A(ind_metaend-3:ind_metaend,1)')), 'uint32');


% read_buffer = A(ind_imgstart:ind_imgstart+blob_size-1);
read_buffer = A(ind_imgstart:ind_imgstart+blob_size-1);

fid = fopen('magic5.bin', 'w');
fwrite(fid,read_buffer);
fclose(fid);

%Img = fread(f, [img_w img_h], 'ubit10', 0, 'l' )';  % note the ' is necessary to get the rotation right
LFP.ImgSize = [img_w        img_h];

InFile = fopen('magic5.bin', 'r');
Img = fread( InFile, inf, 'ubit8=>uchar', 0 );
fclose(InFile);
%%% DECODER CODE BY DONALD DANSEREAU

t0 = uint16(Img(1:5:end));
t1 = uint16(Img(2:5:end));
t2 = uint16(Img(3:5:end));
t3 = uint16(Img(4:5:end));
lsb = uint16(Img(5:5:end));

t0 = bitshift(t0,2);
t1 = bitshift(t1,2);
t2 = bitshift(t2,2);
t3 = bitshift(t3,2);

% not sure of order of final 2 bits... still working on this 
t3 = t3 + bitand(lsb,bin2dec('00000011'));
t2 = t2 + bitshift(bitand(lsb,bin2dec('00001100')),-2);
t1 = t1 + bitshift(bitand(lsb,bin2dec('00110000')),-4);
t0 = t0 + bitshift(bitand(lsb,bin2dec('11000000')),-6);

% t0 = t0 + bitand(lsb,bin2dec('00000011'));
% t1 = t1 + bitshift(bitand(lsb,bin2dec('00001100')),-2);
% t2 = t2 + bitshift(bitand(lsb,bin2dec('00110000')),-4);
% t3 = t3 + bitshift(bitand(lsb,bin2dec('11000000')),-6);

t = zeros(LFP.ImgSize, 'uint16');
t(1:4:end) = t0;
t(2:4:end) = t1;
t(3:4:end) = t2;
t(4:4:end) = t3;

t=t';

Img = t;

delete magic5.bin;

Img             = double(Img);

Img             = (min(max(Img,min_val),max_val)-min_val)/(max_val-min_val) ;

Img             = im2double(Img);

imwrite(Img, [out_pathstr '/' out_name out_ext]);

end