import 'package:flutter/material.dart';
import 'package:r14firebasequizapp/Screens/HomePage/HomePage.dart';
import 'package:r14firebasequizapp/Screens/QuizResultScreen/quizresultscreen.dart';
import 'package:r14firebasequizapp/Screens/QuizScreen/quizscreen.dart';
import 'package:r14firebasequizapp/Screens/authencationscreen/LoginScreen.dart';
import 'package:r14firebasequizapp/Screens/authencationscreen/SignupScreen.dart';
import 'package:r14firebasequizapp/Screens/authencationscreen/authstatecheck.dart';
import 'package:r14firebasequizapp/Screens/authencationscreen/emailverification.dart';
import 'package:r14firebasequizapp/Screens/authencationscreen/otpverification.dart';
import 'package:r14firebasequizapp/Screens/authencationscreen/phonenoverification.dart';
import 'package:r14firebasequizapp/Screens/userprofile/userprofile.dart';
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
