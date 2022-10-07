import 'package:flutter/material.dart';
import 'package:skct_chats/pages/AccountPage.dart';
import 'package:skct_chats/pages/ChatPage.dart';
import 'package:skct_chats/pages/ContactHomePage.dart';
import 'package:skct_chats/provider/UserProvider.dart';
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  final List<Widget> _pages = <Widget>[
    const ContactHomePage(),
    ChatPage(room: UserProvider().roomProvider()),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: Center(
        child: _pages.elementAt(_selectedIndex), //New
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
