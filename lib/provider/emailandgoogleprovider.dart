import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EmailGoogleProvider extends ChangeNotifier {
  bool skipemailverify = false;
  bool isemailverified = false;

  Future<void> checkEmailVerification(context) async {
    print("called check email verification");
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user!.reload();
      if (user.emailVerified) {
        isemailverified = true;
        Navigator.pushNamedAndRemoveUntil(
            context, '/authstate', (route) => false);
      }
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }

  Future<void> signInWithGoogle(context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);

    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'useremail': googleUser?.email,
      'userpassword': '',
      'useroldpassword': '',
      'emailverified': true,
      'phonenumber': '',
      'verifiedphoneno': false,
    });

    Navigator.pushNamedAndRemoveUntil(context, '/authstate', (route) => false);
  }

  // Future<void> signInWithGoogle(context) async {
  //   try {
  //     final googleUser = await GoogleSignIn().signIn();

  //     final googleAuth = await googleUser!.authentication;

  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //     await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(FirebaseAuth.instance.currentUser!.uid)
  //         .set({
  //       'useremail': googleUser.email,
  //       'userpassword': '',
  //       'useroldpassword': '',
  //       'emailverified': true,
  //     });
  //     await FirebaseAuth.instance.signInWithCredential(credential);
  //     Navigator.pushNamedAndRemoveUntil(context, '/homepage', (route) => false);
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
