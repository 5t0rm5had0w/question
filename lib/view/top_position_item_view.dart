import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/question_model.dart';
import '../provider/providers.dart';

class TopPositionItemView extends StatelessWidget {
  const TopPositionItemView({super.key, required this.item, required this.position, required this.questionLength});

  final QuestionModel item;
  final int position;
  final int questionLength;

  @override
  Widget build(BuildContext context) {
    return Consumer<Providers>(builder: (context, provider, child) {
      AnswerModel? ans = provider.itemMyAnswer(item.id);
      return InkWell(
        onTap: () {
          provider.questionPosition = position;
        },
        child: Padding(
          padding: EdgeInsets.only(left: (position == 0) ? 16.0 : 8.0, right: (position == questionLength - 1) ? 16 : 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (provider.questionPosition==position) Icon(Icons.arrow_drop_down, color: Colors.blue),
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: ans==null?Colors.white:ans.isCorrect?Colors.green:Colors.red),
                child: Center(child: Text((position + 1).toString())),
              )
            ],
          ),
        ),
      );
    });
  }
}
