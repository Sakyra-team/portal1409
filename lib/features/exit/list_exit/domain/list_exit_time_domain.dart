import 'package:flutter/material.dart';

String calcListExitDate(String text) {
  final splitText = text.split(" ");
  final String day = splitText[1];
  late String mount = splitText[2];
  debugPrint(splitText[3]);
  final String year = splitText[3].substring(splitText[3].length - 2);

  if (splitText[2] == "Jan") {
    mount = "01";
  } else if (splitText[2] == "Feb") {
    mount = "02";
  } else if (splitText[2] == "Mar") {
    mount = "03";
  } else if (splitText[2] == "Apr") {
    mount = "04";
  } else if (splitText[2] == "May") {
    mount = "05";
  } else if (splitText[2] == "June") {
    mount = "06";
  } else if (splitText[2] == "July") {
    mount = "07";
  } else if (splitText[2] == "Aug") {
    mount = "08";
  } else if (splitText[2] == "Sept") {
    mount = "09";
  } else if (splitText[2] == "Oct") {
    mount = "10";
  } else if (splitText[2] == "Nov") {
    mount = "11";
  } else if (splitText[2] == "Dec") {
    mount = "12";
  }

  return "$day:$mount:$year";
}

String calcListExitTime(String text) {
  return "";
}
