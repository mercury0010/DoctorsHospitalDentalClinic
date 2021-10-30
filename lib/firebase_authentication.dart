import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'reg_users.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  RegUsers currentUser;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  final CollectionReference regUsers =
      FirebaseFirestore.instance.collection("regusers");

  Authentication(
      {FirebaseAuth? auth, GoogleSignIn? googleSignIn, RegUsers? loginUser})
      : _auth = auth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn(),
        currentUser = loginUser ?? RegUsers();

  RegUsers userFromFirebaseUser(User user) {
    return RegUsers(
      uid: user.uid,
      displayname: user.displayName ?? "",
      email: user.email ?? "",
      photoUrl: user.photoURL ?? "",
      display: false,
    );
  }

  Stream<RegUsers> get getUser {
    return _auth.authStateChanges().map((user) {
      return userFromFirebaseUser(user!);
    }).handleError((error) {
      return RegUsers();
    });
  }

  RegUsers getCurrentUser(BuildContext context) {
    return userFromFirebaseUser(_auth.currentUser!);
  }

  Future loginWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthhentication =
          await googleSignInAccount!.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthhentication.idToken,
        accessToken: googleSignInAuthhentication.accessToken,
      );

      UserCredential result = await _auth.signInWithCredential(credential);

      final User? user = result.user;
      final User? currentUser = _auth.currentUser;
      assert(user!.uid == currentUser!.uid);
      RegUsers loginUser = RegUsers();
      loginUser = userFromFirebaseUser(user!);

      DocumentSnapshot ds = await FirebaseFirestore.instance
          .collection("regusers")
          .doc(loginUser.uid)
          .get();
      if (ds.exists) {
        loginUser.display = ds["display"];
      } else {
        FirebaseFirestore.instance
            .collection("regusers")
            .doc(loginUser.uid)
            .set({
          "display": true,
          "displayname": loginUser.displayname,
          "email": loginUser.email,
          "photoUrl": loginUser.photoUrl,
        });
      }
      print("FirebaseAuth " +
          loginUser.display.toString() +
          " " +
          loginUser.displayname);
      this.currentUser = loginUser;

      return loginUser;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> logOut(BuildContext context) async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
