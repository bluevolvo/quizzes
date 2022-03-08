import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizzes/RiverpodModel.dart';

void setQuestionNameMethod(context) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SetQuestionNameAlertDialog();
      });
}

final riverPodModelProvider2 = ChangeNotifierProvider((ref) => RiverpodModel());

class SetQuestionNameAlertDialog extends ConsumerStatefulWidget {
  @override
  _SetQuestionNameAlertDialogState createState() =>
      _SetQuestionNameAlertDialogState();
}

class _SetQuestionNameAlertDialogState
    extends ConsumerState<SetQuestionNameAlertDialog> {
  final TextEditingController questionNameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    questionNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final questionNameRef = ref.watch(riverPodModelProvider2);
    return AlertDialog(
      title: Text("Name of Question Set",
          style: TextStyle(
              color: Colors.blue[400],
              fontSize: 20,
              fontWeight: FontWeight.w600)),
      content: TextField(
        controller: questionNameController,
      ),
      actions: [
        Center(
            child: ElevatedButton(
                onPressed: () {
                  questionNameRef.addTitleT(questionNameController.text);
                  print(questionNameRef.questionSet.first.title);

                  Navigator.pop(context);
                },
                child: const Text("Save"))),
      ],
    );
  }
}
