import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:quizzes/QuestionSet/QuestionSetsQuestionPage.dart';
import 'package:quizzes/QuestionSet/SetQuestionName.dart';
import 'package:quizzes/QuestionSet/modalSheetModel.dart';
import 'package:quizzes/RiverpodModel.dart';

final riverpodModelProvider =
ChangeNotifierProvider((ref) => RiverpodModel());

class QuestionSetPage extends ConsumerWidget {
  // const QuestionSetPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionSetRef = ref.watch(riverpodModelProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[50],
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                setQuestionNameMethod(context);
// modalSheetMethod(context);
              },
              icon: Icon(
                Icons.add,
                size: 25,
                color: Colors.blue[400],
              ))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Question Set List",
              style: TextStyle(
                  color: Colors.blue[400],
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: questionSetRef.questionSet.length,
                itemBuilder: (BuildContext context, int index) {
                  return Tiles(
                    title: questionSetRef.questionSet[index].title,
                  );
                }),
          )
        ],
      ),
    );
  }
}

class Tiles extends StatelessWidget {
  String title;

  Tiles({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
      child: Material(
        elevation: 2,
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return QuestionSetsQuestionPage();
            }));
          },
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(
                  color: Colors.blue[400],
                  fontSize: 17,
                  fontWeight: FontWeight.w400),
            ),
            tileColor: Colors.white,
            // subtitle: Text(
            //   "${questionSets[index].numberOfQuestions}  number of questions",
            // ),
            leading: const Icon(
              Icons.add_box_outlined,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
