import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garant_project/model/question_model.dart';
import 'package:garant_project/provider/providers.dart';
import 'package:garant_project/screen/main_screen.dart';
import 'package:garant_project/utils/extensions.dart';
import 'package:garant_project/utils/list.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../utils/utils.dart';

class ResultScreen extends StatelessWidget {
  final int totalTime;
  final int currentTime;
  final int totalQuestions;
  final List<QuestionModel> correctAnswers;
  final List<QuestionModel> wrongAnswers;

  const ResultScreen(
      {super.key,
      required this.totalTime,
      required this.currentTime,
      required this.totalQuestions,
      required this.correctAnswers,
      required this.wrongAnswers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          (MediaQuery.of(context).viewPadding.top + 18).height,
          Expanded(
              child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 60),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.white),
            child: ListView(
              children: [
                CircularPercentIndicator(
                  radius: 60.0,
                  lineWidth: 16.0,
                  percent: percent / 100,
                  center: Text("${(percent).toInt()}%"),
                  progressColor: getColor,
                  backgroundWidth: 10,
                  animation: true,
                  circularStrokeCap: CircularStrokeCap.round,
                  animationDuration: 1000,
                  startAngle: 90,
                ),
                16.height,
                Text(
                  "Yakunlandi",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                8.height,
                Text(
                  "Afsuski sizga ball taqdim etilmadi",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                4.height,
                Text(
                  "Ja’mi to’plangan ballaringiz soni: 0 ta",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Colors.grey),
                ),
                20.height,
                Text(
                  "Umumiy testlar soni: $totalQuestions",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Colors.grey),
                ),
                12.height,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(30),
                          decoration:
                              BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.green.withValues(alpha: 0.2)),
                          child: Column(
                            children: [
                              Text(
                                correctAnswers.length.toString(),
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.green),
                              ),
                              Text(
                                "To’g’ri javob",
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                      ),
                      10.width,
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(30),
                          decoration:
                              BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.red.withValues(alpha: 0.2)),
                          child: Column(
                            children: [
                              Text(
                                wrongAnswers.length.toString(),
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.red),
                              ),
                              Text(
                                "To’g’ri javob",
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                12.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.timer,
                      size: 18,
                      color: Colors.blue,
                    ),
                    4.width,
                    Text(
                      "${formatHHMMSS(totalTime)} / ${formatHHMMSS(currentTime)}",
                      style: TextStyle(color: Colors.orange, fontSize: 15),
                    ),
                    4.width
                  ],
                ),
                14.height,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: InkWell(
                    onTap: () {
                      Provider.of<Providers>(context, listen: false).clearData();
                      startAndRemoveScreen(context, screen: MainScreen());
                    },
                    child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.blue),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.refresh,
                              color: Colors.white,
                            ),
                            4.width,
                            Text(
                              "Qayta urinish",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                  ),
                ),
                12.height,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: InkWell(
                    onTap: () {
                      SystemNavigator.pop();
                    },
                    child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.grey.shade200),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            24.height,
                            Text(
                              "Chiqish",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  double get percent {
    return (correctAnswers.length * 100) / questionList.length;
  }

  Color get getColor {
    return percent < 50
        ? Colors.red
        : percent < 90
            ? Colors.orange
            : Colors.green;
  }
}
