import 'package:flutter/material.dart';
import 'package:r14firebasequizapp/provider/quizscreenprovier.dart';
import 'package:provider/provider.dart';
import 'package:r14firebasequizapp/widgetcustomcomponent/customwidgetcomponent.dart';

class OptionBuildLogic extends StatelessWidget {
  final String text;
  final int index;

  const OptionBuildLogic(this.text, this.index, {super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<QuizScreenProvider>(
      builder: (context, value, child) {
        Color bordercolor = Colors.transparent;
        if (value.isanswered) {
          if (index == value.useroptionselection && value.isAnswerCorrect) {
            bordercolor = Colors.green;
          } else if (index == value.useroptionselection &&
              !value.isAnswerCorrect) {
            bordercolor = Colors.red;
          } else if (index != value.useroptionselection &&
              index == value.correctanswers[value.currentquestionindex]) {
            bordercolor = Colors.green;
          }
        }
        return Container(
          margin: const EdgeInsets.only(top: 5),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white, //    Change the background color as needed
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: bordercolor, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              value.updateuserselection(index);
            },
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: customtext(text, Colors.black, 16, FontWeight.bold)),
          ),
        );
      },
    );
  }
}
