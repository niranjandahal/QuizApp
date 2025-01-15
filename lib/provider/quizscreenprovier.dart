import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuizScreenProvider extends ChangeNotifier {
  bool categoryloaded = false;
  String quiztittle = "sample tittle";
  int? useroptionselection;
  int currentquestionindex = 0;
  int correctquestionno = 0;
  bool isanswered = false;
  bool isAnswerCorrect = false;
  bool quizcompleted = false;
  late List<String> categorylist = [];
  late String currentcategory;
  List<String> questions = [];
  List<List<String>> optionList = [];
  List<int> correctanswers = [];
  List<String> categoryimages = [];

  Future<void> fetchcategory() async {
    if (categoryloaded == true) {
      return;
    } else if (categoryloaded == false) {
      categoryloaded = true;
      FirebaseFirestore ndfr = FirebaseFirestore.instance;
      String collectionpath = '/quizcategory'; // Use the correct path
      QuerySnapshot querySnapshot = await ndfr.collection(collectionpath).get();
      querySnapshot.docs.forEach((element) {
        categorylist.add(element.id);
        categoryimages.add(element['images']);
      });
    }

    notifyListeners();
  }

  void updatecurrentcategory(String category) {
    currentcategory = category;
    notifyListeners();
  }

  Future<void> fetchQuestionsForCurrentCategory(context) async {
    questions.clear();
    optionList.clear();
    correctanswers.clear();

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String collectionPath =
        '/quiz/category/$currentcategory'; // Use the correct path

    try {
      QuerySnapshot quizSnapshot =
          await firestore.collection(collectionPath).get();

      // Process the quiz data
      if (quizSnapshot.docs.isNotEmpty) {
        // Get a list of all available quiz data
        List<QueryDocumentSnapshot> allQuizData = quizSnapshot.docs;

        // Select the first 10 quiz sets or the number of questions requested
        for (int i = 0; i < 10; i++) {
          QueryDocumentSnapshot document = allQuizData[i];
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;

          // Access quiz data
          String question = data['question'];
          List<String> options = List<String>.from(data['options']);
          int correctAnswer = data['correctAnswer'];

          // Process or store the data as needed
          questions.add(question);
          optionList.add(options);
          correctanswers.add(correctAnswer);

          notifyListeners();
        }
      } else {
        print('No quiz data found for the current category.');
      }
    } catch (e) {
      print('Error fetching quiz data: $e');
    }

    Navigator.restorablePushNamedAndRemoveUntil(
        context, '/quizscreen', (route) => false);
    notifyListeners();
  }

  void updateuserselection(int index) {
    if (!isanswered) {
      useroptionselection = index;
      isanscorrect();
      isanswered = true;
    }
    notifyListeners();
  }

  void inrcurrentquestion() {
    currentquestionindex++;
    notifyListeners();
  }

  void isanscorrect() {
    if (useroptionselection == correctanswers[currentquestionindex]) {
      isAnswerCorrect = true;
      correctquestionno++;
    }
    notifyListeners();
  }

  void nextquestion(context) {
    isanswered = false;
    isAnswerCorrect = false;
    useroptionselection = null;

    if (currentquestionindex < questions.length - 1) {
      currentquestionindex++;
    } else {
      // Handle quiz completion when there are no more questions
      quizcompleted = true;
      notifyListeners();
      Navigator.pushNamedAndRemoveUntil(
          context, '/quizresult', (route) => false);
    }

    notifyListeners();
  }

  void restartquiz() {
    isanswered = false;
    isAnswerCorrect = false;
    useroptionselection = null;
    currentquestionindex = 0;
    correctquestionno = 0;
    quizcompleted = false;
    notifyListeners();
  }
}
