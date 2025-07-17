% Tugas Praktikum 4 - Versi Dua Figure (Tanpa Efek Terowongan Cahaya)
pkg load image;

% --- 1. Baca foto selfie
img = imread('karina.jpg');
img_asli = img;

% --- 2. Rotasi selfie
angle = -10;
img_rotated = imrotate(img, angle, 'bilinear');

% --- 3. Perbesar ukuran wajah (Scaling)
scale_factor = 1.3;
img_scaled = imresize(img_rotated, scale_factor);

% --- 4. Translasi (geser)
[h, w, c] = size(img_scaled);
img_translated = uint8(zeros(h + 20, w + 40, c));
img_translated(21:end, 41:end, :) = img_scaled;

% --- 5. Flip horizontal
img_flipped = fliplr(img_translated);

% Gambar dasar untuk efek IG
img_ig = img_flipped;

% --- 6. Efek Cermin
img_mirror = [img_ig(:, end:-1:1, :) img_ig];

% --- 7. Efek Kaleidoskop
img_kaleido = repmat(img_ig, 2, 2);
img_kaleido(:, w+1:end, :) = fliplr(img_kaleido(:, w+1:end, :));
img_kaleido(h+1:end, :, :) = flipud(img_kaleido(h+1:end, :, :));

% --- 8. Efek Thermal
img_gray = rgb2gray(img_ig);
img_gray = im2double(img_gray);
img_thermal = ind2rgb(gray2ind(img_gray, 256), jet(256));

% --- 9. Efek Cembung (Fisheye Sederhana)
[h, w, c] = size(img_ig);
cx = w / 2; cy = h / 2;
R = min(cx, cy);
img_cembung = zeros(h, w, c, 'uint8');
for y = 1:h
  for x = 1:w
    dx = (x - cx) / R;
    dy = (y - cy) / R;
    r = sqrt(dx^2 + dy^2);
    if r <= 1
      r_new = r^1.5;
      theta = atan2(dy, dx);
      u = round(cx + R * r_new * cos(theta));
      v = round(cy + R * r_new * sin(theta));
      if u >= 1 && u <= w && v >= 1 && v <= h
        img_cembung(y, x, :) = img_ig(v, u, :);
      end
    end
  end
end

% ==============================
% === TAMPILKAN DALAM 2 FIGURE
% ==============================

% --- FIGURE 1: Transformasi Dasar (1–5)
figure('Name', 'Transformasi Dasar');
subplot(3,2,1), imshow(img_asli), title('1. Asli');
subplot(3,2,2), imshow(img_rotated), title('2. Rotasi');
subplot(3,2,3), imshow(img_scaled), title('3. Skala');
subplot(3,2,4), imshow(img_translated), title('4. Translasi');
subplot(3,2,5), imshow(img_flipped), title('5. Flip Horizontal');

% --- FIGURE 2: Efek Kamera IG (6–9)
figure('Name', 'Efek Kamera IG');
subplot(2,2,1), imshow(img_mirror), title('6. Cermin');
subplot(2,2,2), imshow(img_kaleido), title('7. Kaleidoskop');
subplot(2,2,3), imshow(img_thermal), title('8. Thermal');
subplot(2,2,4), imshow(img_cembung), title('9. Cembung');

