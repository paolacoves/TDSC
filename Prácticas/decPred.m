function y = decPred(nombreS)
%% Decodifica la secuencia de bits generada por la función codPred
%  Variables: 
%    - nombreS: nombre del fichero con la secuencia de bits a decodificar
%    - y: imagen decodificada 

fid = fopen(nombreS,'r');							% Abre fichero en modo lectura                       
nFilas = fread(fid,1,'uint16');         % Lee el número de filas
nColumnas = fread(fid,1,'uint16');      				% Lee el número de columnas
k = fread(fid,1,'ubit3');               % Lee k
y1D = zeros(nFilas*nColumnas,1);        % Genera array de ceros
y1D(1) = fread(fid,1,'uint8');						% Lee el primer píxel (8 bits)
sb = fread(fid,'ubit1');                % Lee el RESTO de la secuencia e[n]
nBits = length(sb);						% ObtÃ©n su longitud
nPixels = nFilas*nColumnas - 1;         % ObtÃ©n nÃºmero de pÃ­xels  
iBit = 1;
iPixel = 2;						% Ãndice del pÃ­xel a codificar 
nCeros = 0;						% NÃºmero de ceros en el c. unario
while iPixel <= nPixels+1			% Mientras queden sÃ­mbolos por decodificar
   bit = sb(iBit);					% Lee el siguiente bit de la secuencia
   if bit == 0
       nCeros = nCeros + 1;
       iBit = iBit + 1; 
   else
       xq = nCeros;					
       iBit = iBit + 1;
       xr = bi2de(sb(iBit:iBit+k-1)');
       e = xq*(2^k)+xr;
       if rem(e,2)==0 % Si e es par
           e = e/2;
       else
           e = -(e+1)/2;
       end
       y1D(iPixel) = y1D(iPixel-1) + e; 
       iBit = iBit + k;
       iPixel = iPixel + 1;
       nCeros = 0;
   end
end
y = reshape(y1D,nColumnas,nFilas);      % Lee el siguiente bit de la secuencia
y = uint8(y);
imshow(y');                       % Visualiza la imagen decodificda
fclose(fid);
 
end