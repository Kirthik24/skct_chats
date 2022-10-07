import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';


class UserProvider{

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

  Future<void> logout() async{
      var googleSignInAccount = GoogleSignIn() ;
      await googleSignInAccount.disconnect();
      FirebaseAuth.instance.signOut();
  }


  Future<void> addUserToFirebase() async {
    await FirebaseChatCore.instance.createUserInFirestore(
      types.User(
        firstName: _auth.currentUser!.displayName,
        // id: credential.user!.uid, // UID from Firebase Authentication
        id: FirebaseChatCore.instance.firebaseUser?.uid ?? '',
      ),
    );
  }


  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Room

  types.Room roomProvider(){
    return types.Room(id: "42KHUVvWfv3NLpvRbXnU", type: types.RoomType.group, users: defaultUserListProvider());
  }

  Future<void> createRoom(List<types.User> users) async {
    final room = await FirebaseChatCore.instance.getFirebaseFirestore()
        .collection('rooms')
        .add({
      'createdAt': FieldValue.serverTimestamp(),
      'imageUrl': 'www.ravi.com',
      'metadata': 'hello',
      'name': 'group 1',
      'type': types.RoomType.group.toShortString(),
      'updatedAt': FieldValue.serverTimestamp(),
      'userIds': users.map((u) => u.id).toList(),
      'userRoles': users.fold<Map<String, String?>>(
        {},
            (previousValue, user) => {
          ...previousValue,
          user.id: user.role?.toShortString(),
        },
      ),
    });
  }

  // user



  types.User provideUser(){
    types.User current_user = types.User(
        id: FirebaseChatCore.instance.firebaseUser?.uid ?? '',
        firstName: _auth.currentUser!.displayName

    );

    return current_user;
  }


  List<types.User> defaultUserListProvider(){
    List<types.User> li = [];
    li.add(provideUser());
    //print(li);
    return li;
  }







  List<types.User> li2 = [];

  types.User adder(types.User u){
    li2.add(u);
    //print(li2);
    return u;
  }

  Future<List<types.User>> printer() async{
    List<types.User> li = [];
    var data = await FirebaseFirestore.instance.collection('users').get();

    for (var doc in data.docs) {
      types.User person = types.User(id:doc.id, firstName:doc["firstName"]);
      li.add(person);

    }
    return li;
  }
















}