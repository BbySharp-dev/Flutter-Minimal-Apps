import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, required this.onTap});

  // email and password text controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  // tap to go to register page
  final void Function()? onTap;

  // register method
  void register() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(height: 50),

            // welcome backe message
            Text(
              "Let's create an account for you",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 50),

            // email textfield
            MyTextfield(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
            ),

            const SizedBox(height: 10),

            //pw textfield
            MyTextfield(
              hintText: "Password",
              obscureText: true,
              controller: _pwController,
            ),

            const SizedBox(height: 10),

            //confirm pw textfield
            MyTextfield(
              hintText: "Confirm Password",
              obscureText: true,
              controller: _confirmPwController,
            ),

            const SizedBox(height: 25),

            // login button
            MyButton(
              text: "Register",
              onTap: register,
            ),

            const SizedBox(height: 25),

            //register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    " Login now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

/* 
  * **Kiến thức cần nhớ**:
    - **Controller**:
      - Sử dụng `TextEditingController` để quản lý dữ liệu nhập vào từ 3 `TextField`: Email, Password, và Confirm Password.
      - Đảm bảo gọi `dispose()` để giải phóng controller khi widget không còn tồn tại, nếu widget chuyển thành `StatefulWidget`.

    - **Custom Widgets**:
      - `MyTextfield` và `MyButton` giúp tối ưu hóa việc tái sử dụng UI components.

    - **Theme**:
      - Màu sắc được quản lý đồng bộ thông qua `Theme`, đảm bảo giao diện phù hợp với toàn bộ ứng dụng.

    - **GestureDetector**:
      - Sử dụng `GestureDetector` để thêm sự kiện nhấn vào phần "Login now", điều hướng đến trang đăng nhập.

  ! **Lưu ý**:
    - **Password Validation**:
      - Hiện tại, không có logic xác nhận mật khẩu và xác nhận lại mật khẩu. Hãy thêm kiểm tra để đảm bảo hai trường mật khẩu khớp nhau.
    - **Security**:
      - Hãy mã hóa mật khẩu trước khi gửi đến server.
    - **Responsiveness**:
      - Sử dụng `SingleChildScrollView` nếu giao diện có khả năng bị tràn màn hình trên các thiết bị nhỏ.

  TODO:
    - Thêm xác thực dữ liệu nhập (email hợp lệ, mật khẩu đủ độ dài).
    - Xử lý logic trong hàm `register()` khi đăng ký thành công hoặc lỗi.
    - Tích hợp API để gửi yêu cầu đăng ký đến server.
    - Cải thiện trải nghiệm người dùng với loading indicator.
*/