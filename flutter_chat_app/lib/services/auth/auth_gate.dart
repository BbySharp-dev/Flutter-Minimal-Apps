import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/services/auth/login_or_register.dart';
import 'package:flutter_chat_app/pages/home_page.dart';

// **AuthGate Widget**
// Widget này hoạt động như một cổng kiểm tra, chuyển hướng người dùng
// đến trang phù hợp (HomePage hoặc Login/Register) dựa trên trạng thái đăng nhập.
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        // **stream**
        // Lắng nghe sự thay đổi trạng thái đăng nhập từ Firebase qua
        // hàm `authStateChanges` để kiểm tra người dùng đã đăng nhập hay chưa.
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // **Trạng thái: Người dùng đã đăng nhập**
          // Nếu stream trả về dữ liệu hợp lệ (có người dùng đăng nhập),
          // chuyển hướng đến trang HomePage.
          if (snapshot.hasData) {
            return HomePage();
          }

          // **Trạng thái: Người dùng chưa đăng nhập**
          // Nếu không có người dùng nào đang đăng nhập, chuyển hướng
          // đến trang LoginOrRegister.
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
