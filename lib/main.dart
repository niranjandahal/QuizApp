import 'package:r14firebasequizapp/provider/UserProvider.dart';
import 'package:r14firebasequizapp/provider/emailandgoogleprovider.dart';
import 'package:r14firebasequizapp/provider/loginprovider.dart';
import 'package:r14firebasequizapp/provider/phoneverifyprovider.dart';
import 'package:r14firebasequizapp/provider/quizscreenprovier.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:r14firebasequizapp/provider/signoutprovider.dart';
import 'package:r14firebasequizapp/provider/signupprovider.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:r14firebasequizapp/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => QuizScreenProvider()),
      ChangeNotifierProvider(create: (_) => EmailGoogleProvider()),
      ChangeNotifierProvider(create: (_) => LoginProvider()),
      ChangeNotifierProvider(create: (_) => SignoutProvider()),
      ChangeNotifierProvider(create: (_) => SignupProvider()),
      ChangeNotifierProvider(create: (_) => UserProvider()),
      ChangeNotifierProvider(create: (_) => PhoneVerifyProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: IntermediartenHome(),
      initialRoute: '/',
      routes: routes,
    );
  }
}

class IntermediartenHome extends StatefulWidget {
  const IntermediartenHome({Key? key}) : super(key: key);

  @override
  State<IntermediartenHome> createState() => _IntermediartenHomeState();
}

class _IntermediartenHomeState extends State<IntermediartenHome> {
  @override
  void initState() {
    super.initState();
    // Use Future.delayed to add a 5-second delay before navigating to the login page
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushNamedAndRemoveUntil(
          context, '/authstate', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/animations/txtanimation.json', repeat: false),
            Lottie.asset('assets/animations/quizstartscreen.json',
                repeat: true),
          ],
        ),
      ),
    );
  }
}
