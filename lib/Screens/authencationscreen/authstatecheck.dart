import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:r14firebasequizapp/Screens/HomePage/HomePage.dart';
import 'package:r14firebasequizapp/Screens/authencationscreen/LoginScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:r14firebasequizapp/Screens/authencationscreen/emailverification.dart';
import 'package:r14firebasequizapp/Screens/errorsscreen/errordefault.dart';

class AuthStateChecker extends StatelessWidget {
  const AuthStateChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Handle loading state
          return const CircularProgressIndicator(); // You can use a loading indicator here
        } else if (snapshot.hasError) {
          // Handle error state
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            if (user.emailVerified) {
              FirebaseFirestore.instance
                  .collection('users')
                  .doc(user.uid)
                  .get()
                  .then((DocumentSnapshot documentSnapshot) {
                if (documentSnapshot.exists) {
                  return const HomePage();
                } else {
                  return const LoginScreen();
                }
              }).catchError((error) {
                return ErrorDefault();
              });
            } else {
              return const EmailVerificaton();
            }
          }
          return const HomePage();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
