import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const MyTextfield({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.tertiary),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.primary),
            ),
            fillColor: Theme.of(context).colorScheme.secondary,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary)),
      ),
    );
  }
}
/* 
  * Cấu trúc Widget:
    - Sử dụng `StatelessWidget` vì `MyTextfield` chỉ là một widget hiển thị UI, không cần quản lý trạng thái động.
    - Nhận các giá trị `hintText`, `obscureText`, và `controller` thông qua constructor để tái sử dụng linh hoạt.

  * Sử dụng Theme:
    - Các thuộc tính màu (`colorScheme.tertiary`, `colorScheme.primary`, `colorScheme.secondary`) được sử dụng từ `Theme` của ứng dụng để đảm bảo tính đồng nhất.
    - `fillColor` được sử dụng để làm nổi bật vùng nhập liệu bằng màu nền (secondary) khi chưa focus.

  * TextField:
    - `controller` đảm bảo quản lý nội dung nhập vào, giúp truyền dữ liệu giữa UI và logic của ứng dụng.
    - `obscureText` hữu ích khi tạo các trường nhập mật khẩu (ẩn ký tự người dùng nhập).

  * Bố cục:
    - Sử dụng `Padding` để tạo khoảng cách xung quanh `TextField`.
    - `hintText` cung cấp văn bản gợi ý giúp người dùng hiểu nội dung cần nhập.

  ! Quan trọng:
    - **Đồng bộ Theme**: Đảm bảo các màu trong `Theme` được định nghĩa đầy đủ trong `colorScheme` của `ThemeData` để tránh lỗi màu không xác định.
    - **controller**: Cần khởi tạo `TextEditingController` ở nơi gọi widget này và đảm bảo giải phóng nó sau khi không sử dụng.

  TODO:
    - Thêm chức năng xác thực dữ liệu khi người dùng nhập (Validation) nếu sử dụng cho biểu mẫu.
    - Hỗ trợ các trạng thái khác nhau (ví dụ: báo lỗi nếu dữ liệu không hợp lệ).
    - Xử lý tối ưu cho các trường hợp đa ngôn ngữ bằng cách truyền văn bản qua `hintText`.

*/
