import 'package:flutter/material.dart';
import 'package:flutter_chat_app/themes/light_mode.dart';
import 'auth/login_or_register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginOrRegister(),
      theme: lightMode,
    );
  }
}

/*
  * **Kiến thức cần nhớ**:
    - **Cấu trúc cơ bản**:
      - `MyApp` là widget gốc được sử dụng để khởi chạy ứng dụng Flutter.
      - Sử dụng `MaterialApp` để cấu hình chủ đề (theme), tiêu đề (title), và các trang chính.

    - **Theme**:
      - `lightMode`: Một theme được import từ file `light_mode.dart`. Đây là cách tổ chức code tốt khi cần cấu hình các chủ đề khác nhau cho ứng dụng.

    - **Navigation**:
      - `home: LoginOrRegister()` là trang khởi động đầu tiên của ứng dụng. Nó được định nghĩa để chuyển đổi giữa trang đăng nhập và đăng ký.

    - **Quản lý Debug Banner**:
      - `debugShowCheckedModeBanner: false` tắt biểu ngữ "DEBUG" góc trên bên phải khi chạy ứng dụng trong chế độ debug.

  ! **Lưu ý**:
    - **Code tổ chức tốt**:
      - Đảm bảo `lightMode` được định nghĩa trong file `light_mode.dart` và cấu hình đầy đủ các thuộc tính theme (e.g., `primaryColor`, `colorScheme`).
    - **Cấu hình theme**:
      - Nếu muốn hỗ trợ chế độ tối, thêm logic để tự động chuyển giữa `lightMode` và `darkMode` dựa vào cài đặt hệ thống hoặc người dùng.

  TODO:
    - Thêm logic chuyển đổi theme light/dark.
    - Xử lý `LoginOrRegister` để đảm bảo trang đăng nhập/đăng ký hoạt động mượt mà.
    - Cân nhắc thêm `Route` để điều hướng tốt hơn giữa các trang thay vì quản lý trực tiếp bằng widget.

  ? **Câu hỏi để tư duy thêm**:
    - Làm sao để tối ưu quản lý theme cho ứng dụng lớn hơn?
    - Nếu ứng dụng cần đa ngôn ngữ, làm thế nào để tích hợp `Localization` trong `MaterialApp`?
*/