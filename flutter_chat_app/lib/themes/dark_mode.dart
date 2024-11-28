import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
    colorScheme: ColorScheme.dark(
  surface: Colors.grey.shade900, // ! Deprecated: Không sử dụng background nữa
  primary: Colors.grey.shade600,
  secondary: const Color.fromARGB(255, 57, 57, 57),
  tertiary: Colors.grey.shade800,
  inversePrimary: Colors.grey.shade300,
));


/**
 * @ IMPORTANT
 * - Dùng `surface` thay thế cho `background` vì background đã bị deprecated.
 * 
 * ! Deprecated
 * - `background` trong `ColorScheme` không được khuyến nghị sử dụng từ **v3.18.0-0.1.pre**.
 * 
 * TODO
 * - Refactor toàn bộ các component để đảm bảo tuân theo Material Design 3.
 * 
 * ? Liệu có cần cập nhật các widget khác liên quan tới theme?
 * 
 * @ Link tham khảo
 * - https://api.flutter.dev/flutter/material/ColorScheme-class.html
 */