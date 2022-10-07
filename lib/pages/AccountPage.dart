import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:skct_chats/pages/SignInPage.dart';
import 'package:skct_chats/provider/UserProvider.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    // appBar: AppBar(
    //   title: Text(contact.name),
    // ),
    body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(_auth.currentUser!.displayName ?? '',
              style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 25.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ),


          const SizedBox(
            width: 150.0,
            height: 20.0,
            child: Divider(
              color: Colors.grey,
            ),
          ),


          Padding(
            padding: const EdgeInsets.fromLTRB(5, 15, 5, 10),
            child: Container(
              width: 300.0,
              height: 50.0,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  gradient: LinearGradient(colors: [Color(0xFF0061ff), Color(0xFF60efff)])),
              child: ElevatedButton.icon(
                onPressed: () async{
                        UserProvider().logout();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignInPage()),

                        );
                },
                style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
                icon: const Icon(Icons.copy, size: 20),
                label: const Text("Logout",
                  style: TextStyle(
                      fontSize: 15
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
