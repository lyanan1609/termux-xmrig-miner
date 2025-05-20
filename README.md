# Termux XMRig Miner - Đào Monero tự động trên Android (Termux)

Một script đơn giản giúp bạn đào Monero (XMR) bằng `XMRig` trên Android thông qua Termux. Script có menu tiện lợi: bắt đầu đào, cập nhật công cụ, và xem giá XMR hiện tại.

---

## Tính năng

- [x] Bắt đầu đào XMR bằng `xmrig`
- [x] Cập nhật tool `xmrig` từ GitHub
- [x] Xem giá XMR theo thời gian thực từ CoinGecko
- [x] Hiển thị giao diện hệ thống với `neofetch`
- [x] Kiểm tra kết nối mạng tự động
- [x] Giao diện dễ dùng, menu đơn giản

---

## Hướng dẫn cài đặt và sử dụng

### 1. Cài đặt Termux
Tải Termux từ GitHub (khuyên dùng):  
[https://github.com/termux/termux-app/releases/tag/v0.118.2](https://github.com/termux/termux-app/releases/tag/v0.118.2)

---

### 2. Chạy lệnh cài tool XMRig

1. `apt-get update -y && apt-get install git -y && pkg install cmake`
2. `apt update -y && apt upgrade -y`
3. `git clone https://github.com/xmrig/xmrig && cd xmrig`
4. `mkdir build && cd build`
5. `cmake -DWITH_HWLOC=OFF .. && make` and Wait a few minutes while it downloads the data.
6. after complete all processing just --open new session--

---

### 3. Chạy lệnh cài auto đào coin XMRig

