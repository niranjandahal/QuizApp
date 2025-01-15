import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r14firebasequizapp/provider/phoneverifyprovider.dart';
import 'package:lottie/lottie.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({Key? key}) : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PhoneVerifyProvider>(
        builder: (context, otpval, child) => Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/animations/otpphonescreen.json',
                repeat: true, reverse: true),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Enter OTP',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                otpval.userotp = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                otpval.verifyotp(context);
              },
              child: const Text('Verify'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/phoneverify', (route) => false);
              },
              child: const Text('Edit phoneNumber '),
            ),
          ],
        )),
      ),
    );
  }
}
