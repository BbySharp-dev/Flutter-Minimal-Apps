import 'package:flutter/material.dart';
import 'package:flutter_chat_app/components/my_button.dart';
import 'package:flutter_chat_app/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, required this.onTap});

  // email and password text controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  // tap to go to register page
  final void Function()? onTap;

  // login method
  void login() {}

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
              "Wellcome back, you've been missed!",
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

            const SizedBox(height: 25),

            // login button
            MyButton(
              text: "Login",
              onTap: login,
            ),

            const SizedBox(height: 25),

            //register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member? ",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    " Register now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
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

/* 
  * **Kiến thức cần nhớ**:
    - **Controller**:
      - Sử dụng `TextEditingController` để quản lý dữ liệu nhập vào từ hai `TextField` (Email và Password).
      - Đừng quên gọi `dispose()` để giải phóng controller khi widget không còn tồn tại nếu sử dụng `StatefulWidget`.

    - **Custom Widgets**:
      - `MyTextfield` và `MyButton` là các widget tùy chỉnh, giúp tái sử dụng giao diện và logic trong ứng dụng.

    - **Theme**:
      - Tất cả các màu trong widget được lấy từ `Theme` để đảm bảo đồng nhất giao diện. Màu được gọi từ `Theme.of(context).colorScheme`.

    - **GestureDetector**:
      - `GestureDetector` được sử dụng để tạo hiệu ứng nhấn cho `Register now`, giúp mở trang đăng ký.

  ! **Lưu ý**:
    - **Không có logic cho nút Login**: Chưa có logic để xử lý `login()`. Cần bổ sung tính năng kiểm tra email/password và kết nối API.
    - **Validation**: Không có logic xác thực dữ liệu đầu vào trong các `TextField`. Hãy thêm xác thực để đảm bảo dữ liệu hợp lệ.
    - **TextOverflow**: Với `Text` trong ứng dụng, nếu nội dung có khả năng bị tràn, hãy sử dụng thuộc tính `overflow` hoặc `maxLines`.

  TODO:
    - Thêm thông báo lỗi cho trường hợp nhập sai email/password.
    - Xử lý chuyển màn hình khi đăng nhập thành công.
    - Cải thiện bố cục để hỗ trợ đa ngôn ngữ.
    - Thêm chức năng `loading` khi chờ kết quả từ server.
*/