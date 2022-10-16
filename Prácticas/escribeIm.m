function escribeIm(x,nombre)
[f c] = size(x); % Obtiene el n´umero de filas y de columnas
fid = fopen(nombre,'w'); % Abre el fichero en modo escritura
fwrite(fid,f,'uint16'); % Escribe el n´umero de filas en el fichero
fwrite(fid,c,'uint16'); % Escribe el n´umero de columnas en el fichero
fwrite(fid,x,'uint8'); % Escribe las palabras c´odigo en el fichero
fclose(fid); % Cierra el fichero
end