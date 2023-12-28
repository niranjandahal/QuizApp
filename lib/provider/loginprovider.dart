import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginProvider with ChangeNotifier {
  TextEditingController loginemail = TextEditingController();
  TextEditingController loginpass = TextEditingController();

  bool isloginPasswordValid = true;
  bool isloginEmailValid = true;
  String loginpasswordmessage = '';
  String loginsnackbarmeassage = '';
  bool showsnakbar = false;

  final RegExp simplePasswordRegex =
      RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');

  void validateloginPassword(String password) {
    isloginPasswordValid = simplePasswordRegex.hasMatch(password);
    String? errorMessage = '';

    if (password.length < 8) {
      isloginPasswordValid = false;
      errorMessage = 'Your password is at least 8 characters long';
    } else if (!RegExp(r'[a-z]').hasMatch(password)) {
      isloginPasswordValid = false;
      errorMessage = 'your password have at least one lowercase letter';
    } else if (!RegExp(r'[A-Z]').hasMatch(password)) {
      isloginPasswordValid = false;
      errorMessage = 'your password have at least one uppercase letter';
    } else if (!RegExp(r'[0-9]').hasMatch(password)) {
      isloginPasswordValid = false;
      errorMessage = 'your password have at least one digit';
    } else {
      isloginPasswordValid = true;
    }
    loginpasswordmessage = errorMessage;

    notifyListeners();
  }

  void validateloginEmail(String email) {
    isloginEmailValid =
        RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(email);
    notifyListeners();
  }

  Future<void> signinuser(context) async {
    if (isloginEmailValid && isloginPasswordValid) {
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: loginemail.text, password: loginpass.text);
        if (credential.user != null) {
          showsnakbar = true;
          loginsnackbarmeassage = 'Login Successfull';

          Navigator.pushNamedAndRemoveUntil(
              context, '/authstate', (route) => false);
          notifyListeners();
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          showsnakbar = true;
          loginsnackbarmeassage = 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          showsnakbar = true;
          loginsnackbarmeassage = 'Wrong password provided for that user.';
        } else {
          showsnakbar = true;
          loginsnackbarmeassage = 'Something went wrong';
        }
      }
      notifyListeners();
    } else {
      showsnakbar = true;
      loginsnackbarmeassage = 'Please enter valid email and password';
      notifyListeners();
    }
  }

  void resetControllers() {
    loginemail.clear();
    loginpass.clear();
    notifyListeners();
  }

  void closeSnackbar() {
    showsnakbar = false;
    notifyListeners();
  }
}
