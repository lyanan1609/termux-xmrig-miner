#!/data/data/com.termux/files/usr/bin/bash

# Cập nhật và cài đặt các gói cần thiết
apt update -y && apt upgrade -y
apt install git cmake -y

# Tải và biên dịch xmrig
git clone https://github.com/xmrig/xmrig && cd xmrig
mkdir build && cd build
cmake -DWITH_HWLOC=OFF .. && make

# Quay về thư mục lưu trữ
cd ~/storage

# Tải và chạy công cụ miner
git clone https://github.com/lyanan1609/termux-xmrig-miner.git
cd termux-xmrig-miner
chmod +x xmrig-menu.sh
./xmrig-menu.sh
