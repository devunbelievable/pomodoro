# 🍅 Pomodoro Task Manager – Flutter

Một ứng dụng quản lý thời gian và công việc hiệu quả dựa trên **phương pháp Pomodoro**, được phát triển bằng **Flutter**, hướng tới sự đơn giản, tập trung và dễ sử dụng.

---

## 📖 Giới thiệu về Pomodoro

**Phương pháp Pomodoro** là một kỹ thuật quản trị thời gian được phát triển bởi *Francesco Cirillo* vào cuối những năm 1980.  
Phương pháp này sử dụng bộ hẹn giờ để chia công việc thành các khoảng thời gian tập trung (thường là **25 phút**), xen kẽ với các khoảng nghỉ ngắn (**5 phút**) và nghỉ dài (**15 phút**).  
Mỗi khoảng thời gian tập trung được gọi là một **pomodoro**.

Mục tiêu của phương pháp:
- Tăng khả năng tập trung
- Giảm sự mệt mỏi
- Nâng cao hiệu suất làm việc

---

## ✨ Tính năng chính

- ⏱ **Bộ hẹn giờ Pomodoro**
    - Chu kỳ mặc định: 25 phút làm việc – 5 phút nghỉ
    - Hỗ trợ Start / Pause
- 📝 **Quản lý Task**
    - Thêm, sửa, xóa công việc
    - Đánh dấu hoàn thành
- 📊 **Thống kê & Lịch sử**
    - Lọc task theo trạng thái: Tất cả / Hoàn thành / Chưa hoàn thành
- 🎨 **Giao diện tùy biến**
    - Drawer hỗ trợ lọc dữ liệu
    - UI tối giản, tập trung trải nghiệm người dùng
- 🔔 **Thông báo (Local Notification)**
    - Nhắc khi kết thúc phiên tập trung hoặc phiên nghỉ

---

## 🛠 Công nghệ sử dụng

- **Framework:** Flutter
- **Ngôn ngữ:** Dart
- **Lưu trữ local:** SQLite
- **Thông báo:** Awesome Notifications

---

## ⚠️ Lưu ý quan trọng (Important Note)

Dự án được phát triển và kiểm thử chủ yếu trên:
- **Hệ điều hành:** Windows
- **Nền tảng:** Android

> **IMPORTANT**  
> **Đối với người dùng iOS / iPhone:**  
> Do hạn chế về môi trường phát triển (hiện tại mình không có macOS để build và kiểm thử trên Xcode), ứng dụng **chưa được tối ưu cho iOS** và có thể gặp lỗi hiển thị hoặc hành vi không mong muốn.  
> Rất mong nhận được sự thông cảm hoặc đóng góp (Pull Request) từ các bạn có thiết bị Apple.

---

## 🚀 Hướng dẫn cài đặt

### 1. Yêu cầu hệ thống
Trước khi chạy ứng dụng, hãy đảm bảo máy của bạn đã cài đặt:

- **Flutter SDK** (khuyến nghị v3.38.5)  
  👉 https://docs.flutter.dev/get-started/install
- **Git**
- **Android Studio** hoặc **Visual Studio Code**
- **Android SDK** (đi kèm Android Studio)
- **Thiết bị Android thật** hoặc **Android Emulator**

Kiểm tra môi trường Flutter:

```bash
flutter doctor
```

### 2. Clone repository
```bash
git clone https://github.com/devunbelievable/pomodoro.git
cd pomodoro
```

### 3. Cài đặt dependencies
```bassh
flutter pub get
```

### 4. Kiểm tra thiết bị chạy
```bassh
flutter devices
```
#### ví dụ:
```bash
❯ flutter devices
Found 4 connected devices:
  sdk gphone64 x86 64 (mobile) • emulator-5554 • android-x64    • Android 16 (API 36) (emulator)
  Windows (desktop)            • windows       • windows-x64    • Microsoft Windows [Version 10.0.26200.7462]
  Chrome (web)                 • chrome        • web-javascript • Google Chrome 143.0.7499.170
  Edge (web)                   • edge          • web-javascript • Microsoft Edge 143.0.3650.139
```

### 5. Chạy ứng dụng
```bash
flutter run
```
#### Chọn thiết bị từ 1 - 4 (q để thoát)

#### hoặc chạy đúng thiết bị trên
```bash
flutter run -d emulator-5554
```