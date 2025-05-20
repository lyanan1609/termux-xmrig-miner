#!/data/data/com.termux/files/usr/bin/bash

echo "[*] Đang cài đặt Termux XMRig Miner..."
pkg update -y && pkg upgrade -y
pkg install -y git curl jq neofetch cmake build-essential clang

echo "[*] Tải script từ GitHub..."
git clone https://github.com/lyanan1609/termux-xmrig-miner.git
cd termux-xmrig-miner || exit

chmod +x xmrig-menu.sh
echo "[✓] Cài đặt hoàn tất. Chạy script..."
./xmrig-menu.sh
