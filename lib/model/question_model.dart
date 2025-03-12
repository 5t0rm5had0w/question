import 'package:json_annotation/json_annotation.dart';

part 'question_model.g.dart';

@JsonSerializable()
class QuestionModel {
  final int id;
  final String questionText;
  final AnswerModel answerA;
  final AnswerModel answerB;
  final AnswerModel answerC;
  final AnswerModel answerD;
   AnswerModel? myAnswer;

  QuestionModel(
      this.id,
      this.questionText,
      this.answerA,
      this.answerB,
      this.answerC,
      this.answerD, {
        this.myAnswer,
      });

  factory QuestionModel.fromJson(Map<String, dynamic> json) => _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);

  QuestionModel copyWith({
    int? id,
    String? questionText,
    AnswerModel? answerA,
    AnswerModel? answerB,
    AnswerModel? answerC,
    AnswerModel? answerD,
    AnswerModel? myAnswer,
  }) {
    return QuestionModel(
      id ?? this.id,
      questionText ?? this.questionText,
      answerA ?? this.answerA,
      answerB ?? this.answerB,
      answerC ?? this.answerC,
      answerD ?? this.answerD,
      myAnswer: myAnswer ?? this.myAnswer,
    );
  }
}


@JsonSerializable()
class AnswerModel {
  final int id;
  final String answerText;
  final bool isCorrect;

  AnswerModel(this.id, this.answerText, {this.isCorrect = false});

  factory AnswerModel.fromJson(Map<String, dynamic> json) => _$AnswerModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerModelToJson(this);
}

@JsonSerializable()
class MyAnswerModel {
  final int questionId;
  // final int index;
  // final AnswerModel answer;
  final AnswerModel myAnswer;

  MyAnswerModel(this.questionId, this.myAnswer);

  factory MyAnswerModel.fromJson(Map<String, dynamic> json) => _$MyAnswerModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyAnswerModelToJson(this);
}
