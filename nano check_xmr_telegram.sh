#!/bin/bash

# Cấu hình Telegram
TELEGRAM_BOT_TOKEN="7728290966:AAEg35tq18zMPey6N-XG1Uh8Nsj2YYbrt8s"
TELEGRAM_CHAT_ID="6023625137"

# Cấu hình XMR
XMR_ADDRESS="85BvvbNHc2wCZUYwUqojbqYHFBAixfdjRME2CE5kccLWcHv4J5n7L7QFxXF7HT5G2XYyM62pMLf5oaCH2hwmtzPa83Rfkcu"
API_URL="https://hashvault.pro/api/balance/$XMR_ADDRESS"

# File lưu trữ số XMR cũ (để so sánh)
XMR_LOG_FILE="xmr_balance.log"

# Hàm gửi tin nhắn Telegram
send_telegram_msg() {
  local MSG="$1"
  curl -s -X POST "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage" \
    -d "chat_id=${TELEGRAM_CHAT_ID}" \
    -d "text=${MSG}" \
    -d "parse_mode=Markdown"
}

# Kiểm tra kết nối Internet
if ! ping -c 1 hashvault.pro &> /dev/null; then
  send_telegram_msg "❌ *Lỗi XMR Script*: Không thể kết nối đến Hashvault. Kiểm tra Internet!"
  exit 1
fi

# Lấy số XMR hiện tại từ API
RESPONSE=$(curl -s "$API_URL")
BALANCE=$(echo "$RESPONSE" | jq -r '.stats.balance')
PAID=$(echo "$RESPONSE" | jq -r '.stats.paid')
TOTAL=$(echo "$RESPONSE" | jq -r '.stats.total')

# Đọc số XMR cũ từ file (nếu có)
if [ -f "$XMR_LOG_FILE" ]; then
  OLD_TOTAL=$(cat "$XMR_LOG_FILE")
else
  OLD_TOTAL=0
fi

# So sánh và gửi thông báo nếu có thay đổi
if [ "$(echo "$TOTAL > $OLD_TOTAL" | bc)" -eq 1 ]; then
  MSG="🚀 *Cập nhật XMR từ Hashvault*:
  ➕ Số XMR mới đào: $(echo "$TOTAL - $OLD_TOTAL" | bc | xargs printf "%.6f")
  💰 Chưa thanh toán: $BALANCE
  💳 Đã nhận: $PAID
  📊 Tổng XMR: $TOTAL"
  send_telegram_msg "$MSG"
fi

# Lưu số XMR hiện tại vào file
echo "$TOTAL" > "$XMR_LOG_FILE"

