import 'dart:async';
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:quizzes/QuestionSet/QuestionSetConstructor.dart';

class RiverpodModel extends ChangeNotifier {
  final List<QuestionSetConstructor> _questionSetList = [
    QuestionSetConstructor(title: "t"),
  ];

  UnmodifiableListView<QuestionSetConstructor> get questionSet {
    return UnmodifiableListView(_questionSetList);
  }

  void addTitleT(String title) {
    final addQuestionTitle = (QuestionSetConstructor(title: title));
    _questionSetList.add(addQuestionTitle);
    notifyListeners();
  }

  int get count {
    return questionSet.length;

  }
}
