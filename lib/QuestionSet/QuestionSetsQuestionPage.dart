import 'package:flutter/material.dart';
import 'package:quizzes/QuestionSet/modalSheetModel.dart';

class QuestionSetsQuestionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(child: const Icon(Icons.add),onPressed: (){
          modalSheetMethod(context);
        },),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 5, 16, 2),
              child: Material(
                elevation: 2,
                child: ListTile(
                  tileColor: Colors.grey[100],
                  title: Text(
                    "What is a list?",
                    style: TextStyle(
                        color: Colors.blue[300],
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    "We are tired",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
