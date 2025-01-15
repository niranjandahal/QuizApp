import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r14firebasequizapp/provider/emailandgoogleprovider.dart';
import 'package:r14firebasequizapp/provider/signupprovider.dart';
import 'package:r14firebasequizapp/widgetcustomcomponent/authbuildwidgets.dart';
import 'package:r14firebasequizapp/widgetcustomcomponent/customwidgetcomponent.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                customtext(
                  'Signup for Quiz',
                  Colors.deepPurple,
                  24,
                  FontWeight.bold,
                ),
                const SizedBox(height: 20),
                Consumer<SignupProvider>(
                  builder: (context, value, child) => customtextfield(
                    context: context,
                    controller: value.emailController,
                    hintText: 'Email',
                    prefixIcon: Icons.email,
                    onChanged: (email) {
                      value.validateEmail(email);
                    },
                    errorText:
                        value.isEmailValid ? null : 'Invalid email address',
                  ),
                ),
                const SizedBox(height: 20),
                Consumer<SignupProvider>(
                  builder: (context, value, child) => customtextfield(
                    context: context,
                    obscureText: true,
                    prefixIcon: Icons.lock,
                    controller: value.passwordController,
                    hintText: 'Password',
                    onChanged: (password) {
                      value.validatePassword(password);
                      value.validatePasswordsMatch(
                          password, value.confirmPasswordController.text);
                    },
                    errorText:
                        value.isPasswordValid ? null : value.passwordStrength,
                  ),
                ),
                const SizedBox(height: 20),
                Consumer<SignupProvider>(
                  builder: (context, value, child) => customtextfield(
                    obscureText: true,
                    context: context,
                    prefixIcon: Icons.lock,
                    controller: value.confirmPasswordController,
                    hintText: 'Confirm Password',
                    onChanged: (confirmPassword) {
                      value.validatePasswordsMatch(
                          value.passwordController.text, confirmPassword);
                    },
                    errorText: value.doPasswordsMatch
                        ? null
                        : 'Passwords do not match',
                  ),
                ),
                const SizedBox(height: 20),
                custbutton(
                  context,
                  const Icon(Icons.person_add, color: Colors.white),
                  'Sign Up',
                  () async {
                    await Provider.of<SignupProvider>(context, listen: false)
                        .registeruser(context);
                    // Handle Sign-In with username and password here
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customtext(
                      'Already have an account?',
                      Colors.black,
                      16,
                      FontWeight.w400,
                    ),
                    TextButton(
                      onPressed: () {
                        Provider.of<SignupProvider>(context, listen: false)
                            .resetControllers();
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/login', (route) => false);
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                dividerforloginsignup(),
                const SizedBox(height: 30),
                custbutton(
                  context,
                  Image.asset(
                    'assets/icons/googleicon.png',
                    height: 30,
                    width: 30,
                  ),
                  'Sign In with Google',
                  () async {
                    await Provider.of<EmailGoogleProvider>(context,
                            listen: false)
                        .signInWithGoogle(context);
                    // Handle Sign-In with Google here
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
