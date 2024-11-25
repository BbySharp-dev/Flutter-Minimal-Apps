import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // **Instance of Firebase Auth**
  // Sử dụng FirebaseAuth để quản lý các chức năng xác thực (sign in, sign up, sign out)
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // **Sign in với email và password**
  // Hàm này giúp người dùng đăng nhập với email và mật khẩu.
  Future<UserCredential> signInWithEmailPassword(
      String email, String password) async {
    try {
      // Đăng nhập người dùng với email và mật khẩu qua Firebase
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // **Xử lý lỗi từ Firebase**
      // Nếu Firebase trả về lỗi, mã lỗi sẽ được truyền đi dưới dạng Exception
      throw Exception(e.code);
    }
  }

  // **Sign up (đăng ký tài khoản mới)**
  // Hàm này tạo tài khoản mới cho người dùng bằng email và mật khẩu.
  Future<UserCredential> signUpWithEmailPassword(
      String email, String password) async {
    try {
      // Tạo tài khoản mới qua Firebase
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Trả về thông tin người dùng vừa tạo
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // **Xử lý lỗi từ Firebase**
      // Truyền lỗi thông qua Exception với mã lỗi từ Firebase
      throw Exception(e.code);
    }
  }

  // **Sign out (đăng xuất)**
  // Hàm này đăng xuất người dùng hiện tại khỏi ứng dụng.
  Future<void> signOut() async {
    return await _auth.signOut();
  }

  // **Error handling (chưa triển khai)**
  // Phần này có thể được mở rộng thêm để xử lý các lỗi chi tiết hơn, ví dụ:
  // hiển thị thông báo lỗi phù hợp với từng mã lỗi.
}
