function codPCM(x,R,fi)
fid=fopen(fi,'w');
fwrite(fid,R,'ubit4');
fwrite(fid,length(x),'ubit32');
delta=2/2^R;

k=floor(x/delta);
k=k+2^(R-1);

dt=['ubit' num2str(R)];
fwrite(fid,k,dt);
fclose(fid);
end
