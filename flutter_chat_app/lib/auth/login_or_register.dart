import 'package:flutter/material.dart';
import 'package:flutter_chat_app/pages/login_page.dart';
import 'package:flutter_chat_app/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  // initially, show login page
  bool showLoginPage = true;

  // toggle between login and register page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: togglePages,
      );
    } else {
      return RegisterPage(
        onTap: togglePages,
      );
    }
  }
}

/* 
  * **Kiến thức cần nhớ**:
    - **StatefulWidget**:
      - `LoginOrRegister` được triển khai dưới dạng `StatefulWidget` vì cần thay đổi trạng thái giao diện giữa 2 trang (Login và Register).

    - **State Management**:
      - `setState` được sử dụng để cập nhật trạng thái `showLoginPage` khi chuyển đổi giữa các trang.

    - **Conditional Rendering**:
      - Sử dụng cấu trúc điều kiện `if (showLoginPage)` để xác định trang nào được hiển thị.

  ! **Lưu ý**:
    - Trạng thái `showLoginPage`:
      - Đây là trạng thái đơn giản phù hợp cho các ứng dụng nhỏ. Tuy nhiên, với ứng dụng lớn, hãy cân nhắc sử dụng state management như `Provider`, `Bloc`, hoặc `Riverpod`.
    - Hiệu suất:
      - Mỗi lần `setState` được gọi, cả widget sẽ được rebuild. Điều này không hiệu quả nếu số lượng widget phức tạp.

  TODO:
    - Cải thiện trải nghiệm người dùng bằng hiệu ứng chuyển trang (sử dụng `PageTransition` hoặc `PageView`).
    - Tích hợp kiểm tra xác thực tài khoản hoặc ghi nhớ trạng thái đăng nhập.
    - Xử lý logic lỗi đăng nhập/đăng ký và hiển thị thông báo lỗi.

  ? **Câu hỏi để tư duy thêm**:
    - Có cách nào tối ưu togglePages để chỉ rebuild phần cần thiết không?
    - Nên lưu trạng thái `showLoginPage` vào đâu để duy trì giữa các lần mở ứng dụng?
*/