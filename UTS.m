%nomer 1%
% Pastikan image package dimuat
pkg load image;

% Baca gambar
img = imread('mobil.jpeg');

% Konversi ke grayscale
gray_img = rgb2gray(img);

% Konversi ke citra biner (threshold manual)
bw_img = im2bw(gray_img, 0.5); % Ubah threshold jika perlu

% Pisahkan channel RGB
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

% Tampilkan semua dalam satu figure
figure;

subplot(2,3,1);
imshow(img);
title('Gambar Asli (RGB)');

subplot(2,3,2);
imshow(gray_img);
title('Grayscale');

subplot(2,3,3);
imshow(bw_img);
title('Citra Biner');

%nomer 2%
pkg load image;

% 1. Membaca gambar dan konversi ke grayscale
img = imread('gambarabu.jpeg');  % Ganti dengan nama file gambarmu
gray = rgb2gray(img);

% 2. Kuantisasi manual ke N level
function quant = quant_manual(gray, level)
  % Normalisasi ke 0–1
  norm_img = double(gray) / 255;

  % Kuantisasi ke level-level tertentu
  quant = floor(norm_img * level) / (level - 1);

  % Ubah kembali ke skala 0–255
  quant = uint8(quant * 255);
end

% 3. Terapkan kuantisasi ke 2, 4, dan 8 level
q2 = quant_manual(gray, 2);
q4 = quant_manual(gray, 4);
q8 = quant_manual(gray, 8);

% 4. Tampilkan hasil asli dan hasil kuantisasi
figure;

subplot(2,2,1);
imshow(gray);
title('Asli (256 Level)');

subplot(2,2,2);
imshow(q2);
title('Kuantisasi 2 Level');

subplot(2,2,3);
imshow(q4);
title('Kuantisasi 4 Level');

subplot(2,2,4);
imshow(q8);
title('Kuantisasi 8 Level');

%nomer3%
% Muat paket image
pkg load image;

% Baca gambar
img = imread('redupkatarina.jpeg');

% Konversi ke grayscale
gray_img = rgb2gray(img);

% Tingkatkan kecerahan (brightening)
bright_img = gray_img + 50;
bright_img(bright_img > 255) = 255; % Clamp ke 255

% Tampilkan hasil dan histogram dalam satu figure
figure;

subplot(2,2,1);
imshow(gray_img);
title('Citra Grayscale Asli');

subplot(2,2,2);
imhist(gray_img);
title('Histogram Sebelum Pencerahan');

subplot(2,2,3);
imshow(uint8(bright_img));
title('Citra Setelah Pencerahan');

subplot(2,2,4);
imhist(uint8(bright_img));
title('Histogram Sesudah Pencerahan');

%nomer 4%
pkg load image;

% 1. Baca gambar dan konversi ke grayscale
img = imread('mpii.jpeg');  % Ganti nama file sesuai gambar kamu
gray_img = rgb2gray(img);

% 2. Lakukan ekualisasi histogram
equalized_img = histeq(gray_img);

% 3. Tampilkan citra dan histogram sebelum & sesudah
figure;

subplot(2,2,1);
imshow(gray_img);
title('Citra Grayscale Asli');

subplot(2,2,2);
imhist(gray_img);
title('Histogram Sebelum Ekualisasi');

subplot(2,2,3);
imshow(equalized_img);
title('Citra Setelah Ekualisasi');

subplot(2,2,4);
imhist(equalized_img);
title('Histogram Setelah Ekualisasi');

%nomer 5%
pkg load image;

% 1. Baca gambar dan ubah ke grayscale
img = imread('mawar.jpeg');  % Ganti sesuai file kamu
gray_img = rgb2gray(img);

% 2. Tambahkan noise salt & pepper
noise_density = 0.05; % 5% noise
noisy_img = imnoise(gray_img, 'salt & pepper', noise_density);

% 3. Filter Median 3x3
median_filtered = medfilt2(noisy_img, [3 3]);

% 4. Filter Rata-rata (Mean) 3x3
mean_kernel = fspecial('average', [3 3]);
mean_filtered = imfilter(noisy_img, mean_kernel);

% 5. Tampilkan hasil
figure;

subplot(2,2,1);
imshow(gray_img);
title('Citra Asli');

subplot(2,2,2);
imshow(noisy_img);
title('Citra Berbintik (Salt & Pepper)');

subplot(2,2,3);
imshow(median_filtered);
title('Filter Median 3x3');

subplot(2,2,4);
imshow(mean_filtered);
title('Filter Rata-rata 3x3');

%nomer6%
pkg load image;

% 1. Baca gambar dan ubah ke grayscale
img = imread('sirih.jpeg');  % Ganti dengan nama gambar
gray_img = rgb2gray(img);

% 2. Blur gambar menggunakan filter rata-rata 3x3
mean_kernel = fspecial('average', [3 3]);
blurred = imfilter(gray_img, mean_kernel);

% 3. Hitung mask (citra highpass)
mask = double(gray_img) - double(blurred);

% 4. Parameter penguatan
A = 1.5;  % Bisa diubah sesuai kebutuhan

% 5. Hitung hasil high-boost
high_boost_img = double(gray_img) + A * mask;

% 6. Pastikan hasil dalam rentang 0-255 dan tipe uint8
high_boost_img = uint8(min(max(high_boost_img, 0), 255));

% 7. Tampilkan sebelum dan sesudah
figure;

subplot(1,2,1);
imshow(gray_img);
title('Citra Asli');

subplot(1,2,2);
imshow(high_boost_img);
title(['Hasil High-Boost Filter (A = ', num2str(A), ')']);


