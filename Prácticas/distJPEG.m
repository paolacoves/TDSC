function [y MSE] = distJPEG(x,s)
x1=x;
x=double(x1)-128;
[f c] = size(x);
fB=ceil(f/8); %número de filas de bloque
cB=ceil(c/8); %número de columnas de bloque 
x(fB*8,cB*8)=0; %expandir la imagen 
load deltas
deltas=s*deltas;
B=dctmtx(8);
for ifB=1:fB
    for icB=1:cB
        bloque=x((ifB-1)*8+1:ifB*8,(icB-1)*8+1:icB*8);    
        BLOQUE=B*bloque*B';  %sacar la matriz de coef
        idx =round(BLOQUE./deltas);
        BLOQUE2=idx.*deltas; %DECUENTIFICACION
        bloque2=B'*BLOQUE2*B;
        y_exp((ifB-1)*8+1:ifB*8,(icB-1)*8+1:icB*8)=bloque2;
    end
end
y=y_exp(1:f,1:c);
e=(x(1:f,1:c)-y).^2;
e=e(:);
MSE=mean(e);
MSE=10*log10(MSE);
y=y+128;
y=uint8(y);
end


   