import 'package:flutter/material.dart';
import '../../provider/quizscreenprovier.dart';
import 'package:provider/provider.dart';

class QuizResult extends StatefulWidget {
  const QuizResult({Key? key}) : super(key: key);
  @override
  State<QuizResult> createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Result"),
          backgroundColor: Colors.deepPurple,
        ),
        body: WillPopScope(
          onWillPop: () async {
            Navigator.restorablePushNamedAndRemoveUntil(
                context, '/homepage', (route) => false);
            return true;
          },
          child: Consumer<QuizScreenProvider>(
            builder: (context, value, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Your Score is ${value.correctquestionno} / ${value.questions.length}",
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      value.restartquiz();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Restart Again",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.restorablePushNamedAndRemoveUntil(
                          context, '/homepage', (route) => false);
                    },
                    child: const Text(
                      "Go to Home",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
