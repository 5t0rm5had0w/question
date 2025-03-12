import 'dart:async';

import 'package:flutter/material.dart';
import 'package:garant_project/model/question_model.dart';
import 'package:garant_project/screen/result/result_screen.dart';
import 'package:garant_project/utils/extensions.dart';
import 'package:garant_project/view/top_position_item_view.dart';
import 'package:provider/provider.dart';

import '../provider/providers.dart';
import '../utils/list.dart';
import '../utils/utils.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Timer _timer = Timer(Duration.zero, () {});
  int total = 1200;
  int _start = 0;
  final _pageController = PageController(initialPage: 0, keepPage: true);

  void startTimer() {
    const oneSec = Duration(milliseconds: 1000);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void stopTimer() {
    _timer.cancel();
  }

  @override
  void dispose() {
    stopTimer();
    super.dispose();
  }

  @override
  void initState() {
    _start = total;
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          (MediaQuery.of(context).viewPadding.top + 18).height,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            // width: getScreenWidth(context),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.grey.shade200),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.timer,
                          size: 18,
                          color: Colors.blue,
                        ),
                        4.width,
                        Text(formatHHMMSS(_start)),
                        4.width
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          8.height,
          SizedBox(
            height: 60,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                primary: false,
                itemCount: questionList.length,
                itemBuilder: (context, position) {
                  var item = questionList[position];
                  return TopPositionItemView(item: item, position: position, questionLength: questionList.length);
                }),
          ),
          16.height,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Savol: ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                4.height,
                Consumer<Providers>(builder: (context, provider, child) {
                  return Text(
                    questionList[provider.questionPosition].questionText,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  );
                }),
              ],
            ),
          ),
          8.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Javoblar",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          ),
          8.height,
          Consumer<Providers>(builder: (context, provider, child) {
            return Expanded(
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: questionList.length,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (value) {
                    provider.questionPosition = value;
                  },
                  itemBuilder: (context, index) {
                    return ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      children: [
                        _answerButton(
                            provider: provider,
                            pos: "A",
                            answer: questionList[provider.questionPosition].answerA,
                            onTap: () {
                              _onTapAnswer(provider, questionList[provider.questionPosition].answerA);
                            }),
                        _answerButton(
                            provider: provider,
                            pos: "B",
                            answer: questionList[provider.questionPosition].answerB,
                            onTap: () {
                              _onTapAnswer(provider, questionList[provider.questionPosition].answerB);
                            }),
                        _answerButton(
                            provider: provider,
                            pos: "C",
                            answer: questionList[provider.questionPosition].answerC,
                            onTap: () {
                              _onTapAnswer(provider, questionList[provider.questionPosition].answerC);
                            }),
                        _answerButton(
                            provider: provider,
                            pos: "D",
                            answer: questionList[provider.questionPosition].answerD,
                            onTap: () {
                              _onTapAnswer(provider, questionList[provider.questionPosition].answerD);
                            }),
                      ],
                    );
                  }),
            );
          }),
          Consumer<Providers>(builder: (context, provider, child) {
            return Row(
              children: [
                IconButton(
                    onPressed: () {
                      if (provider.questionPosition <= 0) {
                        return;
                      }
                      provider.questionPosition = provider.questionPosition - 1;
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                    )),
                provider.getAllAnswers().length == questionList.length
                    ? Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              stopTimer();
                              var corrects =
                                  provider.getAllAnswers().where((e) => (e.myAnswer?.isCorrect ?? false) == true).toList();
                              var wrongs =
                                  provider.getAllAnswers().where((e) => (e.myAnswer?.isCorrect ?? false) == false).toList();
                              startScreen(context,
                                  screen: ResultScreen(
                                    totalTime: total,
                                    currentTime: _start,
                                    correctAnswers: corrects,
                                    totalQuestions: questionList.length,
                                    wrongAnswers: wrongs,
                                  ));
                            },
                            child: Text("Tugatish")),
                      )
                    : Expanded(
                        child: Center(
                            child: Text(
                        "${provider.questionPosition + 1}/${questionList.length}",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ))),
                IconButton(
                    onPressed: () {
                      if (provider.questionPosition >= questionList.length - 1) {
                        return;
                      }
                      provider.questionPosition = provider.questionPosition + 1;
                    },
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.grey,
                    )),
              ],
            );
          }),
          20.height
        ],
      ),
    );
  }
}

void _onTapAnswer(Providers provider, AnswerModel answer) {
  AnswerModel? ans = provider.itemMyAnswer(questionList[provider.questionPosition].id);
  if (ans != null) {
    return;
  }
  provider.addMyAnswers(questionList[provider.questionPosition].copyWith(), answer);
}

Widget _answerButton({required Providers provider, required String pos, required AnswerModel answer, required Function() onTap}) {
  AnswerModel? ans = provider.itemMyAnswer(questionList[provider.questionPosition].id);
  return InkWell(
    onTap: () {
      onTap();
    },
    child: Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: getAnswerColor(ans, answer)
            // color: ans == null
            //     ? Colors.white
            //     : answer.isCorrect
            //         ? Colors.green
            //         : ans.id == answer.id
            //             ? ans.isCorrect
            //                 ? Colors.green
            //                 : Colors.red
            //             : Colors.white
            ),
        child: Row(
          children: [
            Text(pos, style: TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.w500)),
            8.width,
            Expanded(
                child: Text(
              answer.answerText,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            )),
          ],
        ),
      ),
    ),
  );
}

Color getAnswerColor(AnswerModel? ans, AnswerModel answer) {
  if (ans == null) return Colors.white;
  if (answer.isCorrect) return Colors.green;
  return ans.id == answer.id ? (ans.isCorrect ? Colors.green : Colors.red) : Colors.white;
}
