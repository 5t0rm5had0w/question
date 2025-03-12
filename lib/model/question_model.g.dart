// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    QuestionModel(
      (json['id'] as num).toInt(),
      json['questionText'] as String,
      AnswerModel.fromJson(json['answerA'] as Map<String, dynamic>),
      AnswerModel.fromJson(json['answerB'] as Map<String, dynamic>),
      AnswerModel.fromJson(json['answerC'] as Map<String, dynamic>),
      AnswerModel.fromJson(json['answerD'] as Map<String, dynamic>),
      myAnswer: json['myAnswer'] == null
          ? null
          : AnswerModel.fromJson(json['myAnswer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuestionModelToJson(QuestionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'questionText': instance.questionText,
      'answerA': instance.answerA,
      'answerB': instance.answerB,
      'answerC': instance.answerC,
      'answerD': instance.answerD,
      'myAnswer': instance.myAnswer,
    };

AnswerModel _$AnswerModelFromJson(Map<String, dynamic> json) => AnswerModel(
      (json['id'] as num).toInt(),
      json['answerText'] as String,
      isCorrect: json['isCorrect'] as bool? ?? false,
    );

Map<String, dynamic> _$AnswerModelToJson(AnswerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'answerText': instance.answerText,
      'isCorrect': instance.isCorrect,
    };

MyAnswerModel _$MyAnswerModelFromJson(Map<String, dynamic> json) =>
    MyAnswerModel(
      (json['questionId'] as num).toInt(),
      AnswerModel.fromJson(json['myAnswer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyAnswerModelToJson(MyAnswerModel instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'myAnswer': instance.myAnswer,
    };
