import 'package:flutter/material.dart';

Widget header(BuildContext context, List<Widget> children) {
  children.insert(0, Image.asset("assets/images/header.png", width: MediaQuery.sizeOf(context).width));
  return Stack(children: children);
}
