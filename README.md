# Termux XMRig Miner - Đào Monero trên Android (Termux)

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
Tải Termux từ F-Droid (khuyên dùng):  
[https://f-droid.org/packages/com.termux/](https://f-droid.org/packages/com.termux/)

---

### 2. Chạy script

```bash
curl -sLO https://raw.githubusercontent.com/lyanan1609/termux-xmrig-miner/main/xmrig-menu.sh
chmod +x xmrig-menu.sh
./xmrig-menu.sh
