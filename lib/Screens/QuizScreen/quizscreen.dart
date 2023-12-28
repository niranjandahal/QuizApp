import 'package:flutter/material.dart';
import 'package:r14firebasequizapp/Screens/QuizScreen/buildwidgets.dart';
import 'package:r14firebasequizapp/widgetcustomcomponent/customwidgetcomponent.dart';
import '../../provider/quizscreenprovier.dart';
import 'package:provider/provider.dart';

class SampleQuizScreen extends StatefulWidget {
  const SampleQuizScreen({Key? key}) : super(key: key);

  // const SampleQuizScreen({super.key});

  @override
  State<SampleQuizScreen> createState() => _SampleQuizScreenState();
}

class _SampleQuizScreenState extends State<SampleQuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuizScreenProvider>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: customtext("${value.currentcategory} Quiz", Colors.white, 30,
              FontWeight.bold),
          backgroundColor: Colors.deepPurple,
        ),
        backgroundColor: Colors.grey.shade200,
        body: WillPopScope(
          onWillPop: () async {
            Navigator.pushNamedAndRemoveUntil(
                context, '/homepage', (route) => false);
            return true;
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: customtext(
                      "Questions : ${value.currentquestionindex + 1} / ${value.questions.length}",
                      Colors.deepPurple,
                      20,
                      FontWeight.bold),
                ),
                const SizedBox(
                  height: 25,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: customtext(
                      "${value.questions[value.currentquestionindex]} ?? " "",
                      Colors.black,
                      18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: ListView.builder(
                      //provider required in itemcount
                      itemCount:
                          value.optionList[value.currentquestionindex].length,
                      itemBuilder: (context, index) {
                        return OptionBuildLogic(
                          value.optionList[value.currentquestionindex][index],
                          index,
                        );
                      }),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () {
                        value.nextquestion(context);
                      },
                      child: customtext(
                          "Next Question", Colors.white, 20, FontWeight.bold)),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
