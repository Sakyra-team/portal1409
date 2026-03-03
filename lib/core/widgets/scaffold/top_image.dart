import 'package:flutter/material.dart';

Widget header(List<Widget> children) {
  children.insert(0, Image.asset("assets/images/header.png"));
  return Stack(children: children);
}
