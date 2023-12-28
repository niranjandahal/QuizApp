import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProvider extends ChangeNotifier {
  bool isuserdataloaded = false;
  String currenuseremail = '';
  String currenuserphonenumber = '';
  String currentusername = '';
  bool isemailverified = false;
  bool isphonenumberverified = false;

  //function to get user data from firestore database
  Future<void> getUserData() async {
    if (isuserdataloaded == false) {
      try {
        final user = FirebaseAuth.instance.currentUser;
        final userdata = await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .get();
        currenuseremail = userdata['useremail'];
        currenuserphonenumber = userdata['phonenumber'];
        currentusername = userdata['username'];
        isemailverified = userdata['emailverified'];
        isphonenumberverified = userdata['verifiedphoneno'];
        notifyListeners();
      } catch (e) {
        print(e);
      }
      //check if the valid user  email is loaded or not
    } else {
      print("user false data loades");
    }
  }

  //function to add user to firestore database
  Future<void> addUserToFirestore() async {
    final user = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
      'useremail': user.email,
      'userpassword': '',
      'useroldpassword': '',
      'emailverified': true,
      'phonenumber': '',
      'verifiedphoneno': false,
    });
    notifyListeners();
  }
}
