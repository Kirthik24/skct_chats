import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skct_chats/pages/GroupChat.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {



  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.png"),
                fit: BoxFit.cover
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("SKCT",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 33,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Text("Contacts",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 31,
                        fontWeight: FontWeight.w300,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: SizedBox(
                        width: 250,
                        child: Text
                          ('''Welcome to Skct Contacts !!!
Please login with your Official mail ID to continue.''',
                          style: TextStyle(
                              color: Color(0xFF878593),
                              fontSize: 15,
                              height: 1.3,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ),
                  ]
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 120),
              child: Center(
                child: Container(
                  width: 200.0,
                  height: 55.0,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      gradient: LinearGradient(
                          colors: [Color(0xFF6451dd), Color(0xFF26a8e2)])),
                  child: ElevatedButton.icon(
                    onPressed: () {
                       Future<UserCredential> user = signInWithGoogle();

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const GroupChat()),
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.transparent,
                        shadowColor: Colors.transparent),
                    icon: const Icon(Icons.arrow_right_alt, size: 20),
                    label: const Text("Google Sign In",
                      style: TextStyle(
                          fontSize: 15
                      ),
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
}
