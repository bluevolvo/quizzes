import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizzes/QuestionSet/QuestionSetsList.dart';
import 'package:quizzes/QuestionSet/QuestionSetsQuestionPage.dart';
import 'package:quizzes/flash%20card/FlashCardPage.dart';
import 'package:quizzes/timer/TimerPage.dart';
import '../LandingPage.dart';

// introduction of const modifier. Why???
void main() => runApp(ProviderScope(child: QuizApp()));

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          iconTheme: const IconThemeData(color: Colors.white, size: 30),
          inputDecorationTheme: const InputDecorationTheme(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              hintStyle: TextStyle(color: Colors.grey)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(primary: Colors.blue[400]))),
      home: QuestionSetPage(),
    );
  }
}
