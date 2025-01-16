import 'package:flutter/material.dart';
import 'package:r14firebasequizapp/screens/homepage/homepage.dart';
import 'package:r14firebasequizapp/screens/quizresultscreen/quizresultscreen.dart';
import 'package:r14firebasequizapp/screens/quizscreen/quizscreen.dart';
import 'package:r14firebasequizapp/screens/authencationscreen/loginscreen.dart';
import 'package:r14firebasequizapp/screens/authencationscreen/signupscreen.dart';
import 'package:r14firebasequizapp/screens/authencationscreen/authstatecheck.dart';
import 'package:r14firebasequizapp/screens/authencationscreen/emailverification.dart';
import 'package:r14firebasequizapp/screens/authencationscreen/otpverification.dart';
import 'package:r14firebasequizapp/screens/authencationscreen/phonenoverification.dart';
import 'package:r14firebasequizapp/screens/userprofile/userprofile.dart';
import 'package:r14firebasequizapp/main.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => const IntermediartenHome(),
  '/login': (context) => const LoginScreen(),
  '/signup': (context) => const SignUpScreen(),
  '/homepage': (context) => const HomePage(),
  '/quizscreen': (context) => const SampleQuizScreen(),
  '/quizresult': (context) => const QuizResult(),
  '/authstate': (context) => const AuthStateChecker(),
  '/emailverification': (context) => const EmailVerificaton(),
  '/profile': (context) => const UserProfile(),
  '/phoneverify': (context) => const PhoneVerification(),
  '/otpverification': (context) => OtpVerification(),
};
