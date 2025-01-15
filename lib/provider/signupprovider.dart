import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String signupsnackbarmessage = '';
  bool showsignupsnakbar = false;

  String passwordStrength = '';
  final RegExp simplePasswordRegex =
      RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');

  bool isPasswordValid = true;
  bool isEmailValid = true;
  bool doPasswordsMatch = true;

  ////////////////////////REGISTER SCREEN CONTROLLWER AND FUNCTION FOR VALIDITY OF EMAIL AND PASSWORD/////////////////////////////
  ///

  void validatePassword(String password) {
    isPasswordValid = simplePasswordRegex.hasMatch(password);
    String errorMessage;

    if (password.length < 8) {
      isPasswordValid = false;
      errorMessage = 'shoule be at least 8 characters long';
    } else if (!RegExp(r'[a-z]').hasMatch(password)) {
      isPasswordValid = false;
      errorMessage = 'should contain at least one lowercase letter';
    } else if (!RegExp(r'[A-Z]').hasMatch(password)) {
      isPasswordValid = false;
      errorMessage = 'should contain at least one uppercase letter';
    } else if (!RegExp(r'[0-9]').hasMatch(password)) {
      isPasswordValid = false;
      errorMessage = 'should contain at least one digit';
    } else {
      errorMessage = 'Strong password';
    }
    passwordStrength = errorMessage;

    notifyListeners();
  }

  void validateEmail(String email) {
    isEmailValid =
        RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(email);
    notifyListeners();
  }

  void validatePasswordsMatch(String password, String confirmPassword) {
    doPasswordsMatch = password == confirmPassword;
    notifyListeners();
  }

  Future<void> registeruser(context) async {
    if (isEmailValid && isPasswordValid && doPasswordsMatch) {
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        if (credential.user != null) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(credential.user!.uid)
              .set({
            'useremail': emailController.text,
            'userpassword': passwordController.text,
            'useroldpassword': '',
            'emailverified': false,
          });
          await credential.user!.sendEmailVerification();

          showsignupsnakbar = true;
          signupsnackbarmessage = 'Registration Successfull';
          Navigator.pushNamedAndRemoveUntil(
              context, '/authstate', (route) => false);
          notifyListeners();
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          showsignupsnakbar = true;
          signupsnackbarmessage = 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          showsignupsnakbar = true;
          signupsnackbarmessage = 'The account already exists for that email.';
        }
      } catch (e) {
        showsignupsnakbar = true;
        signupsnackbarmessage = 'Something went wrong';
        print(e);
      }
      notifyListeners();
    } else {
      showsignupsnakbar = true;
      signupsnackbarmessage = 'Please enter valid email and password';
      notifyListeners();
    }
  }

  void resetControllers() {
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    notifyListeners();
  }
}
