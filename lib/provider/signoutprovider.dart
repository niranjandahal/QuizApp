import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignoutProvider extends ChangeNotifier {
  Future<void> signOut(context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(context, '/authstate', (route) => false);
    notifyListeners();
  }
}
