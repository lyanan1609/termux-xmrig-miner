#!/data/data/com.termux/files/usr/bin/bash

# Màu
RED='\033[1;31m'; GREEN='\033[1;32m'; BLUE='\033[1;34m'; CYAN='\033[1;36m'; YELLOW='\033[1;33m'; NC='\033[0m'

# Cài các gói cần thiết
echo -e "${YELLOW}[*] Đang cài đặt các gói cần thiết...${NC}"
pkg install -y git curl clang cmake build-essential neofetch jq > /dev/null 2>&1

# Tải và build xmrig nếu chưa có
if [ ! -f ~/xmrig/build/xmrig ]; then
  echo -e "${BLUE}[*] Đang tải và build XMRig...${NC}"
  rm -rf ~/xmrig
  git clone https://github.com/xmrig/xmrig.git ~/xmrig
  mkdir -p ~/xmrig/build && cd ~/xmrig/build
  cmake ..
  make -j$(nproc)
  echo -e "${GREEN}[✓] Đã cài đặt XMRig xong!${NC}"
fi

# Hàm banner
show_banner() {
  clear
  neofetch
  echo -e "${CYAN}"
  echo "╔═══════════════════════════════════════════════╗"
  echo "║       SCRIPT ĐÀO XMR TỰ ĐỘNG - TERMUX         ║"
  echo "╚═══════════════════════════════════════════════╝"
  echo -e "${NC}"
}

# Kiểm tra mạng
check_internet() {
  ping -c 1 8.8.8.8 > /dev/null 2>&1
  return $?
}

# Bắt đầu đào
start_mining() {
  echo -e "${YELLOW}[*] Kiểm tra kết nối mạng...${NC}"
  attempts=0; max_attempts=10
  while ! check_internet; do
    echo -e "${RED}[!] Không có mạng. Thử lại sau 10s...${NC}"
    attempts=$((attempts + 1))
    if [ "$attempts" -ge "$max_attempts" ]; then echo -e "${RED}[X] Thoát.${NC}"; return; fi
    sleep 10
  done

  echo -e "${GREEN}[✓] Mạng OK. Bắt đầu đào...${NC}"
  sleep 2
  cd ~/xmrig/build || { echo -e "${RED}[X] Không tìm thấy thư mục XMRig!${NC}"; return; }

  while true; do
    ./xmrig -o asia.hashvault.pro:443 -a rx -u 85BvvbNHc2wCZUYwUqojbqYHFBAixfdjRME2CE5kccLWcHv4J5n7L7QFxXF7HT5G2XYyM62pMLf5oaCH2hwmtzPa83Rfkcu -p N20U-001 -t 7
    echo -e "${RED}[!] XMRig dừng. Khởi động lại sau 10s...${NC}"
    sleep 10
  done
}

# Menu
while true; do
  show_banner
  echo -e "${CYAN}Chọn chức năng:${NC}"
  echo "1. Bắt đầu đào"
  echo "0. Thoát"
  read -p "> Nhập lựa chọn: " choice

  case $choice in
    1) start_mining ;;
    0) echo -e "${YELLOW}Tạm biệt!${NC}"; exit 0 ;;
    *) echo -e "${RED}Lựa chọn không hợp lệ.${NC}" ;;
  esac
  echo -e "${YELLOW}Nhấn Enter để tiếp tục...${NC}"
  read
done
