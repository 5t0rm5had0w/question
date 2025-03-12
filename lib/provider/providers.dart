import 'package:flutter/cupertino.dart';
import 'package:garant_project/model/question_model.dart';

class Providers extends ChangeNotifier {
  Providers();

  final List<QuestionModel> _myAnswers = [];

  int _questionPosition = 0;

  int get questionPosition => _questionPosition;

  set questionPosition(int value) {
    _questionPosition = value;
    notifyListeners();
  }

  void addMyAnswers(QuestionModel question, AnswerModel answer) {
    int index = _myAnswers.indexWhere((element) => element.id == question.id);
    question.myAnswer = answer;
    if (index != -1) {
      _myAnswers[index] = question;
    } else {
      _myAnswers.add(question);
    }
    notifyListeners();
  }

  List<QuestionModel> getAllAnswers() {
    return _myAnswers;
  }

  AnswerModel? itemMyAnswer(int questionId) {
    AnswerModel? it = _myAnswers.where((element) => element.id == questionId).firstOrNull?.myAnswer;
    return it;
  }

  void clearData() {
    _myAnswers.clear();
    _questionPosition = 0;
    notifyListeners();
  }
}
