import 'package:flutter/material.dart';

class SetQuestionTextFields extends StatelessWidget {
  final TextEditingController questionInput;
  final TextEditingController answerInput;

  SetQuestionTextFields(
      {required this.questionInput, required this.answerInput});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(25, 7, 15, 0),
          child: Text(
            "Question",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
          child: TextField(
            controller: questionInput,
          ),
        ),
        ////////
        const Padding(
          padding: EdgeInsets.fromLTRB(25, 7, 15, 0),
          child: Text(
            "Answer",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
          child: TextField(
            controller: answerInput,
          ),
        ),
      ],
    );
  }
}
