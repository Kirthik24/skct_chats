import 'package:flutter/material.dart';
import 'package:skct_chats/provider/UserProvider.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class RoomCreator extends StatelessWidget {
  const RoomCreator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: FloatingActionButton(onPressed: () {
          // UserProvider().createRoom(UserProvider().userListProvider());
            //UserProvider().userListProvider();
            // print(UserProvider().defaultUserListProvider()UserListProvider());

          //   print(UserProvider().userList);
      },),
    );
  }
}
