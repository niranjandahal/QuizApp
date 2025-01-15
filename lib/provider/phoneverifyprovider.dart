import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class PhoneVerifyProvider extends ChangeNotifier {
  String verifyid = '';
  int? resendotptoken;
  List<List<String>> countrycode = [
    ['+977', 'nepal'],
    ['+1', 'usa'],
    ['+91', 'india'],
    ['+44', 'uk'],
    ['+61', 'australia']
  ];
  String selectedCountryCode = '+977'; // Default country code
  String userphoneNumber = '';
  String userotp = '';

  void updatecountrycode(String value) {
    selectedCountryCode = value;
    notifyListeners();
  }

  void updatephonenumber(String value) {
    userphoneNumber = value;
    notifyListeners();
  }

  void updateotp(String value) {
    userotp = value;
    notifyListeners();
  }

  Future<void> verifyphonenumber(context) async {
    _auth.verifyPhoneNumber(
      timeout: const Duration(seconds: 60),
      phoneNumber: selectedCountryCode + userphoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        verifyid = verificationId;
        resendotptoken = resendToken;
        Navigator.pushNamedAndRemoveUntil(
            context, '/otpverification', (route) => false);
      },
      codeAutoRetrievalTimeout: (String verificationId) async {
        // Auto-resolution timed out....
      },
    );
    notifyListeners();
  }

  Future<void> verifyotp(
    context,
  ) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verifyid, smsCode: userotp);
      await _auth.signInWithCredential(credential).then((value) {
        if (value.user != null) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/homepage', (route) => false);
        } else {
          print('error');
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
