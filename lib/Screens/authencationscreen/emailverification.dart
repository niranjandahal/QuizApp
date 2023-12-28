// import 'package:provider/provider.dart';
// import 'package:flutter/material.dart';
// import 'package:r14firebasequizapp/Screens/HomePage/HomePage.dart';
// import 'package:r14firebasequizapp/Screens/authencationscreen/LoginScreen.dart';
// import 'package:r14firebasequizapp/provider/emailandgoogleprovider.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:r14firebasequizapp/provider/emailandgoogleprovider.dart';
import 'package:provider/provider.dart';

class EmailVerificaton extends StatefulWidget {
  const EmailVerificaton({super.key});

  @override
  State<EmailVerificaton> createState() => _EmailVerificatonState();
}

class _EmailVerificatonState extends State<EmailVerificaton> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    // Start a timer to call checkEmailVerification every 10 seconds
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      Provider.of<EmailGoogleProvider>(context, listen: false)
          .checkEmailVerification(context);
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed to prevent memory leaks
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false);
                },
                child: const Text(
                  'wrong email?',
                  style: TextStyle(color: Colors.white),
                )),
          ],
          title: const Text('Email Verification'),
          backgroundColor: Colors.deepPurple, // Customize the app bar color
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Please wait some second after verifying email',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(
                Icons.email,
                size: 100,
                color: Colors.deepPurple, // Customize the icon color
              ),
              const Text(
                'Please verify your email',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add the logic to resend the verification email
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                ),
                child: const Text(
                  'Resend Verification Email',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple),
                  ),
                  onPressed: () {
                    Provider.of<EmailGoogleProvider>(context, listen: false)
                        .checkEmailVerification(context);
                  },
                  child: const Text(
                    'I have verified my email',
                    style: TextStyle(color: Colors.white),
                  )),
              //skip the email verification
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/homepage', (route) => false);
                  },
                  child: const Text('Skip')),
            ],
          ),
        ));
  }
}
