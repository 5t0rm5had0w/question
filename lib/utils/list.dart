import 'package:garant_project/model/question_model.dart';

List<QuestionModel> get questionList {
  return [
    QuestionModel(
        1,
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        AnswerModel(1, "Javob A1", isCorrect: true),
        AnswerModel(2,
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an u"),
        AnswerModel(3, "Javob C"),
        AnswerModel(4, "Javob D")),
    QuestionModel(2, "2-Savol", AnswerModel(1, "Javob A2"), AnswerModel(2, "Javob B"), AnswerModel(3, "Javob C", isCorrect: true),
        AnswerModel(4, "Javob D")),
    QuestionModel(3, "3-Savol", AnswerModel(1, "Javob A3"), AnswerModel(2, "Javob B", isCorrect: true), AnswerModel(3, "Javob C"),
        AnswerModel(4, "Javob D")),
    QuestionModel(4, "4-Savol", AnswerModel(1, "Javob A4"), AnswerModel(2, "Javob B"), AnswerModel(3, "Javob C"),
        AnswerModel(4, "Javob D", isCorrect: true)),
    QuestionModel(5, "5-Savol", AnswerModel(1, "Javob A5", isCorrect: true), AnswerModel(2, "Javob A"), AnswerModel(3, "Javob C"),
        AnswerModel(4, "Javob D")),
    QuestionModel(6, "6-Savol", AnswerModel(1, "Javob A6"), AnswerModel(2, "Javob B"), AnswerModel(3, "Javob C", isCorrect: true),
        AnswerModel(4, "Javob D")),
    QuestionModel(7, "7-Savol", AnswerModel(1, "Javob A7"), AnswerModel(2, "Javob B", isCorrect: true), AnswerModel(3, "Javob C"),
        AnswerModel(4, "Javob D")),
    QuestionModel(8, "8-Savol", AnswerModel(1, "Javob A8"), AnswerModel(2, "Javob B"), AnswerModel(3, "Javob C"),
        AnswerModel(4, "Javob D", isCorrect: true)),
    QuestionModel(9, "9-Savol", AnswerModel(1, "Javob A9", isCorrect: true), AnswerModel(2, "Javob B"), AnswerModel(3, "Javob C"),
        AnswerModel(4, "Javob D")),
    QuestionModel(10, "10-Savol", AnswerModel(1, "Javob A10"), AnswerModel(2, "Javob B"),
        AnswerModel(3, "Javob C", isCorrect: true), AnswerModel(4, "Javob D")),
    QuestionModel(11, "11-Savol", AnswerModel(1, "Javob A11"), AnswerModel(2, "Javob B", isCorrect: true),
        AnswerModel(3, "Javob C"), AnswerModel(4, "Javob D")),
    QuestionModel(12, "12-Savol", AnswerModel(1, "Javob A12"), AnswerModel(2, "Javob B"), AnswerModel(3, "Javob C"),
        AnswerModel(4, "Javob D", isCorrect: true)),
  ];
}
