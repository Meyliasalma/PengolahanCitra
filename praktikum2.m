## Tugas Praktikum 2%
pkg load image;

## 1. Menampilkan Histogram
img = imread('wallhaven-jxprop.jpg');
img = im2uint8(img); % Pastikan dalam format uint8

figure;
subplot(2,2,1); imshow(img); title('Gambar Asli');
subplot(2,2,2); imhist(img); title('Histogram Gambar Asli');

R = img(:, :, 1); % Channel Merah
G = img(:, :, 2); % Channel Hijau
B = img(:, :, 3); % Channel Biru

figure;
subplot(3,2,1); imshow(R); title('Channel Merah');
subplot(3,2,2); imhist(R); title('Histogram Merah');
subplot(3,2,3); imshow(G); title('Channel Hijau');
subplot(3,2,4); imhist(G); title('Histogram Hijau');
subplot(3,2,5); imshow(B); title('Channel Biru');
subplot(3,2,6); imhist(B); title('Histogram Biru');

## 2. Meningkatkan Kecerahan
imgGray = rgb2gray(img);
imgCerah = imgGray + 50;

figure;
subplot(2,2,1); imshow(imgGray); title('Grayscale Asli');
subplot(2,2,2); imhist(imgGray); title('Histogram Asli');
subplot(2,2,3); imshow(imgCerah); title('Grayscale Cerah');
subplot(2,2,4); imhist(imgCerah); title('Histogram Setelah Dicerahkan');

## 3. Meregangkan Kontras
imgKontras = imadjust(imgGray, stretchlim(imgGray), []);

figure;
subplot(2,2,1); imshow(imgGray); title('Grayscale Asli');
subplot(2,2,2); imhist(imgGray); title('Histogram Asli');
subplot(2,2,3); imshow(imgKontras); title('Setelah Kontras Stretching');
subplot(2,2,4); imhist(imgKontras); title('Histogram Kontras Stretching');

## 4. Kombinasi Kecerahan dan Kontras
imgKombinasi = imadjust(imgGray, [], [], 1.2) + 30;

figure;
subplot(2,2,1); imshow(imgGray); title('Grayscale Asli');
subplot(2,2,2); imhist(imgGray); title('Histogram Asli');
subplot(2,2,3); imshow(imgKombinasi); title('Kombinasi Cerah & Kontras');
subplot(2,2,4); imhist(imgKombinasi); title('Histogram Kombinasi');

## 5. Membalik Citra (Inversi)
imgbalik = 255 - imgGray;

figure;
subplot(2,2,1); imshow(imgGray); title('Grayscale Asli');
subplot(2,2,2); imhist(imgGray); title('Histogram Asli');
subplot(2,2,3); imshow(imgbalik); title('Gambar Dibalik');
subplot(2,2,4); imhist(imgbalik); title('Histogram Dibalik');

## 6. Pemetaan Nonlinear (Log)
imgLog = uint8(100 * log(1 + double(imgGray)));

figure;
subplot(2,2,1); imshow(imgGray); title('Grayscale Asli');
subplot(2,2,2); imhist(imgGray); title('Histogram Asli');
subplot(2,2,3); imshow(imgLog); title('Log Transform');
subplot(2,2,4); imhist(imgLog); title('Histogram Log');

## 7. Thresholding
threshold = 100;
imgThreshold = imgGray > threshold;

figure;
subplot(1,2,1); imshow(imgThreshold); title('Thresholding > 100');
subplot(1,2,2); imhist(uint8(imgThreshold)*255); title('Histogram Thresholding');

## 8. Ekualisasi Histogram
imgEqual = histeq(imgGray);

figure;
subplot(2,2,1); imshow(imgGray); title('Grayscale Asli');
subplot(2,2,2); imhist(imgGray); title('Histogram Asli');
subplot(2,2,3); imshow(imgEqual); title('Setelah Ekualisasi');
subplot(2,2,4); imhist(imgEqual); title('Histogram Ekualisasi');

