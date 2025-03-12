import 'package:flutter/material.dart';

double getScreenHeight(context) {
  return MediaQuery.of(context).size.height;
}

double getScreenWidth(context) {
  return MediaQuery.of(context).size.width;
}

String formatHHMMSS(int seconds) {
  // int hours = (seconds / 3600).truncate();
  seconds = (seconds % 3600).truncate();
  int minutes = (seconds / 60).truncate();

  // String hoursStr = (hours).toString().padLeft(2, '0');
  String minutesStr = (minutes).toString().padLeft(2, '0');
  String secondsStr = (seconds % 60).toString().padLeft(2, '0');

  // if (hours == 0) {
  //   return "$minutesStr:$secondsStr";
  // }
//$hoursStr:
  return "$minutesStr:$secondsStr";
}


Future startScreen(BuildContext context, {required Widget screen}) {
  return Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

Future startAndRemoveScreen(BuildContext context, {required Widget screen}) {
  return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => screen), (route) => false);
}
