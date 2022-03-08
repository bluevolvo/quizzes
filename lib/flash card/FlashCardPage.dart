import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quizzes/flash%20card/FlashCard%20Constructor.dart';
import 'FlashCardWidget.dart';

class FlashCardPage extends StatefulWidget {
  // const FlashCardPage({Key key}) : super(key: key);

  @override
  _FlashCardPageState createState() => _FlashCardPageState();
}

class _FlashCardPageState extends State<FlashCardPage> {
  List<FlashCardConstructor> flashcards = [
    FlashCardConstructor(
        question: "What is accounting?", answer: "It is a business course"),
    FlashCardConstructor(
        question: "When did Ghana gain independence?",
        answer: "6th March 1957"),
    FlashCardConstructor(
        question: "Who is the founder of apple?", answer: "Steve Jobs"),
    FlashCardConstructor(
        question: "Health workers in ambulances are called?",
        answer: "Paramedics"),
    FlashCardConstructor(
        question: "If ending school is graduation, beginning it is?",
        answer: "Matriculation"),
    FlashCardConstructor(
        question: "Yusera's favourite series?", answer: "Euphoria"),
    FlashCardConstructor(question: "Favourite anime?", answer: "Naruto"),
  ];
  bool showM = true;

  String tot(
    String question,
    String answer,
    bool show,
  ) {
    late String t;

    show ? t = question : t = answer;

   // print(t);
  //  print(show);
    return t;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  itemCount: flashcards.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              if (showM) {
                                setState(() {
                                  showM = false;
                                });
                               // print(showM);
                              } else {
                                setState(() {
                                  showM = true;
                                });
                               // print(showM);
                              }
                            },
                            child: FlashCardWidget(
                              question: tot(
                                flashcards[index].question,
                                flashcards[index].answer,
                                showM,
                              ),
                            )),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Tap for answer and swipe for next card",
                            style: TextStyle(color: Colors.black38),
                          ),
                        )
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
