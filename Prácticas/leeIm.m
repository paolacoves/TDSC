function y = leeIm(nombre_sb)
fid = fopen(nombre_sb,'r');
f=fread(fid,1,'uint16');
c=fread(fid,1,'uint16');
y=fread(fid,[f c],'uint8');
y=uint8(y);
imshow(y);
fclose(fid);
end
