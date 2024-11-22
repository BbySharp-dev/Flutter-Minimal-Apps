import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    colorScheme: ColorScheme.light(
  surface: Colors.grey.shade300, // ! Deprecated: Không sử dụng background nữa
  primary: Colors.grey.shade500,
  secondary: Colors.grey.shade200,
  tertiary: Colors.white,
  inversePrimary: Colors.grey.shade900,
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