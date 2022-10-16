function [nBits, R] = codPred(nombreI,nombreS,k) %El valor optimo es k=3 para i1.png, i2.png
%% Codifica sin pérdidas una imagen usando DPCM y un código Rice-k
%  Variables de entrada:
%    - nombreI: nombre del fichero con la imagen a codificar
%    - nombreS: nombre del fichero con la secuencia de bits generada
%    - k: parámetro del código Rice.
%  Variable de salida:
%    - nBits: número de bits 
%    - R: tasa binaria (expresada en bpp)

x = imread(nombreI);                    % Lee la imagen
x = rgb2gray(x);						% Obtén la luminancia
x = double(x);                          % Transforma en double
[nFilas,nColumnas] = size(x);           % Obtén número de filas y columnas
fid = fopen(nombreS,'w');				% Abre el fichero en modo escritura
fwrite(fid,nFilas,'uint16');            % Escribe número de filas (cabecera)  
fwrite(fid,nColumnas,'uint16');			% Escribe número de columnas (cabecera) 
fwrite(fid,k,'ubit3');					% Escribe k (cabecera)                              
x1D = x';
x1D = x1D(:);                           % Secuencia tras la exploración raster
fwrite(fid,x1D(1),'uint8');      % Codifica primer píxel sin predicción ni error 
nBits = 8;                              % El primer píxel se ha codificado con 8 bits 
for iPixel = 2:nFilas*nColumnas
    e = x1D(iPixel)- x1D(iPixel-1);		% Calcula error de predicción 
    c = codRice(e,k);					% Codifica error con un c. Rice-k 
    cuenta = fwrite(fid,c,'ubit1');     % Escribe la palabra código en fichero 
    nBits = nBits + cuenta;             % Cuenta el número de bits escritos
end
nBits = nBits + 35;                     % Contabiliza los bits de la cabecera
R = nBits/length(x1D);					% Obtén la tasa binaria (en bpp) 
fclose(fid);                            % Cierrra el fichero

 
 
end