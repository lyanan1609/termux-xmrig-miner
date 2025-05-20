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


---

3. Menu chức năng

Sau khi chạy, bạn sẽ thấy menu:

1. Bắt đầu đào
2. Cập nhật tool XMRig
3. Xem giá đồng XMR
0. Thoát


---

Cấu hình mặc định

Pool: asia.hashvault.pro:443

Algo: rx (RandomX)

Wallet mẫu: 85BvvbNH... (Bạn nên đổi sang ví của bạn)

Threads: 7 (có thể điều chỉnh theo CPU điện thoại)



---

Gợi ý: Thay đổi ví Monero

Bạn có thể chỉnh sửa ví trong dòng:

./xmrig -o asia.hashvault.pro:443 -a rx -u YOUR_WALLET_ADDRESS -p N20U-001 -t 7

Thay YOUR_WALLET_ADDRESS bằng ví Monero của bạn.


---

Yêu cầu hệ thống

Android 7+ (root không bắt buộc)

Termux (mới nhất từ F-Droid)

Kết nối Internet ổn định



---

Lưu ý

Sử dụng với mục đích cá nhân, học tập hoặc thử nghiệm.

Đào bằng điện thoại có thể làm nóng máy và hao pin nhanh.

Tác giả không chịu trách nhiệm về việc sử dụng sai mục đích.



---

Tác giả

GitHub: https://github.com/lyanan1609

Script hỗ trợ bởi: ChatGPT (OpenAI)



---

License

MIT License - Tự do chỉnh sửa, chia sẻ, sử dụng.
