%AUDIO

[x,fs] = audioread('v1.wav');
info = audioinfo('v1.wav');
[x1,fs1] = audioread('v1.wav','native');

%sound : Convert matrix of signal data to sound
%soundsc : Scale data and play as sound (-1 1 )

[x_vt1,fs_vt1] = audioread('vt1.wav');
% soundsc(x,fs)
% soundsc(x_vt1,fs_vt1)

% plot(x)

[x_e,fs_e] = audioread('v_e.wav');
[x_s,fs_s] = audioread('v_s.wav');

% subplot(1,2,1),plot(x_e)
% subplot(1,2,2),plot(x_s)

[x_clarinete,fs_clarinete] = audioread('clarinete.wav');
info_clarinete = audioinfo('clarinete.wav');

% plot(x_clarinete(1:1000,:))

%IMAGENES

x = imread('i1.png');
imshow(x)%para rgb
y = rgb2gray(x);
imshow(y);
subplot(2,2,1),imshow(x)
subplot(2,2,2),imshow(x(:,:,1))  %commponente roja en escala de grises
subplot(2,2,3),imshow(x(:,:,2))  %commponente verde en escala de grises
subplot(2,2,4),imshow(x(:,:,3))  %commponente azul en escala de grises

%CLASES