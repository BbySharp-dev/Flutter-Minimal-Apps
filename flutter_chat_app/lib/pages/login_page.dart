import 'package:flutter/material.dart';
import 'package:flutter_chat_app/components/my_button.dart';
import 'package:flutter_chat_app/components/my_textfield.dart';
import '../services/auth/auth_service.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, required this.onTap});

  // Controllers quản lý dữ liệu nhập của email và mật khẩu
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  // Hàm chuyển đến trang đăng ký
  final void Function()? onTap;

  // Phương thức xử lý đăng nhập
  void login(BuildContext context) async {
    // Khởi tạo AuthService để thực hiện các thao tác Firebase Auth
    final authService = AuthService();

    // Thử thực hiện đăng nhập
    try {
      await authService.signInWithEmailPassword(
        _emailController.text,
        _pwController.text,
      );
    }

    // Bắt lỗi khi đăng nhập thất bại
    catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(e.toString()), // Hiển thị mã lỗi
            content: Text(e.toString()), // Nội dung chi tiết lỗi
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Màu nền toàn bộ giao diện
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Biểu tượng logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(height: 50),

            // Thông báo chào mừng người dùng
            Text(
              "Welcome back, you've been missed!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 50),

            // TextField để nhập email
            MyTextfield(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
            ),

            const SizedBox(height: 10),

            // TextField để nhập mật khẩu
            MyTextfield(
              hintText: "Password",
              obscureText: true,
              controller: _pwController,
            ),

            const SizedBox(height: 25),

            // Nút đăng nhập
            MyButton(
              text: "Login",
              onTap: () => login(context), // Gọi hàm login khi nhấn
            ),

            const SizedBox(height: 25),

            // Phần chuyển hướng đến trang đăng ký
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member? ",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap, // Gọi hàm chuyển hướng khi nhấn
                  child: Text(
                    "Register now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
