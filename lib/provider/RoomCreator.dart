import 'package:flutter/material.dart';
import 'package:skct_chats/provider/UserProvider.dart';

class RoomCreator extends StatelessWidget {
  const RoomCreator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: FloatingActionButton(onPressed: () {
          UserProvider().createRoom(UserProvider().userListProvider());
      },),
    );
  }
}
