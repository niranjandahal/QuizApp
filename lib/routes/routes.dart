import 'package:flutter/material.dart';
import 'package:r14firebasequizapp/screens/HomePage/HomePage.dart';
import 'package:r14firebasequizapp/Screens/QuizResultScreen/quizresultscreen.dart';
import 'package:r14firebasequizapp/screens/QuizScreen/quizscreen.dart';
import 'package:r14firebasequizapp/screens/authencationscreen/loginscreen.dart';
import 'package:r14firebasequizapp/Screens/authencationscreen/SignupScreen.dart';
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
