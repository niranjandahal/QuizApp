// import 'package:r14firebasequizapp/provider/UserProvider.dart';
// import 'package:r14firebasequizapp/provider/emailandgoogleprovider.dart';
// import 'package:r14firebasequizapp/provider/loginprovider.dart';
// import 'package:r14firebasequizapp/provider/phoneverifyprovider.dart';
// import 'package:r14firebasequizapp/provider/quizscreenprovier.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:r14firebasequizapp/provider/signoutprovider.dart';
// import 'package:r14firebasequizapp/provider/signupprovider.dart';
// import 'firebase_options.dart';
// import 'package:provider/provider.dart';
// import 'package:lottie/lottie.dart';
// import 'package:r14firebasequizapp/routes/routes.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MultiProvider(
//     providers: [
//       ChangeNotifierProvider(create: (_) => QuizScreenProvider()),
//       ChangeNotifierProvider(create: (_) => EmailGoogleProvider()),
//       ChangeNotifierProvider(create: (_) => LoginProvider()),
//       ChangeNotifierProvider(create: (_) => SignoutProvider()),
//       ChangeNotifierProvider(create: (_) => SignupProvider()),
//       ChangeNotifierProvider(create: (_) => UserProvider()),
//       ChangeNotifierProvider(create: (_) => PhoneVerifyProvider()),
//     ],
//     child: const MyApp(),
//   ));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       // home: IntermediartenHome(),
//       initialRoute: '/',
//       routes: routes,
//     );
//   }
// }

// class IntermediartenHome extends StatefulWidget {
//   const IntermediartenHome({Key? key}) : super(key: key);

//   @override
//   State<IntermediartenHome> createState() => _IntermediartenHomeState();
// }

// class _IntermediartenHomeState extends State<IntermediartenHome> {
//   @override
//   void initState() {
//     super.initState();
//     // Use Future.delayed to add a 5-second delay before navigating to the login page
//     Future.delayed(const Duration(seconds: 4), () {
//       Navigator.pushNamedAndRemoveUntil(
//           context, '/authstate', (route) => false);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade200,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Lottie.asset('assets/animations/txtanimation.json', repeat: false),
//             Lottie.asset('assets/animations/quizstartscreen.json',
//                 repeat: true),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:r14firebasequizapp/provider/userprovider.dart';
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
      builder: (context, child) {
        return ForcedMobileView(child: child!);
      },
      initialRoute: '/',
      routes: routes,
    );
  }
}

class ForcedMobileView extends StatelessWidget {
  final Widget child;

  const ForcedMobileView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // Define Pixel 7 dimensions
    const double mobileWidth = 480; // Pixel 7 width
    const double mobileHeight = 1050; // Pixel 7 height

    // Get the current screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Force mobile dimensions if the screen is larger than mobile size
    if (screenWidth > mobileWidth || screenHeight > mobileHeight) {
      return Column(
        children: [
          const Text(
            'Zoom out browser to see full screen',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 7),
          const Text(
            'app maynot work properly as it is shown via web forcefully',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 100),
          Center(
            child: Container(
              width: mobileWidth,
              height: mobileHeight,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5), blurRadius: 10),
                ],
              ),
              child: MediaQuery(
                data: MediaQueryData(
                  size: const Size(mobileWidth, mobileHeight),
                  devicePixelRatio: MediaQuery.of(context).devicePixelRatio,
                  padding: MediaQuery.of(context).padding,
                  viewInsets: MediaQuery.of(context).viewInsets,
                ),
                child: child,
              ),
            ),
          ),
        ],
      );
    }

    // Default rendering for mobile-sized screens
    return child;
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
    // Use Future.delayed to add a 4-second delay before navigating to the login page
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
