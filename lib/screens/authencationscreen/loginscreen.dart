import 'package:flutter/material.dart';
import 'package:r14firebasequizapp/widgetcustomcomponent/authbuildwidgets.dart';
import 'package:r14firebasequizapp/provider/emailandgoogleprovider.dart';
import 'package:r14firebasequizapp/widgetcustomcomponent/customwidgetcomponent.dart';
import 'package:r14firebasequizapp/provider/loginprovider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/homepage', (route) => false);
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),

                  customtext(
                    'Welcome to Quiz',
                    Colors.deepPurple,
                    24,
                    FontWeight.bold,
                  ),
                  const SizedBox(height: 20),
                  Consumer<LoginProvider>(
                    builder: (context, value, child) => customtextfield(
                      context: context,
                      controller: value.loginemail,
                      hintText: 'Username',
                      prefixIcon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (email) {
                        value.validateloginEmail(email);
                      },
                      errorText: value.isloginEmailValid
                          ? null
                          : 'Invalid email address',
                    ),
                  ),
                  const SizedBox(height: 20),
                  Consumer<LoginProvider>(
                    builder: (context, value, child) => customtextfield(
                      context: context,
                      controller: value.loginpass,
                      hintText: 'Password',
                      prefixIcon: Icons.lock,
                      obscureText: true,
                      onChanged: (password) {
                        value.validateloginPassword(password);
                      },
                      errorText: value.isloginPasswordValid
                          ? null
                          : value.loginpasswordmessage,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  custbutton(
                    context,
                    const Icon(Icons.login, color: Colors.white),
                    'Sign In',
                    () async {
                      // Handle Sign-In with username and password here
                      await Provider.of<LoginProvider>(context, listen: false)
                          .signinuser(context);
                    },
                  ),
                  const SizedBox(height: 20),
                  custbutton(
                    context,
                    const Icon(Icons.person_add, color: Colors.white),
                    'Sign Up',
                    () {
                      Provider.of<LoginProvider>(context, listen: false)
                          .resetControllers();
                      Navigator.pushNamed(context, '/signup');
                      // Handle Sign-Up logic here
                    },
                  ),
                  const SizedBox(height: 20),
                  //a line divider with text or continue with
                  dividerforloginsignup(),
                  const SizedBox(height: 20),
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
                  // custbutton(
                  //   context,
                  //   const Icon(Icons.person, color: Colors.white),
                  //   'Show Current User',
                  //   () {
                  //     //write whole code
                  //     Provider.of<EmailGoogleProvider>(context, listen: false)
                  //         .showCurrentUser();
                  //   },
                  // ),
                ],
              ),
            ),
          ),
          //skip button with light white background color and black text color
        ));
  }
}
