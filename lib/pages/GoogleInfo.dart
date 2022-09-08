

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GoogleInfo extends StatelessWidget {
   GoogleInfo({Key? key}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser!;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Name: ' + user.displayName!),
          Text('Email: ' + user.email!)
        ],
      ),
    );
  }
}
