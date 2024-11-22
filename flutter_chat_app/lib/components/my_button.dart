import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const MyButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}

/* 
  * Design Pattern
    - Sử dụng `StatelessWidget` vì giao diện (UI) của nút và hành vi không cần thay đổi, không cần trạng thái động.

  * Sử dụng Theme
    - Màu nền của nút được lấy từ `Theme.of(context).colorScheme.secondary`, đảm bảo đồng bộ với theme của ứng dụng.

  * GestureDetector
    - `GestureDetector` được sử dụng thay cho `ElevatedButton` hoặc `TextButton` để tùy chỉnh linh hoạt và xử lý cử chỉ.
    - Lưu ý: Nếu `onTap` không được truyền vào, nút sẽ không phản hồi khi bấm. Đảm bảo luôn truyền một callback hợp lệ hoặc xử lý logic trong giao diện.

  * Chi tiết Bố cục
    - `BoxDecoration` được sử dụng để cài đặt màu nền và border radius cho nút.
    - Padding và margin được thêm để căn chỉnh và tạo khoảng cách đồng nhất cho nội dung nút.

  ! Quan trọng:
    - `onTap` là nullable (`void Function()?`), nếu không được truyền giá trị, nút sẽ không tương tác được. Đảm bảo kiểm tra hoặc cung cấp callback hợp lệ.

  TODO:
    - Thêm phản hồi giao diện khi người dùng bấm nút (ví dụ: thay đổi màu khi nhấn). Có thể sử dụng `Material` cùng với `InkWell` để đạt được hiệu ứng này.
    - Cân nhắc việc hỗ trợ đa ngôn ngữ (i18n) cho thuộc tính `text` nếu ứng dụng hỗ trợ nhiều ngôn ngữ.
*/