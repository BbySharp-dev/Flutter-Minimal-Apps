import 'package:flutter/material.dart';
import 'package:flutter_chat_app/components/my_drawer.dart';

import '../components/user_tile.dart';
import '../services/auth/auth_service.dart';
import '../services/chat/chat_service.dart';
import 'chat_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

// chat & auth service
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }

// build a list of users except for the current logged-in user
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService
          .getUsersStream(), // * Theo dõi danh sách người dùng theo thời gian thực.
      builder: (context, snapshot) {
        // ! Kiểm tra nếu có lỗi trong quá trình nhận dữ liệu từ stream
        if (snapshot.hasError) {
          return const Text("Error");
        }

        // TODO: Hiển thị trạng thái chờ trong khi stream đang kết nối
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }

        // * Hiển thị danh sách người dùng trong một ListView
        return ListView(
          children: snapshot
              .data! // ! Dữ liệu từ snapshot phải được kiểm tra trước khi sử dụng.
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  // build individual list tile for user
  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    // ! Bỏ qua người dùng hiện tại và chỉ hiển thị những người dùng khác
    if (userData["email"] != _authService.getCurrentUser()!.email) {
      return UserTile(
        text: userData["email"],
        onTap: () {
          // * Khi nhấn vào user -> điều hướng đến trang chat với email của user
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                // * Truyền email của người nhận đến trang ChatPage
                receiverEmail: userData["email"],
                receiverID: userData["uid"],
              ),
            ),
          );
        },
      );
    } else {
      return Container(); // * Nếu là người dùng hiện tại, không hiển thị gì.
    }
  }
}
