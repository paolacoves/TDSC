function y = decPCM(fi)
fid=fopen(fi,'r');
R=fread(fid,1,'ubit4');
N=fread(fid,1,'ubit32');
dt=['ubit' num2str(R)];
k=fread(fid,N,dt);
k=k-2^(R-1);
delta=2/2^R;
y=delta*k+delta/2;
fclose(fid);
soundsc(y,8000);
end

