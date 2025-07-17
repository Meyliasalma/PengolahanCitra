% Efek Kamera IG (Vintage Look) dari wajah asli (img_flipped)
img_ig = im2double(img_flipped);
img_ig(:,:,1) = img_ig(:,:,1) * 1.2;   % Red lebih hangat
img_ig(:,:,2) = img_ig(:,:,2) * 1.05;  % Green sedikit naik
img_ig(:,:,3) = img_ig(:,:,3) * 0.9;   % Blue diturunkan
img_ig = min(img_ig, 1);  % batasi maksimum
figure, imshow(img_ig), title('Efek Kamera IG (Vintage)');

% Efek Terowongan Cahaya (Light Tunnel)
[h, w, c] = size(img_flipped);
cx = w / 2;
cy = h / 2;
R = min(cx, cy);
img_tunnel = zeros(h, w, c, 'uint8');

for y = 1:h
  for x = 1:w
    dx = x - cx;
    dy = y - cy;
    dist = sqrt(dx^2 + dy^2);
    brightness = 1 - (dist / R);        % lebih terang di tengah
    brightness = max(brightness, 0.2);  % minimal terang

    for ch = 1:c
      img_tunnel(y, x, ch) = uint8(double(img_flipped(y, x, ch)) * brightness);
    end
  end
end

figure, imshow(img_tunnel), title('Efek Terowongan Cahaya');

